# CONTENT.MD — Feifey Wang Portfolio
# Source of truth for all text content. Do not hallucinate copy.
# Extracted from Webflow site: feifeywang629.webflow.io (April 2026)

---

## HOMEPAGE (index.html)

### Hero
Hello! I'm
**Feifey Wang**
**Interaction Designer** with a **Graphic Design** background.
I'm an empathetic designer, a data-driven decision-maker, and a collaborative communicator.

### Nav
- work (dropdown: Toilet Delivery / Industrious / Wellcome Collection)
- creatives
- about
- resume ↗

### Project Card 1: Toilet Delivery App
- Thumbnail: Delivery_Toilet.png
- Title: Toilet Delivery App
- Description: A **map-based web app** that helps delivery workers quickly find **usable restrooms** with confidence. By prioritising **reliability, clear access information**, and efficient routing over simple proximity, the experience reduces uncertainty and supports **low-friction decision-making** during active routes.
- Meta: Web App Lunch · Winter 2025 - Now
- Link: View Case Study →

### Project Card 2: Industrious
- Thumbnail: Industrious_Cover.png
- Title: Industrious
- Description: Research-driven strategy project for Industrious focused on understanding how workplace behaviors, social comfort, and environmental control shape shared-space engagement. Insights informed experience recommendations designed to improve belonging and everyday interaction within coworking environments.
- Meta: Research Report · Winter 2025
- Link: View Case Study →

### Project Card 3: Wellcome Collection
- Thumbnail: Wellcome_Collection.png
- Title: Wellcome Collection
- Description: A mobile-first companion experience that brings exhibition information and audio guides into an **accessible**, in-gallery flow. Includes **Echo Paths**, a spatial-audio **navigation** mode that uses directional cues to support exploration through sound.
- Meta: Mobile App Prototype · Spring 2025
- Link: View Case Study →

### Footer
- Logo: ff
- "Let's Connect"
- "Thank you for interest, let's collaborate!"
- "Made with lots of bobas + sweets © Feifey Wang"
- Links: LinkedIn / Github / Email

---

## TOILET DELIVERY APP (toiletdeliveryapp.html)

### Hero
**Delivery Toilet**
— Restroom Access for Delivery Workers

A map-based, **end-to-end** mobile web **application** designed to help delivery workers quickly locate **usable restroom** access with clarity, reliability, and low friction.

### Meta Grid
- ROLE: UX + UI Design / Research / Prototyping+ Testing / Visual Design / Branding / User Flow
- TIMELINE: November - Present
- TEAM: 1 Designer / 1 Developers
- TOOLS: Figma / Fig Jam / Apple Icon Composer / Vercel / Google Forms / Mapbox / JavaScript

### My Contribution
1. Problem Framing: Defined "usable access" as the core design challenge, grounding product decisions in dignity and reliability.
2. Product Design: Designed the MVP experience and interaction flows for a Mapbox-based web app demo.
3. System Design: Built a full brand and reusable UI components to support clarity, accessibility, and scale.

### What is Toilet Delivery?
Toilet Delivery helps NYC delivery workers find the nearest usable restroom—fast.

Instead of showing every restroom pin, the experience highlights options that are open, realistically accessible, and worth the detour, so workers can take a respectful break without disrupting their route.

### Blue Banner
A bathroom break shouldn't be a negotiation.

### The Problem
Delivery workers move on tight schedules, often without reliable access to restrooms.

When the nearest option is locked, "customers-only," or hard to enter quickly, a basic need turns into lost time, stress, and unsafe workarounds. Existing restroom-finding tools rarely reflect what delivery workers actually need at street speed: certainty, fast entry, and confidence that the option is usable right now.

### Anonymous Interviewee Quote
"Many pees in bottles my husband used to do. People just would say no and you are delivering in residential estate in teh middle of nowhere."

### Blue Banner
How is the problem currently being addressed?
Before designing TD, we looked at how people solve this today and where the gaps are.

### Current State
1) Existing tools only support finding the restroom
Most restroom maps focus on existence, not access. They may list locations, but often miss the details that decide whether a restroom works in a delivery context: entry rules, hours, reliability, and what happens when a location fails.

