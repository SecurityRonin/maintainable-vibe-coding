# Chapter 14: Setting Up Supabase

Time to create your backend.

**Time required:** 20 minutes

**What you'll get:** Database, authentication, and API credentials.

---

## Create Supabase Project

Go to [supabase.com](https://supabase.com)

Click "New project"

![Screenshot: Supabase new project](#placeholder-supabase-new)

**Fill in:**
- Organization: (choose one or create new)
- Name: `readstack`
- Database Password: Click "Generate a password"
- **Copy the password and save it somewhere safe**
- Region: Choose closest to you
- Plan: Free

Click "Create new project"

Wait 2-3 minutes.

![Screenshot: Supabase provisioning](#placeholder-supabase-provisioning)

---

## Get API Credentials

When project is ready:

1. Click "Project Settings" (gear icon, bottom left)
2. Click "API" in the sidebar
3. You'll see:
   - Project URL: `https://xyz.supabase.co`
   - anon public key: `eyJhbGciOi...` (long string)

**Copy both values.**

Create a file to store them temporarily:

```bash
# In your readstack directory
echo "NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co" > .env.local
echo "NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key_here" >> .env.local
```

Replace with your actual values.

![Screenshot: Supabase API keys](#placeholder-supabase-api-keys)

---

## Create Database Schema

Click "SQL Editor" (left sidebar)

Click "New query"

![Screenshot: SQL editor](#placeholder-sql-editor)

Copy and paste this entire SQL:

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

-- Create indexes for faster queries
CREATE INDEX articles_user_id_idx ON articles(user_id);
CREATE INDEX articles_status_idx ON articles(status);
CREATE INDEX articles_saved_at_idx ON articles(saved_at DESC);

-- Enable Row Level Security
ALTER TABLE articles ENABLE ROW LEVEL SECURITY;

-- RLS Policies: Users can only see/modify their own articles
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

-- Auto-update read_at timestamp
CREATE OR REPLACE FUNCTION update_read_at()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.status = 'archived' AND (OLD.status IS NULL OR OLD.status != 'archived') THEN
    NEW.read_at = NOW();
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_read_at
  BEFORE UPDATE ON articles
  FOR EACH ROW
  EXECUTE FUNCTION update_read_at();
```

Click "Run" (bottom right) or press Cmd/Ctrl + Enter

You should see:
```
Success. No rows returned
```

![Screenshot: SQL executed](#placeholder-sql-executed)

---

## Verify Database

Click "Table Editor" (left sidebar)

You should see `articles` table.

Click on it to see the columns:
- id (uuid)
- user_id (uuid)
- url (text)
- title (text)
- description (text)
- image_url (text)
- status (text)
- rating (int4)
- notes (text)
- tags (array)
- saved_at (timestamptz)
- read_at (timestamptz)

![Screenshot: Table editor](#placeholder-table-editor)

---

## Enable Realtime (Optional)

This is optional for ReadStack, but good to enable:

1. In Table Editor, click `articles` table
2. Click settings icon (top right of table)
3. Enable "Realtime"
4. Click "Save"

This allows real-time updates if you add that feature later.

![Screenshot: Enable realtime](#placeholder-enable-realtime)

---

## What Just Happened?

**You created:**
- PostgreSQL database (fully managed)
- One table: `articles`
- Three indexes for performance
- Row Level Security (automatic user data isolation)
- Four RLS policies (users can only access their own data)
- Trigger to auto-update `read_at` timestamp

**You didn't:**
- Install PostgreSQL
- Configure server
- Write backup scripts
- Set up SSL certificates
- Manage scaling

Supabase handles all of that.

---

## Test Authentication (Quick Check)

Let's verify auth works:

1. Click "Authentication" (left sidebar)
2. Click "Users" tab
3. Currently empty - that's normal

When you implement signup in Chapter 15, users will appear here.

![Screenshot: Empty users table](#placeholder-empty-users)

---

## Security Check

**Row Level Security is enabled.**

This means:
- Users can only see their own articles
- No user can access another user's data
- Enforced at database level (can't bypass)

Try this test:

In SQL Editor, run:
```sql
SELECT * FROM articles;
```

You'll see:
```
No rows returned
```

Why? Because there's no authenticated user context. RLS blocks the query.

**This is good. Your data is secure.**

---

## Save Your Credentials

You have three critical values:

1. **Project URL:** `https://xyz.supabase.co`
2. **anon public key:** `eyJhbGciOi...`
3. **Database password:** (from project creation)

**Make sure they're in `.env.local`:**

```bash
cat .env.local
```

You should see:
```
NEXT_PUBLIC_SUPABASE_URL=https://xyz.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOi...
```

**Don't commit this file to git:**

```bash
echo ".env.local" >> .gitignore
```

---

## What You Learned

- Supabase provides managed PostgreSQL + Auth
- One table is enough for ReadStack
- Row Level Security isolates user data automatically
- Environment variables store credentials
- Database is ready for implementation

**What you have:**
- Architecture design (Chapter 11)
- Implementation plan (Chapter 12)
- UI components (Chapter 13)
- Database created (this chapter)
- API credentials saved

**What you don't have yet:**
- Working authentication
- Integrated components
- Metadata fetching
- Deployed app

**Next:** Chapter 15 - Implementation with Quality Gates (60 min)

You'll build everything, with automatic code review after each task.

---

## Time Check

**Planned:** 20 minutes

**Actual:** Probably 15-25 minutes

Most of the time is waiting for project provisioning (2-3 min) and running SQL (instant).

---

## Common Issues

**Issue: Can't find Project Settings**

Look for gear icon in bottom left corner. Click it.

**Issue: SQL query fails**

Make sure you copied the entire SQL block. Missing semicolons or partial code will fail.

**Issue: Can't see articles table**

Refresh the page. Sometimes Table Editor doesn't update immediately.

**Issue: Lost my API keys**

Go to Project Settings → API. You can always view them there.

---

## Next Chapter Preview

In Chapter 15, you'll:
- Use subagent-driven-development skill
- Implement all features with automatic quality gates
- TDD enforced throughout
- Code review after each task
- 60 minutes from zero to working app

Your database is ready. Time to build.
