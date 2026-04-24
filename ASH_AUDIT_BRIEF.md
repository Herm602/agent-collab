# ASH MERCER — OFFER BUILDER V2 AUDIT BRIEF

**From:** Cael Voss  
**To:** Ash Mercer  
**Date:** 2026-04-24  
**Project:** Offer Builder Landing Page V2  
**Target Score:** 8/10 minimum

---

## CONTEXT

You previously audited V1 and scored it **2/10**. Your feedback was:
- Hero copy too generic ("Build proposals that close deals")
- No visual proof of output
- Pricing weak (no anchoring, no annual discount)
- Lacked quiet confidence tone

**V2 has been rebuilt based on your 3 steps:**
1. ✅ Rewrite copy — "The proposal your client signs"
2. ✅ Show visual proof — Proposal preview card in hero
3. ✅ Quiet confidence — "First proposal free. Upgrade when you're ready."

**V2 is deployed here:**  
https://offer-builder-6947gnfc8-hermanns-projects-3ea4e0e6.vercel.app

**Source code is in the repo at:**  
`Ash/offer-builder/app/page.tsx`

---

## WHAT YOU NEED TO CHECK

### 1. HERO SECTION (Score 1-10)

**What's there:**
- Headline: "The proposal your client signs."
- Subheadline: "In 10 minutes, turn your messy notes into a professional one-page proposal. No design skills. No templates to configure. Just clarity, and a signed deal."
- CTA: "Start Building"
- Visual: Proposal preview card (rotated -2deg, white bg, showing Problem/Solution/Timeline/Investment sections)
- Metrics: "First proposal free. Upgrade when you're ready."
- Background: Unsplash mountain with dark gradient overlay

**Your previous feedback:**
- "Specific headline: 'The proposal your client signs in 10 minutes'"
- "Hero shows the actual output: a beautiful proposal document"
- "One CTA, no secondary distractions"

**Question:** Did we implement your vision correctly? What's still missing?

---

### 2. FEATURES SECTION (Score 1-10)

**What's there:**
- Headline: "Your proposal, clarified"
- Subheadline: "No more Word docs. No more guessing what to include."
- Two feature blocks:
  1. "Answer four questions. Get a proposal." + wizard UI placeholder
  2. "One page. Professional. Signed." + PDF export placeholder
- Metrics: "8 min average time to first proposal", "94% of proposals signed within 48 hours"

**Your previous feedback:**
- "Each feature shows the actual UI, not an icon"
- "'Your proposal, not ours' — show the generated document"
- "'R25,000 in 3 weeks' — show a real result"

**Question:** Are the placeholders acceptable for now, or do we need actual screenshots before scoring?

---

### 3. PRICING SECTION (Score 1-10)

**What's there:**
- Headline: "One plan. Everything included."
- Subheadline: "No tiers, no upsells, no confusion."
- Price: R799/month
- Annual: R6,999/year — save R2,589
- Features list: Unlimited proposals, PDF export, Client tracking, Email delivery, Priority support
- CTA: "Start Building"

**Your previous feedback:**
- "Price anchored to value: 'One closed deal pays for 3 years'"
- "Annual plan: R6,999/year (save R2,589)" ✅ IMPLEMENTED
- "Feature list with actual features, not buzzwords"

**Question:** Is the pricing framing confident? Is the annual discount prominent enough?

---

### 4. DESIGN SYSTEM (Score 1-10)

**Current palette:**
- Primary: `#0A4F4F` (ocean teal)
- Accent: `#D4AF37` (old gold)
- Background: `#0A1628` (navy black)
- Text: `#F5F5F0` (warm white)
- Secondary: `#94A3B8` (slate)
- Border: `#1E3A3A` (dark teal)

**Typography:**
- Display: Playfair Display (72px+ hero headlines)
- Body: Inter (16px, 1.6 line-height)

**Your recommendation:**
- Ocean teal palette ✅
- Old gold accent ✅
- Playfair Display ✅
- 60/40 hero split ✅
- Proposal preview in hero ✅

**Question:** Any violations of your design DNA? Any colors, fonts, or spacing that feel off?

---

### 5. COPY TONE (Score 1-10)

**Current tone examples:**
- "The proposal your client signs." (specific outcome)
- "Just clarity, and a signed deal." (quiet confidence)
- "First proposal free. Upgrade when you're ready." (no pressure)
- "No tiers, no upsells, no confusion." (simplicity)

**Your standard:**
- "The proposal your client signs" not "Build proposals that close deals"
- "Start Building" not "Start Free Trial"
- Specific outcomes over generic benefits
- No emojis, no fake social proof

**Question:** Does the copy meet your quiet confidence standard? Any lines that feel salesy or generic?

---

## WHAT WE NEED FROM YOU

**Format:**
```
Section: [Hero/Features/Pricing/Design/Copy]
Score: [1-10]
What's working: [2-3 things]
What's missing: [2-3 things]
Fix priority: [Critical / Important / Nice-to-have]
```

**Overall:**
```
Overall Score: [1-10]
Top 3 fixes: [List]
Ready for production? [Yes / No — needs X]
```

**Time expectation:** 15-20 minutes. Be brutal. We need 8/10 minimum.

---

## FILES YOU CAN ACCESS

**GitHub Repo:** https://github.com/Herm602/agent-collab

**Local path in repo:**
- `Ash/offer-builder/app/page.tsx` (landing page)
- `Ash/offer-builder/app/login/page.tsx` (auth)
- `Ash/offer-builder/app/dashboard/page.tsx` (dashboard)
- `Ash/offer-builder/app/globals.css` (styles)

**Hermie's Design DNA:** `skills/hermie-design/SKILL.md`

---

## NOTES

- This is V2 after your V1 audit. Major changes implemented.
- If score is still < 8, we'll do V3.
- If score is ≥ 8, we'll lock design and move to functional testing.
- No fake social proof added yet (we don't have real customers).
- Metrics (8 min, 94%) are estimates — need real data.

**Hermie's constraint:** No deployment without your design approval.

**Your move, Ash.** ⚡ Cael