2) Current solutions for delivery workers
Without a dependable source, workers rely on memory, luck, or negotiation: returning to "safe" spots, buying something just to enter, asking staff, or holding it until the route ends. These workarounds are inconsistent and expensive — especially when every minute affects income and ratings.

[IMAGE: Desk Research on current solutions and pain points]

### Blue Banner
What does "usable" really mean on a delivery route?

For delivery workers, a restroom's usability is shaped less by distance and more by risk and uncertainty. In practice, restrooms fail not because they're far away, but because access is denied, parking is risky, or availability disappears at the moment of need.

### Top factors that make a restroom unusable during a delivery shift
- 22.5% — Parking / ticket risk and Detour
- 35% — Denied access (staff says no)
- 42% — No useable restroom when needed

### Pain Points
- Limited restroom access during delivery shifts
- Unpredictable entry & conflicting access rules
- Lack of confidence at the moment of need

### Confidence reduces wasted time and risk.
Although delivery workers initially describe their problem as "not enough restrooms," deeper research revealed a different issue. Restrooms often exist, but access is unpredictable—denied by staff, unavailable at critical moments, or risky to reach during an active route.

What delivery workers lack isn't location information, but confidence that a restroom will be usable when they arrive.

### Blue Banner
"Usable" = fast, reliable, and low-friction.

### Design Principles
01 Predictability > proximity
Show options that are reliable, not just nearby.

02 Street-speed clarity
Design for one-handed use, quick scanning, and minimal reading.

03 Low-friction access
Reduce steps, avoid negotiation, and surface entry details before arrival.

Based on these principles, we designed TD to help delivery workers quickly identify the nearest usable restroom with confidence.

### Key Features

**Responsive Location, Map, and Toilet fetching**
Fetching user's current location, displaying all available the toilet options around them. Identify different types of toilet place with icons shown coming with responsive map for user to adjust.

**Supporting fast, street-speed navigation.**
Using the 'Find nearest' button or select a restroom, TD integrates navigation to guide users there with minimal friction.

**"Usable" = fast, reliable, and low-friction.**
Restrooms are ranked by real-world usability rather than distance alone. Showing the type of the toilet and rating the quality of the restroom.

**Adapting to different ways of moving through the city.**
TD supports driving, walking, and cycling, updating routes and guidance accordingly. For each option, the app provides estimated travel time and distance, helping users quickly judge whether a restroom fits their current delivery window.

These features rely on quick recognition and predictable behaviour. To make that possible across the product, I created a unified visual system focused on clarity, accessibility, and consistency.

### Design system & Brand
[IMAGE: Full design system showing Introduction, Logo, Colors, Typography (SF Pro, New York), Spacing, Grid Systems, Iconography, Selectors, Textfields, Buttons]

[IMAGE: 5 phone mockups showing full app flow — splash screen, location permission, map view, route selection, navigation]

### Blue Banner
What was our impact?

### Validation through real-world conversation
TD was presented and tested during Studio Open Day through a live prototype. Across conversations with delivery workers, students, and visitors, the problem resonated immediately. Rather than questioning the need for the product, most feedback focused on how the experience could better support fast, low-stress decisions during active routes.

This response validated our core insight: the challenge isn't finding restrooms, but **trusting that access will work when it matters.**

### Quotes
"This is actually something I need. I usually just guess and hope it works." — Delivery worker, Open Day

"I like that it doesn't show everything, just the ones that actually work." — Visitor feedback

[View Prototype button]
Supporting Materials
Full Figma File ↗

### Blue Banner
How do we go from here?

### Next step for TD
- Commute Options & Toilet Option Change: Walking/ Bike/ PublicTransportation and More options for people to choose
- Locating Parking: Adding parking places' options that goes with the toilet around
- Time of the day: Since some toilet spots are in the restaurant, it is better to include the opening time of those places
- Rating System: Would be better if the user are able to add rating too as well, so it is not a one side information provide

### My Takeaways
1. Progress comes from identifying clear insight and designing decisively around it. Move forward with informed assumptions, validate quickly, and refine through iteration.
2. Distinguish between what could be built and what should be built. Clarify the core value of the product. I learned to treat scope as a design decision, not a constraint.
3. Usability comes from subtraction. Prioritise the top options had a bigger impact than adding more features. Information hierarchy matters more than feature count.

