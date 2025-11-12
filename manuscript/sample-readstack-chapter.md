# Chapter X: Building ReadStack - Your First Maintainable App

In this tutorial, you'll build ReadStack - a personal "read later" URL manager - in under 3 hours. You'll learn the complete workflow from planning to deployment.

**What you'll build:** A working app to save articles, organize them with tags, and mark them as read.

**Time required:** 2.5-3 hours

**What makes this different:** You'll spend most of your time planning. Implementation becomes straightforward when you plan properly.

## Prerequisites

You'll need accounts and tools. Let's set them up now.

### Create Your v0 Account

v0 generates professional UI code from descriptions.

1. Go to [v0.dev](https://v0.dev)
2. Click "Sign up"
3. Sign in with GitHub
4. That's it - no credit card needed for the free tier

**What you get:** AI-generated Next.js components with shadcn/ui included.

### Create Your Supabase Account

Supabase handles authentication and database.

1. Go to [supabase.com](https://supabase.com)
2. Click "Start your project"
3. Sign in with GitHub
4. That's it - free tier includes 2 projects

**What you get:** PostgreSQL database, authentication, real-time subscriptions.

### Create Your Vercel Account

Vercel hosts your app in production.

1. Go to [vercel.com](https://vercel.com)
2. Click "Sign Up"
3. Sign in with GitHub
4. That's it - free tier includes unlimited deployments

**What you get:** One-click deployment with automatic builds on git push.

### Get Claude Pro

You need Claude Pro with Code access.

1. Go to [claude.ai](https://claude.ai)
2. Click "Upgrade to Pro"
3. Subscribe ($20/month)
4. You'll get access to Claude Code automatically

**What you get:** Claude Code CLI with extended context and tool use.

### Install Claude Code CLI

**macOS/Linux:**
```bash
curl -fsSL https://claude.ai/install.sh | sh
```

**Windows:**
Download the installer from [claude.ai/download](https://claude.ai/download)

Verify installation:
```bash
claude-code --version
```

**Troubleshooting:** If command not found, restart your terminal.

### Install Superpowers Plugin

Superpowers adds quality-gated workflows to Claude Code.

**Install via Claude Code:**
```bash
claude-code
```

In Claude Code, type:
```
/plugins install superpowers
```

Confirm with `y` when prompted.

**Verify installation:**
```
/plugins list
```

You should see `superpowers` in the list.

### Install Node.js and Git

**Check if you have them:**
```bash
node --version
git --version
```

**If you need Node.js:**
- Go to [nodejs.org](https://nodejs.org)
- Download LTS version (20.x or newer)
- Run installer

**If you need Git:**
- Go to [git-scm.com](https://git-scm.com)
- Download for your OS
- Run installer

### Install GitHub CLI (Optional but Recommended)

Makes creating repos easier.

**macOS:**
```bash
brew install gh
```

**Windows:**
Download from [cli.github.com](https://cli.github.com)

**Linux:**
```bash
# Debian/Ubuntu
sudo apt install gh

# Fedora
sudo dnf install gh
```

**Authenticate:**
```bash
gh auth login
```

Follow the prompts to connect your GitHub account.

---

## Setup Complete - Let's Build

You now have everything needed. Time to build ReadStack.

### Understanding the Workflow

Traditional coding:
1. Write code
2. Debug problems
3. Refactor mess
4. Ship (maybe)

Maintainable vibe coding:
1. **Plan** architecture (30 min)
2. **Design** UI with v0 (20 min)
3. **Build** backend (20 min)
4. **Implement** with quality gates (60 min)
5. **Deploy** to production (10 min)

Notice: Most time spent planning. Implementation is straightforward.

**Why this works:** Good architecture makes implementation obvious. Bad architecture makes everything hard.

---

## Step 1: Plan Your Architecture

Create your project:
```bash
mkdir readstack
cd readstack
claude-code
```

Claude Code opens. You'll see a prompt.

**Copy and paste this exactly:**

```
Let's brainstorm ReadStack - a personal read-later URL manager for developers.

PROBLEM: Developers have 100+ browser tabs of articles they want to read later, and browser bookmarks are chaos.

REQUIREMENTS:
- Single user only (no teams - YAGNI)
- Save URLs with metadata (title, description, image)
- Three states: To Read, Reading, Archived
- Tags for organization
- Fast UX: < 3 seconds from paste URL to saved

TECH STACK:
- Next.js 14+ with App Router
- Supabase (auth + database)
- shadcn/ui components
- Server Components by default
- Vercel deployment

PRINCIPLES TO FOLLOW:
- YAGNI: Only MVP features, no feature creep
- KISS: Simplest working solution
- SINE: Elegant simplicity worth the effort
- DMMT: Make wrong things impossible, right things effortless

What's the simplest data model that solves this problem? Let's design the architecture, data model, and user flows following these principles.
```

**What happens next:**

Claude asks questions about your requirements. Answer honestly. Examples:

**Claude might ask:** "Should archived articles be deletable?"
**You answer:** "Yes, users should be able to delete any article."

**Claude might ask:** "Do you need search functionality?"
**You answer:** "Not for MVP. We can add it later if users ask."

This continues for about 10-15 questions. Claude explores different architectural approaches and presents options.

**After ~30 minutes, you'll have:**
- Complete architecture document
- Data model (one table - simple!)
- User flow diagrams
- Technical decisions documented

**Location:** `docs/plans/2025-01-XX-readstack-design.md`

**Read it.** This is your roadmap.

---

## Step 2: Create Implementation Plan

Now break the architecture into tasks.

**Copy and paste this:**

```
Create a detailed implementation plan for ReadStack using your writing-plans skill.

Break the design into bite-sized tasks (2-5 minutes each) with:
- Exact file paths to create/modify
- Complete code examples (not abstractions)
- TDD approach: test first, then implementation
- Verification steps with expected output
- Git commits after each logical unit

FEATURES TO IMPLEMENT (in order):
1. Supabase authentication (email/password only)
2. Save URL with Open Graph metadata fetching
3. Article CRUD (create, read, update, delete)
4. Filter by status and tags
5. Article detail view with inline editing

Follow TDD throughout: write failing test → minimal code → refactor.
```

**What happens:**

Claude creates a detailed plan with numbered tasks. Each task includes:
- Exact files to modify
- Complete code (not "add auth here")
- Test to write first
- How to verify it works

**After ~20 minutes, you'll have:**
- Implementation plan with 15-25 tasks
- Each task takes 2-5 minutes
- Complete code examples included

**Location:** `docs/plans/2025-01-XX-readstack-implementation.md`

**Skim it.** You'll execute this task-by-task next.

---

## Step 3: Design UI with v0

Go to [v0.dev](https://v0.dev) in your browser.

### Authentication Pages

Click "New Design" and paste:

```
Create modern authentication pages for ReadStack, a URL manager app.

PAGES NEEDED:
- Login page with email/password
- Signup page with email, password, confirm password
- Password reset page

DESIGN:
- shadcn/ui components (v0 includes everything)
- Purple/indigo primary (reading/knowledge theme)
- Clean, minimal, focused on readability
- Mobile responsive
- Form validation errors inline
- Loading states for form submission
- "Remember me" checkbox on login

Style: Clean, minimal SaaS aesthetic
```

Click "Generate"

Wait 10-20 seconds.

**Review the result:**
- Click through the pages
- Check mobile view (bottom left icon)
- Looks good? Click "Export Code"

**Don't like it?** Click "Refine" and describe changes:
- "Make buttons larger"
- "Use a darker purple"
- "Add more spacing"

When satisfied, click "Export Code" → "Copy Code"

Save somewhere temporarily. You'll use it soon.

### Main Dashboard

Click "New Design" again and paste:

```
Create the main dashboard for ReadStack, a personal URL manager.

LAYOUT:
- Header: ReadStack logo, search bar, "Save URL" button (primary action)
- Three tabs: "To Read", "Reading", "Archive"
- Stats cards: Total Saved, This Month, Completed, Avg Rating
- Article grid (2-3 columns desktop, 1 column mobile)

ARTICLE CARDS:
- Preview image (gradient fallback if no image)
- Title (bold, 2 lines max)
- Description (gray, 3 lines max)
- URL domain (small, subtle)
- Tags as colored badges
- Status badge
- Hover: action buttons (Move to Reading, Archive, Delete)

FEATURES:
- User menu (avatar, settings, logout)
- Empty state with "Save your first article" CTA
- Mobile responsive

Use shadcn/ui. Modern cards with subtle shadows.
```

Generate → Review → Export Code → Copy

### Save URL Dialog

Click "New Design" again:

```
Create a "Save URL" dialog modal for ReadStack.

DIALOG CONTENTS:
- Large URL input (auto-focus, placeholder: "Paste URL here...")
- After URL entered, show:
  - Auto-fetched title (editable)
  - Auto-fetched description (editable)
  - Preview image thumbnail
  - Tags input (multi-select chips)
  - Notes textarea (optional)
  - Status dropdown: To Read (default), Reading, Archive
- Cancel and Save buttons

FEATURES:
- Loading state while fetching metadata
- Error state if URL invalid
- Success animation on save
- Keyboard shortcuts (Cmd+Enter to save, Esc to close)
- Full screen on mobile, centered on desktop

Use shadcn/ui dialog, input, textarea, badge components.
```

Generate → Review → Export Code → Copy

### Article Detail Page

One more design:

```
Create an article detail page for ReadStack.

LAYOUT:
- Back button (top left)
- Article preview image (hero, full width, 300px height)
- Title (large, editable inline on click)
- Original URL link (opens in new tab)
- Status dropdown and rating (1-5 stars)
- Tags (editable chips)
- Notes section (large textarea, auto-save on blur)
- Metadata: Saved date, Read date (if archived)
- Action buttons: "Mark as Read", "Archive", "Delete" (with confirmation)

FEATURES:
- Edit any field inline (click to edit)
- Auto-save changes (show "Saving..." indicator)
- Delete confirmation dialog
- "Open Original" button (prominent)

Use shadcn/ui. Reading-focused design, good typography, mobile responsive.
```

Generate → Review → Export Code → Copy

### Combine Everything

Now you have 4 v0 exports. Let's combine them.

In your `readstack` directory:

```bash
npx create-next-app@latest . --typescript --tailwind --app --no-src-dir
```

Answer the prompts:
- Would you like to use ESLint? **Yes**
- Would you like to use Turbopack? **No**
- Would you like to customize the default import alias? **No**

This creates a Next.js project.

Now copy your v0 exports:
- Auth pages → `app/(auth)/login/page.tsx`, etc.
- Dashboard → `app/(dashboard)/dashboard/page.tsx`
- Dialog component → `components/save-url-dialog.tsx`
- Detail page → `app/(dashboard)/articles/[id]/page.tsx`

Install dependencies:
```bash
npm install
```

Test it:
```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

You should see beautiful UI (no functionality yet).

---

## Step 4: Set Up Supabase

Go to [supabase.com](https://supabase.com)

Click "New Project"

Fill in:
- **Name:** readstack
- **Database Password:** Generate strong password, save it
- **Region:** Choose closest to you
- **Plan:** Free

Click "Create new project"

Wait 2-3 minutes for setup.

### Get Your API Keys

When ready:
1. Go to Project Settings (gear icon)
2. Click "API"
3. Copy two values:
   - **Project URL** (looks like `https://xyz.supabase.co`)
   - **anon public key** (long string)

Save these in a password manager. You'll need them soon.

### Create Database

Click "SQL Editor" in sidebar

Click "New Query"

Paste this entire SQL:

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

Click "Run" (or press Cmd+Enter)

You should see "Success. No rows returned"

Click "Table Editor" in sidebar - you should see `articles` table.

**Done.** Your database is ready.

---

## Step 5: Implement with Quality Gates

Back to Claude Code in your `readstack` directory.

**Copy and paste this:**

```
Use your subagent-driven-development skill to execute the ReadStack implementation plan at docs/plans/2025-01-XX-readstack-implementation.md

IMPLEMENTATION STANDARDS:
- Follow TDD strictly: write failing test first → minimal code → refactor
- Apply DRY: extract reusable patterns as you discover them
- Single responsibility: each component has one clear purpose
- Type safety: leverage TypeScript for compile-time guarantees
- Server Components by default, Client Components only when needed

QUALITY REQUIREMENTS:
- Every feature must have tests that failed first
- No production code without failing test first
- Clear error messages and boundaries
- Loading states for all async operations
- Optimistic updates where appropriate

Execute the plan with automatic quality gates between tasks.
```

**What happens:**

Claude spawns subagents to implement each task. After each task:
1. Automatic code review runs
2. Issues are identified (Critical, Important, Minor)
3. You fix Critical issues
4. Next task begins

This takes ~60 minutes for all features.

**You'll see output like:**

```
Task 1: Implementing authentication...
✓ Test written and failing
✓ Implementation complete
→ Running code review...
→ Critical issue found: Missing input validation
→ Fixing issue...
✓ Task 1 complete

Task 2: Implementing Save URL feature...
[continues...]
```

**Don't interfere.** Let the process run. Fix only Critical issues when asked.

**After all tasks complete:**

Final comprehensive review runs automatically. Fix any remaining Critical or Important issues.

---

## Step 6: Deploy to Production

Almost done. Let's ship it.

### Push to GitHub

```bash
git init
git add .
git commit -m "Initial commit: ReadStack MVP"
gh repo create readstack --public --source=. --remote=origin --push
```

If you don't have `gh`:
1. Go to [github.com/new](https://github.com/new)
2. Name: "readstack"
3. Create repository
4. Follow the push instructions shown

### Deploy to Vercel

Go to [vercel.com](https://vercel.com)

Click "Add New..." → "Project"

Import your `readstack` repository

**Settings:**
- Framework Preset: Next.js (detected automatically)
- Root Directory: `./` (leave default)
- Build Command: (leave default)

Click "Environment Variables"

Add two variables:
```
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

Click "Deploy"

Wait 2-3 minutes.

**Success!** 🎉

You'll see your deployment URL: `https://readstack-xyz.vercel.app`

### Configure Supabase Auth

One last step.

Go back to Supabase dashboard → Authentication → URL Configuration

Add these redirect URLs:
```
https://readstack-xyz.vercel.app/auth/callback
http://localhost:3000/auth/callback
```

Click "Save"

### Test Production

Visit your Vercel URL.

1. Sign up with email/password
2. Save a URL (try: `https://react.dev`)
3. See it appear in your "To Read" list
4. Click to view details
5. Mark as archived

**Everything works!**

---

## What You Just Did

In ~3 hours you:

✅ Planned architecture properly (30 min)
✅ Created detailed implementation plan (20 min)
✅ Generated professional UI with v0 (20 min)
✅ Set up Supabase backend (20 min)
✅ Implemented with quality gates (60 min)
✅ Deployed to production (10 min)

**Lines you wrote manually:** ~20

**Lines of production code:** ~2,000

**Quality gates passed:** All of them

**Technical debt:** Zero

**Time to ship next feature:** Fast (good architecture)

## The Secret

You spent 50 minutes planning (steps 1-2).

You spent 100 minutes implementing (steps 3-5).

Traditional approach: 10 min planning, 10 hours debugging spaghetti code.

**This is maintainable vibe coding:**
- Plan thoroughly
- Use tools (v0, Supabase, Claude Code)
- Enforce quality gates
- Ship with confidence

## What's Next

Try these enhancements:

**Easy (30 min each):**
- Add search functionality
- Add sorting (by date, rating)
- Add dark mode toggle

**Medium (1-2 hours each):**
- Chrome extension for one-click saving
- Collections/folders for organization
- Public reading lists (share your lists)

**Advanced (2-4 hours each):**
- Full-text search with Postgres
- RSS feed import
- Archive article content for offline reading
- Export to Markdown/PDF

Use the same workflow for each:
1. Brainstorm the feature
2. Write implementation plan
3. Execute with quality gates
4. Deploy

## Ready for More?

You've mastered the basics. Next tutorial: **TeamTask**

TeamTask adds:
- Multi-tenancy (teams)
- Role-based permissions
- Real-time collaboration
- Drag-and-drop kanban
- More complex data relationships

But you'll use the same workflow. That's the power of maintainable vibe coding - the process scales.

---

**You're now dangerous. Go build something amazing.**
