# Levinn Business OS

**One platform. Three products. African SMEs.**

## Products

| Product | Price | Status | Folder |
|---------|-------|--------|--------|
| **SOP Builder** | R499/mo | ✅ Built | `sop-builder-lite/` |
| **Time Tracker** | Free with SOP / R299 | ✅ Built | `time-tracker/` |
| **Offer Builder** | R799/mo | ✅ Built | `offer-builder/` |

## Quick Start

```bash
# 1. Read the setup guide
cat levinn-os/SETUP.md

# 2. Create Supabase project and run schema

# 3. Copy env vars to all apps
cp levinn-os/.env.local sop-builder-lite/
cp levinn-os/.env.local time-tracker/
cp levinn-os/.env.local offer-builder/

# 4. Test locally
cd sop-builder-lite && npm run dev
```

## UI Mockups

Open `UI Mockups/README.html` in your browser to see all 8 screens.

## Tech Stack

- **Framework:** Next.js 16 (App Router)
- **Language:** TypeScript
- **Styling:** Tailwind CSS v4
- **Database:** Supabase (PostgreSQL) — shared across all apps
- **Auth:** Supabase Auth (magic link)
- **Payments:** Stripe Payment Links
- **Deploy:** Vercel

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                   ONE SUPABASE PROJECT                   │
│                                                          │
│  profiles (shared auth + subscription)                  │
│  ├── sops + sop_steps                                   │
│  ├── time_entries                                       │
│  └── offers                                             │
└─────────────────────────────────────────────────────────┘
         │                │                │
         ▼                ▼                ▼
   ┌──────────┐   ┌──────────┐   ┌──────────┐
   │   SOP    │   │  Time    │   │  Offer   │
   │ Builder  │   │ Tracker  │   │ Builder  │
   └──────────┘   └──────────┘   └──────────┘
```

## Pricing Strategy

| Tier | Products | Price |
|------|----------|-------|
| **Free** | First offer only | R0 |
| **SOP Pro** | SOP Builder + Time Tracker | R499/mo |
| **Offer Pro** | Offer Builder | R799/mo |
| **All Access** | All 3 products | R1,499/mo |

## Roadmap

- [x] SOP Builder Lite (MVP)
- [x] Time Tracker (MVP)
- [x] Offer Builder (MVP)
- [ ] Deploy all 3 to Vercel
- [ ] First paying customer
- [ ] AI enhancement (Anthropic API)
- [ ] WhatsApp Bot Suite
- [ ] Unified dashboard
- [ ] Multi-tenant organizations

## License

Proprietary — Levinn Group

---

© 2026 Levinn Group. Built for African SMEs.
