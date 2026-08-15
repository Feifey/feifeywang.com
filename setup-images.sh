#!/bin/bash
# ============================================================================
# setup-images.sh — populate assets/images/ so the site's images actually load
#
#   cd ~/Documents/Claude/Projects/feifeywang.com
#   bash setup-images.sh
#
# What it does:
#   1. Deletes the 0-byte placeholder files left by the previous failed run
#      (these are why every image on feifeywang.com is currently broken)
#   2. Copies the case-study images from the flat originals already in
#      assets/images/ into the folder structure the HTML expects
#   3. Downloads the about + creatives photos from your Webflow CDN
#      (they exist nowhere on this Mac — Webflow is the only source)
#   4. Verifies every path referenced by the HTML and reports what's missing
#
# Safe to re-run. Everything is overwritten, nothing is deleted except 0-byte files.
# ============================================================================

set -uo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO/assets/images"
DST="$REPO/assets/images"
CDN="https://cdn.prod.website-files.com/68f91c991c92a747eb5b3bc1"

if [ ! -d "$SRC" ]; then
  echo "ERROR: $SRC not found. Run this from inside the repo."
  exit 1
fi

echo "Repo: $REPO"
echo ""

# --- Folder structure --------------------------------------------------------
mkdir -p "$DST"/{common,home,about,creatives}
mkdir -p "$DST"/toilet/{design-system,research,screens,animations}
mkdir -p "$DST"/industrious/{research,synthesis,recommendations,deliverables}
mkdir -p "$DST"/wellcome/{branding,screens,3d-audio,animations}

# --- Step 1: clear the 0-byte placeholders -----------------------------------
echo "[1/4] Removing 0-byte placeholder files..."
n_zero=$(find "$DST"/{common,home,about,creatives,toilet,industrious,wellcome} \
           -type f -size 0 2>/dev/null | wc -l | tr -d ' ')
find "$DST"/{common,home,about,creatives,toilet,industrious,wellcome} \
     -type f -size 0 -delete 2>/dev/null
echo "      removed $n_zero placeholder(s)"
echo ""

# --- Step 2: copy local originals into place ---------------------------------
n_ok=0; n_miss=0; missing_list=""

cp_rename() {
  local src="$SRC/$1" dst="$DST/$2"
  if [ -f "$src" ] && [ -s "$src" ]; then
    cp -f "$src" "$dst" && n_ok=$((n_ok+1))
  else
    echo "      MISSING SOURCE: $1"
    missing_list="$missing_list\n  $2  (needed source: $1)"
    n_miss=$((n_miss+1))
  fi
}

echo "[2/4] Copying case-study images from local originals..."

# Logo
cp_rename "ff.svg" "common/logo-ff.svg"

# Homepage cards
cp_rename "Frame 16.png"           "home/card-toilet.png"
cp_rename "Industrious_Cover.png"  "home/card-industrious.png"
cp_rename "Frame 17.png"           "home/card-wellcome.png"

# Toilet Delivery
cp_rename "Frame 16.png"           "toilet/hero.png"
cp_rename "TD.png"                 "toilet/screens/td-overview.png"
cp_rename "TD Desk Research.png"   "toilet/research/desk-research.png"
cp_rename "Toilet Info 1.png"      "toilet/screens/info-1.png"
cp_rename "Toliet_Delivery.png"    "toilet/screens/full-app-flow.png"
cp_rename "Design System.png"      "toilet/design-system/00-overview.png"
# Animations — use the COMPRESSED versions (2-3 MB each instead of 12-23 MB).
# If these are missing, run:  git ls-files -d -z | xargs -0 git restore --
cp_rename "Compress GIF/Find Nearest.gif"    "toilet/animations/find-nearest.gif"
cp_rename "Compress GIF/Different Modes.gif" "toilet/animations/different-modes.gif"
cp_rename "commute options.gif"              "toilet/animations/commute-options.gif"