---

## INDUSTRIOUS (industrious.html)

### Hero
**Industrious**
— Research Report

UX research and strategy project for Industrious. **Translating** worker **insights** into **actionable recommendations** to improve shared-space engagement and member retention.

### Meta Grid
- ROLE: UX Researcher / Visual Design / Synthesis / Strategy
- TIMELINE: November - December 2025
- TEAM: Seren Kim / Sopie Lee
- METHODOLOGY: Desk research / User Interviews / Affinity mapping / Competitive Analysis / Shadowing
- TOOLS: Figma / Fig / JamZoom

### My Contribution
1. Built the research plan and ran data collection end-to-end, including recruiting and interviewing 9 participants (hybrid workers, and a workplace ops expert).
2. Led analysis and synthesis using affinity mapping + pattern recognition, translating interview findings into 3 core insight themes that anchored the final narrative and recommendations.
3. Delivered a final pitch to Industrious (including leadership joining), presenting prioritised recommendations to support natural, authentic connection in shared workspaces.

### About Industrious
Industrious is a workplace experience company operating flexible offices and co-working spaces, combining hospitality-led service with shared environments. Their spaces include private offices and shared areas like cafés, lounges, meeting rooms, and member programming.

### What are the client needs?
**Increase** shared-space **engagement** and **meaningful interaction** in a way that strengthens belonging and perceived value, because shared spaces directly shape satisfaction, return behaviour, and long-term retention.

### Blue Banner
The challenge wasn't "more events"— it was designing engagement that different people would actually choose.

### The Challenge
Industrious offers thoughtfully designed shared spaces and community programming, but attendance and shared-space **usage** can be **inconsistent**. Instead of assuming the fix was "more events," the team needed evidence on **what truly drives engagement** and **what makes people opt out.**

### Margaret Wiltshire (Industrious Worker) Quote
"Believe it or not, there was probably less than 10 people for that whole building that came... (Japanese Stitching Event)... Less than 10 people."

### Learning Goals
Industrious already collects tenant feedback (NPS + open-ended responses every ~90 days), but the challenge is turning that data into focused, actionable direction.

So we framed the work around what actually makes people show up — and what "**community**" should mean in a shared office building.

We aligned on four focus areas:
1. Motivation to show up
2. Engagement and Community preferences
3. Hospitality, Care, and belonging
4. Value of amenities + Experience strategy

### Planning
We started by writing a research plan and interview guide to pressure-test assumptions and ensure our questions could reach the core problem, not just surface preferences.

### Research Approach
We interviewed 9 participants across three perspectives (Industrious members, hybrid office workers, and a workplace operations expert), converted interviews into user snapshots, then used affinity mapping to identify three core themes.
[IMAGE: Affinty outcomes: shared themes + differences across groups]

### Blue Banner
Key Findings

Across 9 interviews, we found three themes repeated across members, hybrid workers, and an operations expert, revealing clear opportunities for Industrious to support connection without forcing it.

### Theme 01: Can I Be Myself Here?
- Insight: People avoid office events not because they don't want connection, but because they don't want to perform. Networking-style formats create pressure and uncertainty.
- Opportunity: Design connection that feels authentic by default: Activity-based, Low-pressure, Expectation-clear

### Theme 02: Control Over Environment & Work Style
- Insight: People aren't choosing between focus and collaboration—they're trying to stay focused while socially present. Most workplaces don't support this "in-between" mode.
- Opportunity: Create a spectrum of spaces + lightweight signals that help people shift modes: Non-verbal, Socially acceptable, Easy to adopt

### Theme 03: Appreciation & Bonding, the role of Shared Offices
- Insight: When top-down systems feel cold, people rely on **bottom-up relationships** for support and motivation—creating a **gap** shared office spaces **can** uniquely **bridge.**
- Opportunity: Enable small, recurring moments of warmth: Rituals, Peer-led touch points, Community behaviours that don't feel forced

### Blue Banner
Recommendations

We translated each theme into a recommendation Industrious can act on.

