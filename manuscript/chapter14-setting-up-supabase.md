# Chapter 14: Setting Up Supabase

Create your backend.

**Time:** 20 minutes

**What you'll get:** Database, authentication, API credentials.

## Create Project

**1. Go to [supabase.com](https://supabase.com)**

**2. Click "New project"**

**3. Fill in:**
- Organization: Choose one or create new
- Name: `readstack`
- Database Password: Click "Generate a password" → **Copy and save it**
- Region: Choose closest to you
- Plan: Free

**4. Click "Create new project"**

Wait 2-3 minutes for provisioning.

## Get API Credentials

**1. Click "Project Settings" (gear icon)**

**2. Click "API"**

**3. Copy these values:**
- Project URL: `https://xyz.supabase.co`
- anon public key: `eyJhbGciOi...`

**4. Create `.env.local` in your project:**

```bash
cd readstack
echo "NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co" > .env.local
echo "NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key_here" >> .env.local
```

Replace with your actual values.

## Create Database Schema

**1. Click "SQL Editor" (left sidebar)**

**2. Click "New query"**

**3. Paste this SQL:**

```sql
-- Create articles table
CREATE TABLE articles (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  url TEXT NOT NULL,
  title TEXT,
  description TEXT,
  image_url TEXT,
  status TEXT DEFAULT 'to_read' CHECK (status IN ('to_read', 'reading', 'archived')),
  rating INTEGER CHECK (rating >= 1 AND rating <= 5),
  notes TEXT,
  tags TEXT[] DEFAULT '{}',
  saved_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  read_at TIMESTAMP WITH TIME ZONE
);

-- Create indexes
CREATE INDEX articles_user_id_idx ON articles(user_id);
CREATE INDEX articles_status_idx ON articles(status);
CREATE INDEX articles_saved_at_idx ON articles(saved_at DESC);

-- Enable Row Level Security
ALTER TABLE articles ENABLE ROW LEVEL SECURITY;

-- RLS Policies
CREATE POLICY "Users can view own articles"
  ON articles FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can create own articles"
  ON articles FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own articles"
  ON articles FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own articles"
  ON articles FOR DELETE
  USING (auth.uid() = user_id);
```

**4. Click "Run" (bottom right)**

Should show: "Success. No rows returned"

## Enable Email Authentication

**1. Click "Authentication" (left sidebar)**

**2. Click "Providers"**

**3. Find "Email" → should already be enabled**

If not, toggle it on.

## Test Database

**1. Click "Table Editor" (left sidebar)**

**2. Should see `articles` table**

**3. Click it → empty table with columns**

If you see the table structure, database is ready.

## What You Have

- Supabase project running
- `articles` table created
- Row Level Security enabled
- 4 RLS policies protecting data
- Email authentication enabled
- API credentials saved

Backend complete.

## Next

Chapter 15 - Implementation (60 min)

Use subagent-driven-development to build the complete app.
