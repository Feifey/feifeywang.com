# DESIGN SYSTEM — Feifey Wang Portfolio
# Phase 1: Direct transfer of current Webflow site rules.
# These rules apply to ALL pages unless noted otherwise.
# Phase 2 (restyle) will update this file with new design direction.

---

## COLORS

### Core Palette
- `--bg-primary`: #0a0a0a (near-black page background)
- `--bg-secondary`: #111111 (slightly lighter, used for card backgrounds)
- `--text-primary`: #ffffff (headings, body text)
- `--text-secondary`: #cccccc (lighter body text, descriptions)
- `--text-muted`: #999999 (meta labels, captions)
- `--accent-blue`: #1a1ab8 (blue banners, section callouts)
- `--accent-blue-hover`: #2424d4 (hover state for blue elements)
- `--link-color`: #ffffff (nav links, footer links — underlined)
- `--card-bg`: #1a1a1a (project cards, contribution cards, takeaway cards)
- `--card-border`: #2a2a2a (subtle card borders if any)

### Blue Banner
- Background: #1a1ab8
- Text: #ffffff
- Used as full-width section dividers on case study pages
- Bold, large heading text centered

### Meta Labels (ROLE, TIMELINE, TEAM, TOOLS)
- Label color: #1a1ab8 (blue, matching accent)
- Value color: #ffffff

---

## TYPOGRAPHY

### Font Family
- Primary: 'Montserrat', sans-serif
- Weights: 300 (light), 400 (regular), 500 (medium), 600 (semi-bold), 700 (bold)
- Google Fonts import: Montserrat:wght@300;400;500;600;700

### Scale (approximate, from Webflow screenshots)
- Hero name (homepage): ~64px, weight 700
- Hero tagline: ~24px, weight 600
- Page section headings (h2): ~36px, weight 700
- Blue banner headings: ~32px, weight 700
- Sub-section headings (h3): ~24px, weight 700
- Body text: ~16px, weight 400, line-height 1.6
- Card titles: ~20px, weight 600
- Card descriptions: ~14px, weight 400
- Meta labels (ROLE etc.): ~14px, weight 600, uppercase
- Meta values: ~14px, weight 400
- Nav links: ~16px, weight 400
- Footer text: ~14px, weight 400

### Text Styles
- Bold emphasis used inline (**bold**) for key terms in body copy
- No italic used in body text
- Headings are sentence case (not ALL CAPS except meta labels)

---

## LAYOUT

### Page Width
- Max content width: ~900px centered
- Full-bleed elements: blue banners, hero backgrounds
- Side padding: ~60px desktop, ~24px mobile

### Grid
- Project cards on homepage: single column, each card is a two-column layout (image left, text right)
- Case study meta grid: 4 columns (Role / Timeline / Team / Tools) — or 5 columns for Industrious (adds Methodology)
- Contribution cards: 3 columns, equal width
- Recommendation sections: varies (image + text side by side)
- Creatives gallery: 3-column masonry-style grid
- About "Where can you find me": 4 columns

### Spacing
- Section gap: ~80px between major sections
- Card gap: ~24px
- Paragraph spacing: ~16px
- Blue banner padding: ~60px top/bottom

---

## COMPONENTS

### Navigation
- Position: fixed top, full width
- Background: transparent (blends with dark page)
- Left: ff logo (SVG, white, links to index.html)
- Right: work (with dropdown) / creatives / about / resume ↗
- Work dropdown: Toilet Delivery / Industrious / Wellcome Collection
- Link style: white text, underlined
- "resume" has external link icon (↗)
- No dark mode toggle (site is fully dark)

### Footer
- Full width, dark background matching page
- Left side: ff logo + "Let's Connect" (large text, ~24px bold)
- Right side: "Thank you for interest, let's collaborate!" + "Made with lots of bobas + sweets © Feifey Wang"
- Below right text: LinkedIn / Github / Email (with small icons)
- Consistent across ALL pages

### Project Cards (Homepage)
- Layout: image left (~45% width), text right (~55% width)
- Image: rounded corners (~8px), contains project cover
- Title: blue (#1a1ab8), large, bold
- Description: white, regular weight
- Meta line: "Web App Lunch · Winter 2025 - Now" style
- Link: "View Case Study →"
- Card background: slightly lighter than page or transparent

### Case Study Hero
- Full-width blue/dark gradient background
- Left side: title + subtitle + short description
- Right side: phone mockups / screenshots
- Below hero: meta grid (Role / Timeline / Team / Tools)

### Contribution Cards
- 3 in a row
- Dark card background (#1a1a1a or similar)
- Rounded corners (~8px)
- Each has a short paragraph of text
- No icons, just text

### Blue Banner Sections
- Full-width, #1a1ab8 background
- Center-aligned bold white heading
- Sometimes with a subtitle line below
- Padding: ~60px vertical

### Quote Blocks
- Avatar/icon (gray circle) on left
- Name + role on right, bold
- Quote text in quotation marks, regular weight
- Slightly indented or separated from body text

### Takeaway Cards
- 3 in a row at bottom of case studies
- Dark background cards
- Regular weight text
- No numbers visible on cards (numbers are in content only)

### "View Prototype" Button
- Rounded pill shape, blue (#1a1ab8) background
- White text, centered
- ~200px wide

### Data Visualization (Toilet Delivery)
- Pie charts: gray base with blue (#1a1ab8) filled portion
- Percentage labels inside charts
- Category labels below each chart
- Built in HTML/CSS (not images)

### Pain Point Blocks (Toilet Delivery)
- Stacked vertically on left
- Gray/gradient background cards
- Centered text
- 3 levels with slight color variation

---

## BORDER & RADIUS
- Card border-radius: 8px
- Button border-radius: pill (50px or 999px)
- Image border-radius: 8px
- No visible card borders (or very subtle #2a2a2a if present)
- No horizontal dividers or border-bottom lines anywhere

---

## IMAGES & MEDIA
- All images have 8px border-radius
- Phone mockups: displayed at natural aspect ratio, no extra framing
- Gallery grids (creatives): images fill their grid cells, 8px radius, small gap between
- GIF animations: treated same as images
- Logo: ff.svg, displayed in white (use CSS filter or SVG fill)

---

## RESPONSIVE BEHAVIOR (to refine in Phase 5)
- Target breakpoints: 768px (tablet), 480px (mobile)
- Nav collapses to hamburger on mobile
- Project cards stack vertically on mobile
- Meta grid wraps to 2 columns on tablet, 1 on mobile
- Gallery grid goes from 3 → 2 → 1 columns
- Blue banners stay full-width, font size reduces

---

## FILE REFERENCES
- Logo: assets/ff.svg
- Project thumbnails: project-media/ folder
- Case study images: project-media/ folder
- Font: Google Fonts CDN (Montserrat)
- No external JS libraries for Phase 1-3 (vanilla JS only)
