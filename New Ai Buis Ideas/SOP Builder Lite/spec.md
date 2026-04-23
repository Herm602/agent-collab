# SOP Builder Lite — MVP Design Spec
**Version:** 1.0 (Lite)
**Date:** 2026-04-17
**Build Target:** 3-4 days
**Price:** R499/month

---

## Overview

SOP Builder Lite is a ruthlessly scoped MVP for South African SMEs to document Standard Operating Procedures.

**Core Value:** Get SOPs out of your head and into a shareable format in 10 minutes.

---

## Scope (Lite vs Full)

| Feature | Lite (MVP) | Full (V2) |
|---------|-----------|-----------|
| Steps | Text only | Text + screenshots |
| Owner | Single owner dropdown | Multiple assignees per step |
| Version history | ❌ No | ✅ Yes |
| Templates | ❌ No | ✅ Template gallery |
| AI suggestions | ❌ No | ✅ AI-powered |
| Multi-user org | ❌ No (single user) | ✅ Teams |
| Export | PDF only | PDF, shareable link, Notion export |
| Auth | Email magic link | SSO, SAML, custom domains |

---

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Next.js 14 App Router                 │
│  ┌─────────────────────────────────────────────────┐    │
│  │  Pages: /, /dashboard, /sop/new, /sop/[id]      │    │
│  │  API: /api/sops, /api/steps                     │    │
│  └─────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                      Supabase                            │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────┐  │
│  │  PostgreSQL │  │    Auth     │  │    (Storage V2) │  │
│  │  (3 tables) │  │  (Magic Lnk)│  │                 │  │
│  └─────────────┘  └─────────────┘  └─────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

---

## Data Model

```sql
-- Profiles (extends auth.users)
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  is_subscriber BOOLEAN DEFAULT FALSE,
  stripe_customer_id TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- SOPs
CREATE TABLE sops (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT,
  owner_name TEXT, -- Simple text field, no user FK in Lite
  status TEXT CHECK (status IN ('draft', 'published')) DEFAULT 'draft',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- SOP Steps
CREATE TABLE sop_steps (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  sop_id UUID REFERENCES sops(id) ON DELETE CASCADE,
  step_number INTEGER NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_sops_user ON sops(user_id);
CREATE INDEX idx_steps_sop ON sop_steps(sop_id, step_number);

-- RLS Policies
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE sops ENABLE ROW LEVEL SECURITY;
ALTER TABLE sop_steps ENABLE ROW LEVEL SECURITY;

-- Profiles: users can only see their own
CREATE POLICY "Users can view own profile" ON profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile" ON profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON profiles
  FOR UPDATE USING (auth.uid() = id);

-- SOPs: users can only see their own
CREATE POLICY "Users can CRUD own SOPs" ON sops
  FOR ALL USING (auth.uid() = user_id);

-- Steps: users can only see steps for their own SOPs
CREATE POLICY "Users can CRUD steps for own SOPs" ON sop_steps
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM sops WHERE sops.id = sop_steps.sop_id AND sops.user_id = auth.uid()
    )
  );
```

---

## Routes

| Route | Type | Purpose |
|-------|------|---------|
| `GET /` | Page | Landing page + CTA |
| `GET /login` | Page | Login (magic link) |
| `GET /dashboard` | Page | List user's SOPs |
| `GET /sop/new` | Page | Create new SOP |
| `GET /sop/[id]` | Page | View/edit SOP |
| `GET /api/sops` | API | List SOPs |
| `POST /api/sops` | API | Create SOP |
| `GET /api/sops/[id]` | API | Get SOP + steps |
| `PUT /api/sops/[id]` | API | Update SOP |
| `DELETE /api/sops/[id]` | API | Delete SOP |
| `POST /api/sops/[id]/steps` | API | Add step |
| `PUT /api/sops/[id]/steps` | API | Update/reorder steps |
| `DELETE /api/sops/[id]/steps/[stepId]` | API | Delete step |
| `GET /api/sops/[id]/export` | API | Export PDF |

---

## UI Components

### Core Components
- `SopCard` — Preview card for dashboard list
- `SopForm` — Create/edit SOP (title, description, owner)
- `StepList` — Ordered list of steps with edit/delete
- `StepInput` — Add new step (textarea + add button)
- `OwnerDropdown` — Simple text input for owner name (Lite)
- `PdfExportButton` — Triggers PDF generation

### Layout Components
- `Header` — Logo, nav links, user menu
- `DashboardLayout` — Sidebar + main content area

---

## Auth Flow (Supabase Magic Link)

1. User enters email on `/login`
2. Supabase sends magic link
3. User clicks link → redirected to `/dashboard`
4. Session stored in cookie

---

## Payment Flow (Stripe Payment Link)

1. User clicks "Upgrade to Pro" in dashboard
2. Redirect to Stripe Checkout (R499/month)
3. After payment → webhook updates `profiles.is_subscriber = true`
4. Dashboard shows "Pro" badge

**Note:** For Lite MVP, we can skip webhook and manually activate after first payment (honor system for week 1).

---

## PDF Export

Use `@react-pdf/renderer` for client-side PDF generation:
- SOP title, description, owner
- Numbered steps
- Clean, printable format

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Next.js 14 (App Router) |
| Language | TypeScript |
| Styling | Tailwind CSS |
| UI Components | shadcn/ui (minimal) |
| Database | Supabase PostgreSQL |
| Auth | Supabase Auth (magic link) |
| ORM | None (raw SQL via Supabase client) |
| PDF | @react-pdf/renderer |
| Payments | Stripe Payment Link |
| Deploy | Vercel |

---

## Build Order (3-4 Days)

| Day | Focus | Deliverable |
|-----|-------|-------------|
| 1 | Setup + Auth | Supabase project, Next.js init, login working |
| 2 | SOP CRUD | Create, list, view, delete SOPs |
| 3 | Steps + Export | Add/edit/delete steps, PDF export |
| 4 | Polish + Deploy | Stripe link, testing, Vercel deploy |

---

## Success Criteria (MVP)

- [ ] User can sign up with magic link
- [ ] User can create an SOP with 5+ steps
- [ ] User can export SOP as PDF
- [ ] User can see dashboard of all SOPs
- [ ] Stripe payment link works (manual activation for week 1)
- [ ] Deployed to Vercel, accessible via custom domain

---

## Out of Scope (V2)

- Version history
- Templates
- AI suggestions
- Screenshot uploads
- Multi-user organizations
- Shareable public links

---

**To Build:** Follow this spec + Karpathy guidelines (simple, surgical, no over-engineering).
