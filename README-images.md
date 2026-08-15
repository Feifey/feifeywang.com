# Images — how to get them onto feifeywang.com

## The situation

Every image on the live site is currently broken. The cause: `assets/images/`
has the right *folder structure*, but every file inside those folders is
**0 bytes** — empty placeholders left behind when `setup-images.sh` was run
before and failed partway. A 0-byte file still returns HTTP 200, so the
browser gets an "image" with no pixels and shows nothing.

The real source images are fine. They're sitting flat in `assets/images/`
(about 200 files, ~62 MB). They just never got copied into the subfolders.

## The fix — two commands

```bash
cd ~/Documents/Claude/Projects/feifeywang.com
bash setup-images.sh
```

That script deletes the empty placeholders, copies the case-study images into
place, downloads the about + creatives photos from your Webflow CDN, and then
verifies every path the HTML asks for. It prints a list of anything still
broken at the end. It's safe to re-run.

Then publish:

```bash
git add -A
git commit -m "Add site images"
git push
```

GitHub Pages redeploys in about a minute. Hard-refresh with **Cmd+Shift+R** —
your browser has the broken versions cached.

## What changed from the old script

| | Old | New |
|---|---|---|
| about/ + creatives/ | Told you to find 18 images yourself | Downloads all 39 from your Webflow CDN |
| Verification | None — failed silently | Checks every `src=` in every HTML file, reports 404s and 0-byte files |
| Placeholder cleanup | Ran *after* some copies | Runs first, so nothing stale survives |
| Missing GIFs | Failed silently | Detects the empty `Compress GIF/` folder and tells you the restore command |

## First: restore the missing GIFs

The `assets/images/Compress GIF/` folder is empty on this Mac — those files
went missing during the computer switch. They're safe in git. Restore every
deleted file with:

```bash
git ls-files -d -z | xargs -0 git restore --
```

This is why it matters — the compressed versions are the ones the site should use:

| File | Compressed (in git) | Uncompressed |
|---|---|---|
| Find Nearest | **2.56 MB** | 16.69 MB |
| Exhibition List | **3.46 MB** | 23.31 MB |
| Exhibtion Page | **2.86 MB** | 12.41 MB |
| Different Modes | **1.50 MB** | *no GIF version exists* |

10 MB total instead of 52 MB, and `different-modes.gif` only exists in
compressed form — without the restore it can't be built at all except by
converting the `.MOV` with ffmpeg.

## Creatives page now matches Webflow

The old `creatives.html` had 13 image slots. Your Webflow creatives page has
**34** pieces. The HTML has been updated to hold all of them:

- Design — 13 (`design-01` … `design-13`)
- Photography — 12 (`photo-01` … `photo-12`)
- + More — 9 (`more-01` … `more-09`)

Extensions vary (`.png`, `.jpg`, `.gif`) because they match the originals.

## Optional: lighter still

With the compressed GIFs the animations total ~10 MB, which is fine. If you
want to go further, the `.MOV` originals are in
`assets/images/drive-download-.../`. Converting those to MP4 and swapping
`<img>` for `<video autoplay loop muted playsinline>` would get the same
animations down to roughly 1 MB each. Not urgent.

## Repo size

`assets/images/` also holds ~62 MB of flat originals and `.MOV` files that the
site never serves. They'll get committed and served by GitHub Pages for no
reason. Consider moving them to a `_source/` folder and adding it to
`.gitignore` — but do that *after* the site is working, not before, since
`setup-images.sh` reads from that flat folder.
