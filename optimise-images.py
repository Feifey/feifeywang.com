#!/usr/bin/env python3
"""
optimise-images.py — downscale the images the site actually serves.

Only touches the organised subfolders under assets/images/ (the ones the HTML
references). The flat originals in assets/images/ are left alone, so this is
reversible: delete a subfolder and re-run setup-images.sh to get it back.

Animated GIFs and SVGs are skipped entirely — resizing a GIF here would flatten
the animation.

Usage:
    python3 optimise-images.py            # dry run, shows what would change
    python3 optimise-images.py --apply    # actually rewrite the files
"""

import sys
from pathlib import Path
from PIL import Image

REPO = Path(__file__).resolve().parent
IMG = REPO / "assets" / "images"
APPLY = "--apply" in sys.argv

# WIDTH cap per folder — deliberately width, not longest edge. Several case
# study images are tall stitched screenshots (td-overview.png is 1440x17407);
# capping their longest edge would crush them to ~150px wide and destroy them.
# Height always follows proportionally.
CAPS = {
    "creatives": 1200,
    "about": 1400,
    "home": 1600,
    "toilet": 1800,
    "industrious": 1800,
    "wellcome": 1800,
}

JPEG_QUALITY = 85
SKIP_SUFFIXES = {".gif", ".svg", ".mov", ".mp4", ".pdf"}

total_before = total_after = 0
changed = skipped = 0
rows = []

for folder, cap in sorted(CAPS.items()):
    root = IMG / folder
    if not root.is_dir():
        continue
    for path in sorted(root.rglob("*")):
        if not path.is_file() or path.suffix.lower() in SKIP_SUFFIXES:
            continue
        before = path.stat().st_size
        try:
            im = Image.open(path)
            im.load()
        except Exception as e:
            print(f"  !! unreadable, skipped: {path.relative_to(REPO)} ({e})")
            continue

        w, h = im.size
        needs_resize = w > cap          # WIDTH only — see note on CAPS above

        if not needs_resize and before < 400_000:
            skipped += 1
            total_before += before
            total_after += before
            continue

        if needs_resize:
            scale = cap / w
            new = (cap, max(1, round(h * scale)))
            im = im.resize(new, Image.LANCZOS)
        else:
            new = (w, h)

        if APPLY:
            fmt = path.suffix.lower()
            if fmt in (".jpg", ".jpeg"):
                im.convert("RGB").save(
                    path, "JPEG", quality=JPEG_QUALITY, optimize=True, progressive=True
                )
            elif fmt == ".png":
                # Keep alpha if the image actually uses it, else drop to P/RGB
                if im.mode in ("RGBA", "LA") and im.getchannel("A").getextrema()[0] < 255:
                    im.save(path, "PNG", optimize=True)
                else:
                    im.convert("RGB").save(path, "PNG", optimize=True)
            else:
                im.save(path, optimize=True)
            after = path.stat().st_size
        else:
            after = before  # unknown until we write

        total_before += before
        total_after += after
        changed += 1
        rows.append(
            (str(path.relative_to(IMG)), f"{w}x{h}", f"{new[0]}x{new[1]}",
             before / 1048576, after / 1048576)
        )

mode = "APPLIED" if APPLY else "DRY RUN (nothing written — pass --apply)"
print(f"\n=== {mode} ===\n")
print(f"{'file':<52}{'from':>12}{'to':>12}{'MB before':>11}{'MB after':>10}")
for r in sorted(rows, key=lambda x: -x[3])[:20]:
    print(f"{r[0]:<52}{r[1]:>12}{r[2]:>12}{r[3]:>11.2f}{r[4]:>10.2f}")
if len(rows) > 20:
    print(f"... and {len(rows) - 20} more")

print(f"\n{changed} processed, {skipped} left as-is (already small enough)")
if APPLY:
    print(f"total: {total_before/1048576:.1f} MB -> {total_after/1048576:.1f} MB "
          f"({100*(1-total_after/total_before):.0f}% smaller)")
else:
    print(f"current total: {total_before/1048576:.1f} MB")
