# Cael's Rebuild Plan — v2 (Post-Ash Audit)

**Goal:** Combine Cael's cinematic hero with Ash's design principles. Score 8/10+.

---

## What Ash Got Right

1. **Proposal preview in hero** — Shows actual output, not stock photo
2. **Quiet confidence tone** — "The proposal your client signs" vs "Build proposals that close deals"
3. **Ocean teal palette** — More premium than amber/gold
4. **Specific metrics** — "8 min average", "94% signed within 48 hours"
5. **Annual pricing** — R6,999/year with savings highlighted

## What Cael Got Right

1. **Mountain hero image** — Cinematic, full-bleed, editorial
2. **Playfair Display** — Premium serif for headlines
3. **Dark navy background** — Professional, not cheap
4. **Full technical rebuild** — Working auth, Supabase, offer CRUD

---

## Merge Strategy

### Color Palette (Ash's ocean teal)
- Primary: `#0A4F4F` (deep ocean teal)
- Accent: `#D4AF37` (old gold, more premium than amber)
- Background: `#0A1628` (keep current navy black)
- Text: `#F5F5F0` (warm white, not clinical)
- Secondary: `#94A3B8` (keep)
- Borders: `#1E3A3A` (dark teal)

### Hero (Merge both)
- Keep Cael's mountain image (cinematic ✅)
- Add Ash's proposal preview card (right side)
- Use Ash's headline: "The proposal your client signs"
- Use Ash's CTA: "Start Building — Free First Proposal"
- Keep amber accent line (Cael's touch)

### Features (Ash's approach)
- Replace icon cards with screenshot showcases
- Show wizard UI + PDF output
- Use real metrics (8 min, 94%)
- Side-by-side layout (text + image)

### Pricing (Ash's approach)
- Single card with annual option
- R6,999/year highlighted as "save R2,589"
- Feature list with checkmarks
- Gold CTA button

### Copy Tone (Ash's approach)
- Remove: "Start Free Trial", "No credit card required"
- Add: "First proposal free. Upgrade when you're ready."
- Quiet confidence, not sales hype

---

## Implementation Order

1. Update globals.css with new color palette
2. Rebuild hero with proposal preview
3. Rebuild features with screenshots
4. Rebuild pricing with annual option
5. Update footer
6. Test build
7. Deploy

---

## Key Metrics to Hit

- Build time: <10 minutes
- Lighthouse score: 90+
- Visual quality: 8/10 (Ash's standard)
- Performance: First Contentful Paint <1.5s
