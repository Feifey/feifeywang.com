# Image setup notes

## How to populate `assets/images/`

Run once on your Mac:

```bash
cd ~/Documents/Claude/Projects/feifeywang.com
bash setup-images.sh
```

This copies everything it can from `~/Desktop/重用` into the right slots.

---

## Files you still need to add

The HTML expects these paths but I had no matching source file. Drop your real images at these exact paths (match the extensions — `.jpg` for photos, `.png` for graphics):

### `about/`

| Path | Description |
|---|---|
| `about/portrait.jpg` | Your portrait photo |
| `about/lifestyle-beach.jpg` | "at the beach" |
| `about/lifestyle-park.jpg` | "at the park" |
| `about/lifestyle-cafe.jpg` | "at a café" |
| `about/lifestyle-lens.jpg` | "on my lens" |

### `creatives/`

| Path | Description |
|---|---|
| `creatives/design-1.jpg` … `design-6.jpg` | 6 graphic design pieces |
| `creatives/photo-1.jpg` … `photo-5.jpg` | 5 photography pieces |
| `creatives/more-1.jpg`, `more-2.jpg` | 2 mixed-media / illustration pieces |

If you want different counts (e.g. 10 photos instead of 5), edit `creatives.html` and add/remove `<img>` tags accordingly.

---

## Wrong files in the original site that I routed but didn't fix

These slots are populated by `setup-images.sh` using the same files the original Webflow site referenced — **but those files are wrong for the slot**. You'll need to export the right images and overwrite them.

| Path | What's there now (wrong) | What it should be |
|---|---|---|
| `industrious/research/research-plan.png` | Screenshot of Wellcome Collection's website | A real screenshot of your research plan / interview guide |
| `industrious/recommendations/01-conversation-starters.png` | Pie chart from the Toilet Delivery survey | A graphic showing the conversation-starter concept |

I also routed away from one wrong file:

| Path | Old (wrong) source | New (correct) source |
|---|---|---|
| `toilet/design-system/00-overview.png` | `Frame 1.png` (a Korean API spec table) | `Design System.png` (the actual design-system overview) |

---

## Notes on file size + performance

The MOV files in `~/Desktop/重用/drive-download-…/` are the originals for your animated demos. Convert them to MP4 (smaller, better quality than GIF) and replace the GIFs:

- Toilet Delivery: `find-nearest.gif`, `different-modes.gif`, `commute-options.gif`, plus `menu`, `starting-app`, `starting-page`
- Wellcome: `exhibition-list.gif`, `exhibition-page.gif`

Easiest converter: https://cloudconvert.com/mov-to-mp4

Once converted, swap the `<img src="…gif">` for `<video autoplay loop muted playsinline src="…mp4"></video>` in the HTML and you'll cut tens of megabytes off your page weight.