### 01 Low-stakes conversation starters
Add micro-prompts at everyday touch points to enable low-pressure conversation.
[IMAGE: Where do people often start the small conversation? → Nice place to start! 1. Getting coffee  2. Eating  3. Waiting/ Inside elevator]

[IMAGE: Examples: Tea / Coffee Bean Voting, Local Restaurant Map on the table, A screen showed peer driven activity.]

What Changes: Small prompts where people already pause (coffee bar / kitchen / elevator screen)
Why it works: 1. Starts with a shared object/topic → reduces awkward "contextless small talk". 2. Interaction is optional + people can stay themselves
Signals of success: 1. % participation (votes/tokens) 2. "Felt natural" sentiment 3. More repeat attendance at casual moments (lunch, coffee area)

### 02 App: peer-driven events (shift from broadcast → enablement)
Shift the app from broadcast to enablement so members can host and join peer-led events.
[IMAGE: Current Industrious app design audit]
[IMAGE: Showing example features]

What Changes: 1. "Host an event" flow + interest tags + lightweight RSVP. 2. Optional "host kit" from Industrious (space, time slot, simple guidelines)
Why it works: 1. Bottom-up connection feels more authentic than top-down programming. 2. Makes it easy to find "my people" without performing
Signals of success: 1. Member-hosted events/month 2. RSVP + attendance rate 3. Retention proxy: repeat visits / renewal intent

### 03 Nuanced space (focus micro-zones inside social areas)
Design focus micro-zones inside social areas so people can 'be around others' without social demand.
[IMAGE: collaboration nuanced space focus]
[IMAGE: current space]

What Changes: 1. Add "focus micro-zones" within social areas (seat type + light/ acoustic cues). 2. Simple "status signals" that are socially acceptable (table signage / subtle markers)
Why it works: 1. Supports "ambient presence" — workers who want energy but not interaction. 2. Reduces interruptions without making the space feel anti-social
Signals of success: 1. Reported interruptions ↓ 2. Utilisation of micro-zones 3. Member satisfaction with "control over environment"

### Deliverables
Final pitch presented to Industrious stakeholders (President + CPO + Workplace Experience team).
[View Prototype button]
**Supporting Materials**: Full insights report, research plan + interview guide, and working board/research archive available on request.
Request access via email ↗

### Blue Banner
Where do we go from here?

### Next step for Industrious
- Test + Measure (start small): Launch 1-2 low-stakes touch points at a single location and track adoption + repeat engagement.
- Shift the app to enablement: Prototype a member-led event flow (create → discover → RSVP) and add lightweight, two-way feedback loops.
- Design "nuanced space" micro-zones: Test focus-friendly micro-areas inside social spaces using subtle signals (layout, lighting, acoustic cues, signage).
- Build a facilitator playbook: Equip Workplace Experience teams with simple guidelines + templates so connection is supported without feeling forced.

### My Takeaways
1. The biggest quality jump came from treating the guide like a hypothesis test: define what must be true/false, then write questions that force clarity. It reduces vague answers and makes synthesis cleaner.
2. In affinity mapping, I learned to tag notes as claims vs behaviours. Most actionable insights came from behaviour patterns, not opinions.
3. Frame insights as: what changes → why it works → what success looks like. That structure turns insights into testable interventions, makes stakeholder buy-in easier, and sets up clear next steps.

---

## WELLCOME COLLECTION (wellcomecollection.html)

### Hero
**Wellcome Collection —**
Mobile Exhibition Companion App

Designing an end-to-end exhibition experience that integrates **spatial audio guidance** into a unified mobile platform.

### Meta Grid
- ROLE: Product Designer / UI+UX Designer / Researcher
- TIMELINE: April-May 2025
- TEAM: Solo work
- TOOLS: Figma / Illustrator / Miro

### My Contribution
1. Defined the end-to-end app experience (information architecture → key flows).
2. Designed core UI + component system for scalable screens and handoff-ready specs.
3. Prototyped and validated key tasks (discover → navigate → save/revisit).

### Who is Wellcome Collection?
Wellcome Collection is a museum in central London built around the belief that everyone's experience of health matters. Its exhibitions aim to be inclusive across different visitor needs.
[IMAGE: Wellcome Collection photos and logo]

### Blue Banner
What did the client want?

