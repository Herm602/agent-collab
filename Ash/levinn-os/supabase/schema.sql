-- Levinn Business OS — Unified Schema
-- All 3 apps share one Supabase project
-- Run this ONCE in your Supabase SQL Editor

-- ============================================
-- PROFILES (shared auth for all apps)
-- ============================================
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  company_name TEXT,
  is_subscriber BOOLEAN DEFAULT FALSE,
  subscription_tier TEXT CHECK (subscription_tier IN ('free', 'sop_pro', 'time_pro', 'offer_pro', 'all_access')) DEFAULT 'free',
  stripe_customer_id TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- SOP BUILDER TABLES
-- ============================================
CREATE TABLE sops (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT,
  owner_name TEXT,
  status TEXT CHECK (status IN ('draft', 'published', 'archived')) DEFAULT 'draft',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE sop_steps (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  sop_id UUID REFERENCES sops(id) ON DELETE CASCADE,
  step_number INTEGER NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- TIME TRACKER TABLES
-- ============================================
CREATE TABLE time_entries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  task_name TEXT NOT NULL,
  category TEXT CHECK (category IN ('sales', 'delivery', 'admin', 'strategy', 'support', 'other')),
  duration_minutes INTEGER NOT NULL,
  date DATE NOT NULL,
  value_label TEXT CHECK (value_label IN ('$', '$$', '$$$')) DEFAULT '$$',
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- OFFER BUILDER TABLES
-- ============================================
CREATE TABLE offers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  name TEXT,
  problem_statement TEXT NOT NULL,
  outcome_promise TEXT NOT NULL,
  timeline_days INTEGER NOT NULL,
  price_cents INTEGER NOT NULL,
  target_audience TEXT,
  refined_problem TEXT,
  refined_outcome TEXT,
  value_proposition TEXT,
  status TEXT CHECK (status IN ('draft', 'published', 'archived')) DEFAULT 'draft',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- INDEXES
-- ============================================
CREATE INDEX idx_sops_user ON sops(user_id);
CREATE INDEX idx_sops_status ON sops(status);
CREATE INDEX idx_sop_steps_sop ON sop_steps(sop_id);
CREATE INDEX idx_time_entries_user ON time_entries(user_id);
CREATE INDEX idx_time_entries_date ON time_entries(date);
CREATE INDEX idx_time_entries_category ON time_entries(category);
CREATE INDEX idx_offers_user ON offers(user_id);
CREATE INDEX idx_offers_status ON offers(status);

-- ============================================
-- ROW LEVEL SECURITY
-- ============================================
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE sops ENABLE ROW LEVEL SECURITY;
ALTER TABLE sop_steps ENABLE ROW LEVEL SECURITY;
ALTER TABLE time_entries ENABLE ROW LEVEL SECURITY;
ALTER TABLE offers ENABLE ROW LEVEL SECURITY;

-- Profiles: users can only see/edit their own
CREATE POLICY "Users can view own profile" ON profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile" ON profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON profiles
  FOR UPDATE USING (auth.uid() = id);

-- SOPs: users can only CRUD their own
CREATE POLICY "Users can CRUD own SOPs" ON sops
  FOR ALL USING (auth.uid() = user_id);

CREATE POLICY "Users can CRUD steps for own SOPs" ON sop_steps
  FOR ALL USING (
    EXISTS (SELECT 1 FROM sops WHERE sops.id = sop_steps.sop_id AND sops.user_id = auth.uid())
  );

-- Time entries: users can only CRUD their own
CREATE POLICY "Users can CRUD own time entries" ON time_entries
  FOR ALL USING (auth.uid() = user_id);

-- Offers: users can only CRUD their own
CREATE POLICY "Users can CRUD own offers" ON offers
  FOR ALL USING (auth.uid() = user_id);

-- ============================================
-- TRIGGER: Create profile on signup
-- ============================================
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name)
  VALUES (NEW.id, NEW.email, NEW.raw_user_meta_data->>'full_name');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ============================================
-- HELPER VIEWS
-- ============================================
-- Weekly time summary (for Time Tracker dashboard)
CREATE VIEW weekly_time_summary AS
SELECT
  user_id,
  DATE_TRUNC('week', date) as week_start,
  SUM(duration_minutes) as total_minutes,
  SUM(CASE WHEN value_label = '$$$' THEN duration_minutes ELSE 0 END) as high_value_minutes,
  SUM(CASE WHEN value_label = '$' THEN duration_minutes ELSE 0 END) as low_value_minutes
FROM time_entries
GROUP BY user_id, DATE_TRUNC('week', date);

-- SOP step counts (for SOP Builder dashboard)
CREATE VIEW sop_step_counts AS
SELECT
  s.id as sop_id,
  s.user_id,
  COUNT(ss.id) as step_count
FROM sops s
LEFT JOIN sop_steps ss ON s.id = ss.sop_id
GROUP BY s.id, s.user_id;
