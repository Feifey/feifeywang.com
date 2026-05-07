#!/bin/bash
# Run this once on your Mac to populate assets/images/ with the right files
# from ~/Desktop/重用. Re-runnable — uses cp -f to overwrite anything stale.
#
# Usage:
#   cd ~/Documents/Claude/Projects/feifeywang.com
#   bash setup-images.sh
#
# After running, your site's images should all resolve. Open index.html
# in a browser to verify.

SRC="$HOME/Desktop/重用"
DST="$HOME/Documents/Claude/Projects/feifeywang.com/assets/images"

if [ ! -d "$SRC" ]; then
  echo "ERROR: Source folder not found: $SRC"
  exit 1
fi

echo "Source:      $SRC"
echo "Destination: $DST"
echo ""

# === Folder structure ===
mkdir -p "$DST/common"
mkdir -p "$DST/home"
mkdir -p "$DST/toilet/design-system"
mkdir -p "$DST/toilet/research"
mkdir -p "$DST/toilet/screens"
mkdir -p "$DST/toilet/animations"
mkdir -p "$DST/industrious/research"
mkdir -p "$DST/industrious/synthesis"
mkdir -p "$DST/industrious/recommendations"
mkdir -p "$DST/industrious/deliverables"
mkdir -p "$DST/wellcome/branding"
mkdir -p "$DST/wellcome/screens"
mkdir -p "$DST/wellcome/3d-audio"
mkdir -p "$DST/wellcome/animations"
mkdir -p "$DST/about"
mkdir -p "$DST/creatives"

# Helper: copy with rename, force overwrite
n_ok=0
n_miss=0
cp_rename() {
  local src="$SRC/$1"
  local dst="$DST/$2"
  if [ -f "$src" ]; then
    cp -f "$src" "$dst"
    n_ok=$((n_ok+1))
  else
    echo "  MISSING: $1"
    n_miss=$((n_miss+1))
  fi
}

# === COMMON / LOGO ===
cp_rename "ff.svg" "common/logo-ff.svg"

# === HOMEPAGE CARDS ===
# Using polished 5-phone showcases for Toilet + Wellcome, clean cover for Industrious
cp_rename "Frame 16.png"          "home/card-toilet.png"
cp_rename "Industrious_Cover.png" "home/card-industrious.png"
cp_rename "Frame 17.png"          "home/card-wellcome.png"

# === TOILET DELIVERY ===
cp_rename "Frame 16.png"             "toilet/hero.png"
cp_rename "TD.png"                   "toilet/screens/td-overview.png"
cp_rename "TD Desk Research.png"     "toilet/research/desk-research.png"
cp_rename "Toilet Info 1.png"        "toilet/screens/info-1.png"
cp_rename "Toliet_Delivery.png"      "toilet/screens/full-app-flow.png"
cp_rename "Design System.png"        "toilet/design-system/00-overview.png"

# Animations — using compressed GIFs for now (smaller). Convert MOVs to MP4 later for better perf.
cp_rename "Compress GIF/Find Nearest.gif"     "toilet/animations/find-nearest.gif"
cp_rename "Compress GIF/Different Modes.gif"  "toilet/animations/different-modes.gif"
cp_rename "commute options.gif"                "toilet/animations/commute-options.gif"

# === INDUSTRIOUS ===
cp_rename "Industrious_Cover.png"                          "industrious/hero.png"
cp_rename "Industrious.png"                                "industrious/deliverables/final-cover.png"

# ⚠️ Below: HTML still points at the same WRONG files the original site used.
#    See README-images.md for which slots need new images from you.
cp_rename "Screenshot 2026-01-24 at 07.52.43.png" "industrious/research/research-plan.png"          # ⚠️ wrong file (currently Wellcome website)
cp_rename "Screenshot 2026-01-24 at 07.53.51.png" "industrious/synthesis/affinity-outcomes.png"
cp_rename "Screenshot 2026-02-07 at 15.37.25.png" "industrious/recommendations/01-conversation-starters.png"  # ⚠️ wrong file (currently TD pie chart)
cp_rename "Screenshot 2026-02-07 at 16.26.19.png" "industrious/recommendations/02-peer-events.png"
cp_rename "Screenshot 2026-02-07 at 17.53.15.png" "industrious/recommendations/03-nuanced-space.png"

# === WELLCOME COLLECTION ===
cp_rename "Frame 17.png"                       "wellcome/hero.png"
cp_rename "Wellcome-collection.png"            "wellcome/branding/wellcome-photos-logo.png"
cp_rename "Wellcome Collection mobile app.png" "wellcome/screens/visitor-utility.png"
cp_rename "Map 1 - Eng.png"                    "wellcome/screens/map.png"
cp_rename "3D Audio.png"                       "wellcome/3d-audio/concept.png"
cp_rename "3D Audio Page Being Human.png"      "wellcome/3d-audio/being-human.png"
cp_rename "3D Audio Page 1880 THAT.png"        "wellcome/3d-audio/1880.png"

# Animations — using compressed GIFs
cp_rename "Compress GIF/Exhibition List.gif"  "wellcome/animations/exhibition-list.gif"
cp_rename "Compress GIF/Exhibtion Page.gif"   "wellcome/animations/exhibition-page.gif"

echo ""
echo "=========================================="
echo "$n_ok files copied, $n_miss missing"
echo ""
echo "Still needed (HTML expects these paths but no source available yet):"
echo ""
echo "  about/portrait.jpg              ← your portrait photo"
echo "  about/lifestyle-beach.jpg       ← lifestyle photos (4 total)"
echo "  about/lifestyle-park.jpg"
echo "  about/lifestyle-cafe.jpg"
echo "  about/lifestyle-lens.jpg"
echo ""
echo "  creatives/design-1..6.jpg       ← graphic design work (6 images)"
echo "  creatives/photo-1..5.jpg        ← photography (5 images)"
echo "  creatives/more-1..2.jpg         ← mixed media (2 images)"
echo ""
echo "  industrious/research/research-plan.png             ← actual research plan screenshot"
echo "  industrious/recommendations/01-conversation-starters.png  ← conversation starter graphic"
echo ""
echo "Once you drop those into the right folders, the site is complete."
echo "=========================================="