01 Make the visit more accessible and inclusive
Specifically, reduce/remove barriers across the building, services, and programme.

02 Support diverse access needs with clear, on-demand help
Keep improving through visitor feedback.

03 Offer accessible ways to experience exhibitions
Including options like audio descriptions (and, for some content, optional directions between stops).

### The Research
To ground the project, I audited the Wellcome Collection's physical and digital touchpoints through **field observation** and **competitive scanning**.

### The Friction
Discovered a consistent pain point: **fragmented information** across print, web, and borrowed devices. This creates significant navigational barriers, particularly for **blind and low-vision visitors.**

### The Solution
These insights led to a **single mobile companion** that integrates exhibition content and audio guides into one flow. By featuring **spatial-audio wayfinding**, the design ensures a seamless and **confident visitor journey**.

### Blue Banner
What does "Accessible" mean for the user?

### From the research, "accessible" isn't only about compliant content, it's about:

**01 Independent**
Let visitors preview, navigate, and revisit exhibition content in one place, so the museum experience doesn't break when the visit starts or ends.

**02 Low-friction museum navigation**
Support effortless movement through the museum by minimising the need to stop, ask for help, or switch tools.

**03 Understanding in real time**
Give visitors the right information in context (where they are, what's nearby, what to do next), without searching, borrowing devices, or switching channels.

For blind and low-vision visitors, accessibility means the experience works while moving, supports orientation when the environment changes, and lets visitors re-engage with what they explored afterward.

### Blue Banner
How I design the solution?

### Embedding spatial audio inside a mobile app
Guidance breaks down when it lives outside the main experience. At Wellcome, exhibition info is mostly web-based, and the audio guide can mean borrowing a device or hunting for the right page, right when visitors are moving and need clarity.

So I designed a mobile companion app that brings exhibition content and the audio guide into one flow, then layers optional spatial-audio way finding inside that same journey. This keeps accessibility lightweight (no new infrastructure), makes support instant and self-directed, and helps visitors navigate confidently while staying connected to what they're encountering.

### How did I validate and refine the solution?

**01 Wireframes + Sketches**
Tested guided discovery on mobile (browse exhibitions + optional spatial-audio tour).

**02 Audit + Observation + Feedback**
Web-first content + separate audio guide created friction during movement → pivot to one app.

**03 v1 → v2 prototypes + Feedbacks**
Figma prototypes with usability testing. Then refine navigations, content access, and the guidance flow, locking the core features for the app.

### Key Features

**Integrated Gallery Discovery**
Converts broad web content into a **native, scannable interface** for instant access to "What's On" lists, exhibition summaries, and current locations.

**Bring the audio guide into the main visit flow.**
Visitors can start the audio guide directly inside the app. A simplified **numerical interface** that allows visitors to perform **instant object lookups** by entering room or item numbers, bypassing deep menu navigation.

**Centralized Visitor Utility**
Consolidates essential logistics, such as **live opening times**, step-free access routes, and direct **contact links**—into a single, accessible hub.

**Multi-Level Wayfinding**
Provides an **interactive floor plan** across all levels, offering real-time **spatial context** to help visitors locate galleries and amenities effortlessly.

**Concept Extension**
**Add optional spatial-audio wayfinding when navigation breaks down.**
When tactile cues aren't consistent across floors, the app offers an optional spatial-audio guidance mode that helps blind and low-vision visitors move between stops.

### Here's how the spatial audio guide might sound
Click to listen (earphones recommend):
[VIDEO LINK: Welcome Collection- Being Human
Spatial Audio Guide Tour demonstration video.
Better with earphones on]

### Blue Banner
What was the outcome/impact?
What was validated / what changed

Even as a concept, the work validated the experience structure and reduced friction at key moments of movement.

### Outcomes
1. Defined an end-to-end journey: Pre → during → post visit flow that keeps content, guidance, and "revisit later" in one system.
2. Reduced "search + borrow" friction: Audio guide and exhibition content move from web/device dependency into a single mobile flow.
3. Made way finding support self-directed: Visitors can start/stop guidance instantly without staff mediation or extra hardware.
4. Create a scaleable foundation: A component-driven UI system supports future exhibitions, tours, and accessibility modes.

### Deliverables
[View Prototype button]
**Supporting Materials**: 
Process Document Route ↗

### Blue Banner
How do we go from here?

### Next step for Wellcome Collection App
- Pilot in-gallery usability tests: Test way finding + exhibit comprehension across key transitions (entrance → lifts → galleries → exits), and capture where confidence drops.
- Validate accessibility modes end-to-end: Screen reader flow, text scaling, reduced motion, high contrast, haptics, and "no-audio" fallback so the journey still works.
- Prototype the "spatial layer" with lightweight triggers.: NFC/QR start points + directional audio cues; measure time-to-arrive, wrong turns, and how often users need help
- Connect content to the visit lifecycle.: Pre-plan a route, in-gallery "now playing" content, and post-visit saved moments—so the app supports before/during/after, not just navigation

### My Takeaways
1. This project reshape accessibility for me, information hierarchy, user flow logic, and interaction patterns. When accessibility leads the structure, the experience becomes clearer for everyone.
2. Designing for "in-the-moment" use forced me to prioritise clarity, timing, and cognitive load over feature completeness.
3. Even as a designing for a future concept feature, reframed how interactions usually work beyond screens. Prototyping became a tool for thinking, alignment, and decision-making, not just validation.

---

## CREATIVES (creatives.html)

### Design Section
**Design**
Beyond UX, my creative practice is grounded in **visual storytelling** and **graphic experimentation**.

This collection explores typography, branding, and conceptual art as ways to translate complex ideas into striking, minimalist visuals.

It's also a space for me to play with **composition** and form **beyond traditional product cycles**.

[IMAGE GRID: Multiple design works including typography pieces, posters, game rules card, branding work]

### Photography Section
**Photography**
Photography is how I practice looking.

By documenting everyday moments, textures, and environments, I explore framing, rhythm, and atmosphere.

These skills that continue to shape how I approach visual storytelling and interaction design.

[IMAGE GRID: Travel and street photography — Tokyo tower, mountains, London underground, Vatican spiral staircase, prayer flags, Antelope Canyon, Big Ben, beach, European street, etc.]

### + More Section
**+ More**
This is my **creative laboratory :)**