# Industrious
cp_rename "Industrious_Cover.png"  "industrious/hero.png"
cp_rename "Industrious.png"        "industrious/deliverables/final-cover.png"
cp_rename "Screenshot 2026-01-24 at 07.52.43.png" "industrious/research/research-plan.png"
cp_rename "Screenshot 2026-01-24 at 07.53.51.png" "industrious/synthesis/affinity-outcomes.png"
cp_rename "Screenshot 2026-02-07 at 15.37.25.png" "industrious/recommendations/01-conversation-starters.png"
cp_rename "Screenshot 2026-02-07 at 16.26.19.png" "industrious/recommendations/02-peer-events.png"
cp_rename "Screenshot 2026-02-07 at 17.53.15.png" "industrious/recommendations/03-nuanced-space.png"

# Wellcome Collection
cp_rename "Frame 17.png"                       "wellcome/hero.png"
cp_rename "Wellcome-collection.png"            "wellcome/branding/wellcome-photos-logo.png"
cp_rename "Wellcome Collection mobile app.png" "wellcome/screens/visitor-utility.png"
cp_rename "Map 1 - Eng.png"                    "wellcome/screens/map.png"
cp_rename "3D Audio.png"                       "wellcome/3d-audio/concept.png"
cp_rename "3D Audio Page Being Human.png"      "wellcome/3d-audio/being-human.png"
cp_rename "3D Audio Page 1880 THAT.png"        "wellcome/3d-audio/1880.png"
# Compressed versions — 3.46 MB and 2.86 MB vs 23 MB and 12 MB uncompressed.
# Note the typo "Exhibtion" — that's the real filename in the repo, not a mistake here.
cp_rename "Compress GIF/Exhibition List.gif"   "wellcome/animations/exhibition-list.gif"
cp_rename "Compress GIF/Exhibtion Page.gif"    "wellcome/animations/exhibition-page.gif"

echo "      $n_ok copied, $n_miss missing"
if [ "$n_miss" -gt 0 ] && [ ! -d "$SRC/Compress GIF" -o -z "$(ls -A "$SRC/Compress GIF" 2>/dev/null | grep -v '^\.DS_Store$')" ]; then
  echo ""
  echo "      >> The 'Compress GIF' folder is empty. Those files are in git but"
  echo "         missing from this Mac. Restore them and re-run this script:"
  echo ""
  echo "             git ls-files -d -z | xargs -0 git restore --"
  echo ""
fi
echo ""

# --- Step 3: download about + creatives from Webflow -------------------------
echo "[3/4] Downloading about + creatives photos from Webflow..."

n_dl=0; n_dlfail=0
get() {  # get <cdn-filename> <dest-relative-path>
  local out="$DST/$2"
  if [ -s "$out" ]; then n_dl=$((n_dl+1)); return; fi
  if curl -fsSL --retry 2 -o "$out" "$CDN/$1"; then
    n_dl=$((n_dl+1))
  else
    echo "      FAILED: $2"
    rm -f "$out"
    n_dlfail=$((n_dlfail+1))
  fi
}

# --- about ---
get "6992a254afc583155dbfb11c_003377530004.jpg" "about/portrait.jpg"
get "699299d624b9e56702d07e9c_IMG_1500.JPG"     "about/lifestyle-beach.jpg"
get "69929f1c8c56555d86f53a65_IMG_7745.JPG"     "about/lifestyle-park.jpg"
get "69929f1d7048ec13ec3574d7_IMG_4221.JPEG"    "about/lifestyle-cafe.jpg"
get "69929df743a5267667de8e19_DSC_0136.JPG"     "about/lifestyle-lens.jpg"

# --- creatives: Design (13) ---
get "68f91f2b491c1058e1037f9b_BuildingBlocks-min.png"                "creatives/design-01.png"
get "68f91f2b491c1058e1037f7d_The-6.png"                             "creatives/design-02.png"
get "68f91f2b491c1058e1037fcb_The-7.png"                             "creatives/design-03.png"
get "68f91f2b491c1058e1037fb9_The-4-min.png"                         "creatives/design-04.png"
get "68f91f2b491c1058e1037f8d_The-5.png"                             "creatives/design-05.png"
get "68f91f2b491c1058e1037fa4_Look-Closer-Animation.gif"             "creatives/design-06.gif"
get "68f91f2b491c1058e1037f5d_SocialPurpose_Project2.png"            "creatives/design-07.png"
get "68f91f2b491c1058e1037fab_Unit1_W1%202.png"                      "creatives/design-08.png"
get "68f91f2b491c1058e1037fe9_IMG_6799.jpg"                          "creatives/design-09.jpg"
get "68f91f2b491c1058e1037f6d_Project3_miscommunication.png"         "creatives/design-10.png"
get "68f91f2b491c1058e1037fda_IMG_6820.jpg"                          "creatives/design-11.jpg"
get "68f91f2b491c1058e1037fa2_GuiltyPleasureFinal-ezgif.com-optimize.gif" "creatives/design-12.gif"
get "68f91f2b491c1058e1037fc2_Unit4-9.jpg"                           "creatives/design-13.jpg"

