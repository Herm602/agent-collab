# Levinn Business OS — Setup Guide

## One Supabase Project for All 3 Apps

Instead of 3 separate Supabase projects, all apps share one:

```
┌─────────────────────────────────────────────────────────┐
│              ONE SUPABASE PROJECT                        │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │   profiles   │  │     sops     │  │    offers    │  │
│  │  (shared)    │  │  + steps     │  │              │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
│  ┌──────────────┐                                        │
│  │ time_entries │                                        │
│  └──────────────┘                                        │
└─────────────────────────────────────────────────────────┘
         │                │                │
         ▼                ▼                ▼
   SOP Builder     Time Tracker    Offer Builder
   (R499/mo)       (Free/R299)     (R799/mo)
```

**Benefits:**
- Single sign-on across all apps
- One subscription/profile table
- Easier to bundle products
- Lower cost (one project, not three)

---

## Step 1: Create Supabase Project

1. Go to [supabase.com](https://supabase.com)
2. Click **New Project**
3. Name: `levinn-os` (or `levinn-business-os`)
4. Database password: Save this securely
5. Region: Choose closest to you (e.g., `Cape Town` if available, otherwise `EU West`)
6. Wait 2-3 minutes for setup

---

## Step 2: Run the Schema

1. In your Supabase dashboard, go to **SQL Editor** (left sidebar)
2. Click **New Query**
3. Copy/paste the entire content of `levinn-os/supabase/schema.sql`
4. Click **Run** (or Cmd/Ctrl+Enter)
5. You should see: `Success. No rows returned`

**Verify tables created:**
- Go to **Table Editor** (left sidebar)
- You should see: `profiles`, `sops`, `sop_steps`, `time_entries`, `offers`

---

## Step 3: Get API Credentials

1. Go to **Project Settings** (gear icon, bottom left)
2. Click **API**
3. Copy these two values:
   - **Project URL** (looks like: `https://xxxxxxxxxxxxx.supabase.co`)
   - **anon/public key** (long string starting with `eyJ...`)

---

## Step 4: Configure All 3 Apps

Copy `.env.local` to each app folder:

```bash
# Copy the shared env file
cp levinn-os/.env.local sop-builder-lite/.env.local
cp levinn-os/.env.local time-tracker/.env.local
cp levinn-os/.env.local offer-builder/.env.local
```

Then edit each `.env.local` with your Supabase credentials:

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

---

## Step 5: Test Locally

Run each app in a separate terminal:

```bash
# Terminal 1: SOP Builder
cd sop-builder-lite
npm run dev
# http://localhost:3000

# Terminal 2: Time Tracker
cd time-tracker
npm run dev
# http://localhost:3001  (change port in package.json if needed)

# Terminal 3: Offer Builder
cd offer-builder
npm run dev
# http://localhost:3002  (change port in package.json if needed)
```

**Test flow:**
1. Open SOP Builder → Sign up with magic link
2. Create an SOP
3. Open Time Tracker → Sign in with same email
4. Log time
5. Open Offer Builder → Sign in with same email
6. Create an offer

All 3 apps should share the same user account!

---

## Step 6: Deploy to Vercel

### Option A: Three Separate Vercel Projects (Recommended)

```bash
# SOP Builder
cd sop-builder-lite
vercel --prod

# Time Tracker
cd time-tracker
vercel --prod

# Offer Builder
cd offer-builder
vercel --prod
```

In Vercel dashboard for each project:
1. Go to **Settings** → **Environment Variables**
2. Add: `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`
3. Redeploy

### Option B: One Monorepo (Advanced)

Use Turborepo or Nx to manage all 3 apps in one repo. Do this after you have paying customers.

---

## Step 7: Stripe Setup

### Create Payment Links

1. Go to [Stripe Dashboard](https://dashboard.stripe.com/products)
2. Create 3 products:

| Product | Price | Description |
|---------|-------|-------------|
| SOP Builder Pro | R499/month | Unlimited SOPs, PDF export, owner assignment |
| Time Tracker Pro | R299/month | Unlimited entries, weekly reports (or free with SOP) |
| Offer Builder Pro | R799/month | Unlimited offers, AI enhancement, PDF export |

3. For each product, create a **Payment Link**
4. Copy the URLs to your `.env.local` files

### Activate Subscription After Payment

For MVP, manually activate:
1. Customer pays via Stripe link
2. You get email notification
3. In Supabase → Table Editor → `profiles`
4. Find user → Set `is_subscriber = true`, `subscription_tier = 'sop_pro'`

For V2, add Stripe webhooks to automate this.

---

## Troubleshooting

### "Table does not exist"
- Run the schema.sql file again
- Check Table Editor to verify tables were created

### "Cannot authenticate"
- Verify API key is correct (starts with `eyJ...`)
- Check that `on_auth_user_created` trigger exists

### "RLS policy violation"
- This is expected if trying to access another user's data
- RLS ensures users can only see their own data

### Port already in use (localhost:3000)
Edit `package.json`:
```json
{
  "scripts": {
    "dev": "next dev -p 3001"
  }
}
```

---

## Next Steps After Setup

1. ✅ Test all 3 apps locally
2. ✅ Deploy to Vercel
3. ✅ Create Stripe payment links
4. ✅ First paying customer
5. ⏳ Add AI features (Anthropic API)
6. ⏳ Build WhatsApp Bot Suite
7. ⏳ Bundle all apps into one dashboard

---

**Questions?** Open an issue or check the Supabase docs: https://supabase.com/docs