A place for **play**, **exploration**, and **unfinished thoughts**.

This is also where everything started.

[IMAGE GRID: Paintings, illustrations, collages, mixed media works]

---

## ABOUT (about.html)

### Hero
Hello! I'm Feifey

### Who am I
A designer originally from Taipei and currently based in New York!

I graduated in graphic design from University of the Arts London, where I learned to think through form, structure, and visual language.

Over time, my curiosity shifted beyond **how things look to how they work**. How people navigate systems, make sense of interfaces, and experience design in motion.

This interest led me to interaction design, and I'm now pursuing an MFA in Interaction Design (IxD) at School of Visual Arts. Across my work, I'm drawn to projects that explore **clarity, accessibility**, and the **emotional side of human–computer interaction.**

### Why design
I design because I enjoy asking **why**.

Why something feels confusing, why certain interactions exclude people, and how design can quietly guide users toward better experiences. Design gives me the tools to explore these questions through research, experimentation, and iteration.

### Where can you find me when I'm not working?
- at the beach [photo]
- at the park [photo]
- at a café [photo]
- on my lens [photo]
- or just somewhere laughing :)

---

## GLOBAL ELEMENTS

### Nav (all pages)
- Logo: ff (top-left, links to index.html)
- Links: work (dropdown) / creatives / about / resume ↗
- Work dropdown items: Toilet Delivery / Industrious / Wellcome Collection

### Footer (all pages)
- Left: ff logo + "Let's Connect"
- Right: "Thank you for interest, let's collaborate!" / "Made with lots of bobas + sweets © Feifey Wang"
- Links: LinkedIn / Github / Email

### Blue Banners (case study pattern)
Used as full-width section dividers with bold white text, background ~#1a1ab8. Appear on Toilet Delivery, Industrious, and Wellcome Collection pages.

### "My Contribution" Pattern (case study pages)
Three cards in a row, each describing a contribution area. Used on Toilet Delivery, Industrious, and Wellcome Collection.

### "My Takeaways" Pattern (case study pages)
Three cards in a row at the bottom of each case study. Dark background cards with reflective text.