# --- creatives: Photography (12) ---
get "68f91f3719cb2603bc03145a_003377530026%202.jpg" "creatives/photo-01.jpg"
get "68f91f3619cb2603bc031429_003377530014%202.jpg" "creatives/photo-02.jpg"
get "68f91f3719cb2603bc031437_IMG_6891%202.jpg"     "creatives/photo-03.jpg"
get "68f91f3719cb2603bc031442_IMG_9382%205.jpg"     "creatives/photo-04.jpg"
get "68f91f3719cb2603bc03144d_006693060024%202.jpg" "creatives/photo-05.jpg"
get "68f91f3619cb2603bc03141c_003091130035%202.jpg" "creatives/photo-06.jpg"
get "68f91f3619cb2603bc0313f7_003091120004%202.jpg" "creatives/photo-07.jpg"
get "68f91f3719cb2603bc031466_006693040011%202.jpg" "creatives/photo-08.jpg"
get "68f91f3619cb2603bc031404_003091130008%202.jpg" "creatives/photo-09.jpg"
get "68f91f3619cb2603bc0313e9_003091120025%202.jpg" "creatives/photo-10.jpg"
get "68f91f3619cb2603bc031410_001564120010%202.jpg" "creatives/photo-11.jpg"
get "68f91f3619cb2603bc0313de_82040015%202.jpg"     "creatives/photo-12.jpg"

# --- creatives: + More (9) ---
get "68f91f52daf29399f877bf64_Mission_Complete-min.jpg" "creatives/more-01.jpg"
get "68f91f52daf29399f877bf4c_The_Asthmatic.JPG"        "creatives/more-02.jpg"
get "68f91f52daf29399f877bf1c_Heterogeneous.jpg"        "creatives/more-03.jpg"
get "68f91f52daf29399f877bf29_The_Salvation.jpg"        "creatives/more-04.jpg"
get "68f91f52daf29399f877bf59_2019-2020.JPG"            "creatives/more-05.jpg"
get "68f91f52daf29399f877bf6e_IMG_6200.jpg"             "creatives/more-06.jpg"
get "68f91f52daf29399f877bf10_Missing.JPG"              "creatives/more-07.jpg"
get "68f91f52daf29399f877bf34_The_Breakdown.png"        "creatives/more-08.png"
get "68f91f52daf29399f877bf3e_Time_Stairway.JPG"        "creatives/more-09.jpg"

echo "      $n_dl downloaded/present, $n_dlfail failed"
echo ""

# --- Step 4: verify every path the HTML asks for -----------------------------
echo "[4/4] Verifying against the HTML..."
cd "$REPO"
bad=0
refs=$(grep -ohE 'src="(assets/[^"]+)"' ./*.html | sed -E 's/^src="//; s/"$//' | sort -u)
while IFS= read -r p; do
  [ -z "$p" ] && continue
  if [ ! -f "$p" ]; then
    echo "  404 (no file):  $p"; bad=$((bad+1))
  elif [ ! -s "$p" ]; then
    echo "  0 bytes:        $p"; bad=$((bad+1))
  fi
done <<< "$refs"

echo ""
echo "=================================================="
if [ "$bad" -eq 0 ]; then
  echo "All images resolve. Open index.html in a browser to check, then publish:"
  echo ""
  echo "    git add -A"
  echo "    git commit -m \"Add site images\""
  echo "    git push"
  echo ""
  echo "GitHub Pages redeploys in ~1 minute."
else
  echo "$bad image path(s) still broken — see the list above."
fi
echo "=================================================="
