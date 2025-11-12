# ReadStack Tutorial: Complete Plan

This document outlines the full tutorial for building ReadStack - a personal "read later" URL manager showcasing maintainable vibe coding workflow.

## Tutorial Overview

**What you'll build:** ReadStack - A personal URL/article manager with "read later" functionality

**Time to complete:** 2.5-3 hours (vs. 1-2 weeks traditional)

**What you'll learn:**
- Planning before coding (the secret to maintainable apps)
- v0 for rapid UI design (builds everything from scratch)
- Supabase for backend (auth + database)
- Claude Code + Superpowers for quality-gated development
- Vercel for deployment

**Why this is a great starter project:**
- One table database (minimal complexity)
- No teams or permissions (YAGNI)
- No real-time needed (simpler than TeamTask)
- Immediately useful (solve the "too many tabs" problem)
- Teaches core patterns without overwhelming

## Database Schema

### Tables

#### users (Supabase Auth)
```sql
-- Managed by Supabase Auth
-- Automatically created
id: uuid (primary key)
email: text
created_at: timestamp
```

#### articles
```sql
id: uuid (primary key, default: gen_random_uuid())
user_id: uuid (foreign key -> auth.users, not null)
url: text (not null)
title: text
description: text
image_url: text
status: text (enum: 'to_read', 'reading', 'archived', default: 'to_read')
rating: integer (1-5, nullable)
notes: text
tags: text[] (array of strings)
saved_at: timestamp (default: now())
read_at: timestamp (nullable)
```

### Row Level Security (RLS) Policies

```sql
-- Enable RLS
ALTER TABLE articles ENABLE ROW LEVEL SECURITY;

-- Users can only see their own articles
CREATE POLICY "Users can view own articles"
  ON articles FOR SELECT
  USING (auth.uid() = user_id);

-- Users can insert their own articles
CREATE POLICY "Users can create own articles"
  ON articles FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Users can update their own articles
CREATE POLICY "Users can update own articles"
  ON articles FOR UPDATE
  USING (auth.uid() = user_id);

-- Users can delete their own articles
CREATE POLICY "Users can delete own articles"
  ON articles FOR DELETE
  USING (auth.uid() = user_id);
```

### Database Functions (Optional Enhancement)

```sql
-- Function to update read_at timestamp when status changes to 'archived'
CREATE OR REPLACE FUNCTION update_read_at()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.status = 'archived' AND OLD.status != 'archived' THEN
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

## Step-by-Step Tutorial Content

### Introduction

**Goal:** Build ReadStack in 2.5-3 hours using maintainable vibe coding workflow

**What makes this maintainable AND fast:**
- Plan thoroughly first (70% of effort on architecture)
- v0 generates UI code with all dependencies
- Supabase handles 100% of backend
- Claude Code with Superpowers ensures quality through automated gates
- Implementation becomes "just executing a good plan"

**The Philosophy:**
> "A stitch in time saves nine" - We spend most of our time planning and designing. This prevents spaghetti code and makes implementation straightforward. This isn't about one-shot prompts creating magic apps. It's about using AI to help you plan thoroughly, then systematically executing that plan with quality gates.

**Prerequisites:**
- Accounts: v0, Supabase, GitHub, Vercel, Claude Pro with Superpowers
- Tools: Node.js 18+, Git, Claude Code CLI
- Time: 2.5-3 hours (single session recommended)

---

### Step 0: Architecture Planning (30 min)

**Objective:** Design the complete architecture before writing any code

**Instructions:**

Open Claude Code in your project directory:
```bash
mkdir readstack
cd readstack
claude-code
```

**Copy and paste this prompt:**

```
"Let's brainstorm ReadStack - a personal read-later URL manager for developers.

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

What's the simplest data model that solves this problem? Let's design the architecture, data model, and user flows following these principles."
```

**What happens:** This invokes the **brainstorming skill** which guides you through designing the architecture properly. You'll answer questions about requirements, review 2-3 architectural approaches, and validate the design section-by-section.

**You'll get:** A design document saved to `docs/plans/YYYY-MM-DD-readstack-design.md` with your complete architecture.

**Time:** ~30 minutes

**Screenshot locations:**
- `resources/images/readstack/step0-brainstorming-prompt.png`
- `resources/images/readstack/step0-design-questions.png`
- `resources/images/readstack/step0-architecture-options.png`
- `resources/images/readstack/step0-design-document.png`

**Video:**
- `[Loom: Planning ReadStack architecture with brainstorming skill]`

**Pro tips:**
- Answer questions honestly - the skill guides you to the right design
- Don't rush - thorough planning saves implementation time
- If you're unsure, the skill will propose options and explain trade-offs
- The design document becomes your roadmap

---

### Step 1: Create Implementation Plan (20 min)

**Objective:** Break architecture into bite-sized, testable tasks

**Instructions:**

After your design is approved, **copy and paste this prompt:**

```
"Create a detailed implementation plan for ReadStack using your writing-plans skill.

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

Follow TDD throughout: write failing test → minimal code → refactor."
```

**What happens:** This invokes the **writing-plans skill** which creates a detailed implementation plan assuming zero context about your codebase.

**You'll get:** A plan document at `docs/plans/YYYY-MM-DD-readstack-implementation.md` with numbered tasks, exact code, and verification steps.

**Time:** ~20 minutes

**Screenshot locations:**
- `resources/images/readstack/step1-plan-prompt.png`
- `resources/images/readstack/step1-plan-document.png`
- `resources/images/readstack/step1-task-breakdown.png`

**Video:**
- `[Loom: Creating detailed implementation plan]`

**Pro tips:**
- The plan is your checklist - you'll execute it task-by-task
- Each task takes 2-5 minutes (if longer, the plan will break it down)
- Tasks include complete code, not "add authentication here"
- Plan enforces TDD: test before implementation

---

### Step 2: Design UI with v0 (20 min)

**Objective:** Generate all UI components with v0

**Instructions:**

Now that you have architecture and plan, design the UI.

**2.1 Authentication Pages**

Go to [v0.dev](https://v0.dev) and paste this prompt:

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

Click "Generate" → Review → "Export Code"

**2.2 Main Dashboard**

New v0 design, paste this prompt:

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

Click "Generate" → Review → "Export Code"

**2.3 Save URL Dialog**

New v0 design, paste this prompt:

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

Click "Generate" → Review → "Export Code"

**2.4 Article Detail Page**

New v0 design, paste this prompt:

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

Click "Generate" → Review → "Export Code"

**2.5 Combine v0 Exports**

v0 gives you separate exports. Create a new Next.js project:

```bash
# In your readstack directory
npx create-next-app@latest . --typescript --tailwind --app --no-src-dir
```

Copy the v0 exports into your project:
- Auth pages → `app/(auth)/login/page.tsx`, etc.
- Dashboard → `app/(dashboard)/dashboard/page.tsx`
- Components → `components/` directory

Install dependencies from v0:
```bash
npm install
```

**Expected result:** Complete Next.js app with beautiful UI, all dependencies installed, ready to wire up functionality.

**Screenshot locations:**
- `resources/images/readstack/step2-v0-auth-prompt.png`
- `resources/images/readstack/step2-v0-dashboard.png`
- `resources/images/readstack/step2-v0-dialog.png`
- `resources/images/readstack/step2-v0-detail.png`
- `resources/images/readstack/step2-local-preview.png`

**Video:**
- `[Loom: Designing all UI with v0]`

**Pro tips:**
- v0 includes shadcn/ui setup automatically - no manual config needed
- Review mobile and desktop views in v0 preview
- If design isn't perfect, use v0's "Refine" feature
- Export gives complete, working Next.js code

---

### Step 3: Set Up Supabase Backend (20 min)

**Objective:** Create database and authentication

**Instructions:**

**3.1 Create Supabase Project**
1. Go to [supabase.com](https://supabase.com)
2. Click "New Project"
3. Name: "readstack"
4. Database password: (generate strong password, save it)
5. Region: Choose closest to you
6. Click "Create"
7. Wait ~2 minutes for provisioning

**3.2 Get API Credentials**
1. Go to Project Settings → API
2. Copy:
   - Project URL
   - `anon` `public` key
3. Save these - you'll need them

**3.3 Create Database Schema**

Go to SQL Editor → New Query, paste this:

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

-- Function to auto-update read_at timestamp
CREATE OR REPLACE FUNCTION update_read_at()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.status = 'archived' AND (OLD.status IS NULL OR OLD.status != 'archived') THEN
    NEW.read_at = NOW();
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger for read_at
CREATE TRIGGER set_read_at
  BEFORE UPDATE ON articles
  FOR EACH ROW
  EXECUTE FUNCTION update_read_at();
```

Click "Run" (Ctrl/Cmd + Enter)

**3.4 Verify Schema**
1. Go to Table Editor
2. See `articles` table
3. Check columns match schema
4. Success!

**Screenshot locations:**
- `resources/images/readstack/step3-new-project.png`
- `resources/images/readstack/step3-api-keys.png`
- `resources/images/readstack/step3-sql-editor.png`
- `resources/images/readstack/step3-table-created.png`

**Video:**
- `[Loom: Setting up Supabase backend]`

**Pro tips:**
- Save credentials in password manager
- RLS is enabled - your data is automatically secured per user
- One table only - simplest possible data model

---

### Step 4: Execute Implementation with Quality Gates (60 min)

**Objective:** Implement ReadStack systematically with automatic quality gates

**Instructions:**

Now comes the implementation. This is where maintainable vibe coding shines.

**Copy and paste this prompt to Claude Code:**

```
"Use your subagent-driven-development skill to execute the ReadStack implementation plan at docs/plans/YYYY-MM-DD-readstack-implementation.md

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

Execute the plan with automatic quality gates between tasks."
```

**What happens:**

This invokes the **subagent-driven-development skill** which:
- Spawns a subagent for each task in your plan
- Each subagent follows TDD (red → green → refactor)
- Automatically runs code review when each subagent finishes
- Gates progress on Critical issues (must fix before continuing)
- Runs final comprehensive review after all tasks complete

You don't manage this - the skill does it automatically.

**Expected workflow:**

```
Task 1: Authentication
→ Subagent implements Supabase auth
→ Automatic code review
→ Fix Critical issues
→ Mark complete

Task 2: Save URL Feature
→ Subagent implements URL saving + metadata fetch
→ Automatic code review
→ Fix Critical issues
→ Mark complete

Task 3: Article CRUD
→ Subagent implements create/read/update/delete
→ Automatic code review
→ Fix Critical issues
→ Mark complete

[Continue for remaining tasks...]

Final Review:
→ Comprehensive code review of entire app
→ Fix all Critical and Important issues
→ Ready for deployment
```

**You'll get:** A fully implemented ReadStack app with tests, quality-gated at each step.

**Time:** ~60 minutes (12 min per task × 5 tasks)

**Screenshot locations:**
- `resources/images/readstack/step4-execution-start.png`
- `resources/images/readstack/step4-subagent-working.png`
- `resources/images/readstack/step4-code-review-gate.png`
- `resources/images/readstack/step4-task-complete.png`
- `resources/images/readstack/step4-final-review.png`

**Video:**
- `[Loom: Watching subagent-driven development with quality gates]`

**Pro tips:**
- Trust the process - the skill ensures quality automatically
- Critical issues must be fixed - the skill won't let you skip them
- Each task is isolated, so issues are caught early
- Final review ensures everything integrates properly
- This rhythm (build → review → fix → build) prevents spaghetti code

**What's happening behind the scenes:**
- TDD is enforced: if code is written before test fails, it's deleted
- Code review catches security issues, performance problems, bad patterns
- Quality gates prevent you from building on top of flawed components
- This is why implementation is fast AND maintainable

---

### Step 5: Initialize Git and Push to GitHub (10 min)

**Objective:** Version control your work

**Instructions:**

**5.1 Initialize Git**

```bash
git init
git add .
git commit -m "Initial commit: ReadStack MVP

- Architecture designed with brainstorming skill
- Implementation plan created
- v0 generated UI (auth, dashboard, dialogs)
- Supabase backend with articles table
- Full implementation with TDD
- Quality gates passed
- Ready for deployment"
```

**5.2 Create GitHub Repository**

Using GitHub CLI:
```bash
gh repo create readstack --public --source=. --remote=origin --push
```

Or manually:
1. Go to [github.com/new](https://github.com/new)
2. Name: "readstack"
3. Public
4. Don't initialize with README
5. Create repository
6. Follow push instructions

**5.3 Verify**

Visit your GitHub repo - all code is there!

**Screenshot locations:**
- `resources/images/readstack/step5-github-repo.png`

---

### Step 6: Pre-Deployment Review (10 min)

**Objective:** Final quality check before production

**Instructions:**

Before deploying, run a comprehensive review.

**Copy and paste this prompt:**

```
"Use your requesting-code-review skill for pre-deployment review of ReadStack.

REVIEW FOCUS AREAS:
- Security: RLS policies, input validation, auth flows, SQL injection protection
- Performance: Server Components usage, N+1 queries, bundle size, loading states
- UX: Error boundaries, optimistic updates, mobile responsive, loading feedback
- Code quality: DRY violations, complex functions, type safety, naming
- Best practices: Next.js patterns, Supabase client usage, Server Actions

Block deployment on any Critical or Important issues found."
```

**What happens:** This invokes the **requesting-code-review skill** which does a comprehensive review of your entire codebase.

**You'll get:** A detailed review report with any issues categorized as Critical, Important, or Minor.

**Fix Critical and Important issues before deploying.**

**Time:** ~10 minutes

**Screenshot locations:**
- `resources/images/readstack/step6-pre-deployment-review.png`
- `resources/images/readstack/step6-review-report.png`

---

### Step 7: Deploy to Vercel (10 min)

**Objective:** Ship to production!

**Instructions:**

**7.1 Connect Vercel**

1. Go to [vercel.com](https://vercel.com)
2. Click "Import Project"
3. Select your GitHub repo "readstack"
4. Framework Preset: Next.js (auto-detected)
5. Root Directory: `./` (default)

**7.2 Add Environment Variables**

In Vercel project settings:
```
NEXT_PUBLIC_SUPABASE_URL=your_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key
```

**7.3 Deploy**

Click "Deploy"

Wait 2-3 minutes...

**Success!** 🎉

**7.4 Configure Supabase Redirect URLs**

Important: Update Supabase auth settings:

1. Go to Supabase Dashboard → Authentication → URL Configuration
2. Add to Redirect URLs:
   - `https://your-app.vercel.app/auth/callback`
   - `http://localhost:3000/auth/callback`
3. Save

**7.5 Test Production**

1. Visit your-app.vercel.app
2. Sign up with new account
3. Save a URL
4. Test all features
5. Everything works!

**Screenshot locations:**
- `resources/images/readstack/step7-vercel-import.png`
- `resources/images/readstack/step7-env-vars.png`
- `resources/images/readstack/step7-deployed.png`
- `resources/images/readstack/step7-live-app.png`

**Video:**
- `[Loom: Deploying to production]`

**Pro tips:**
- Every git push auto-deploys
- Every PR gets preview deployment
- Add custom domain in Vercel settings
- Enable Web Analytics (built into Vercel)

---

## Conclusion

**What you built in 2.5-3 hours:**
- ✅ Complete architecture designed with brainstorming
- ✅ Detailed implementation plan
- ✅ Professional UI from v0
- ✅ Full-stack app with authentication
- ✅ CRUD operations with quality gates
- ✅ Deployed to production
- ✅ Actually maintainable code

**Time breakdown:**
- Planning (Step 0-1): 50 minutes (63% of time)
- Design (Step 2): 20 minutes
- Infrastructure (Step 3): 20 minutes
- Implementation (Step 4): 60 minutes
- Deployment (Step 5-7): 30 minutes

**The secret:**
> 63% of time spent planning, only 33% implementing. This is the opposite of "cowboy coding" where you spend 10% planning and 90% debugging spaghetti code.

**Lines of code you wrote manually:** ~20 (mostly answering Claude's questions)

**Lines of code total:** ~2,000

**Traditional approach:** 1-2 weeks, all manual, probably spaghetti code

**What you learned:**
- **Planning prevents problems**: Brainstorming skill ensures solid architecture
- **Plans make implementation trivial**: Writing-plans skill creates detailed roadmap
- **Quality gates prevent spaghetti**: Subagent-driven-development catches issues early
- **TDD enforced automatically**: No production code without failing test first
- **v0 handles UI complexity**: Complete Next.js setup with zero manual config
- **Supabase handles backend**: No API routes, just Server Actions

**Why this is maintainable:**
- Every component was reviewed before building the next one
- Tests exist for all features (and failed first, proving they work)
- Architecture was designed upfront, not bolted on later
- Code follows DRY, single responsibility, type safety
- No technical debt - quality gates prevented cutting corners

**Next steps to enhance ReadStack:**
- Add full-text search with Postgres `tsvector`
- Build Chrome extension for one-click saving
- Add article collections/folders
- Implement public reading lists (sharing)
- Add RSS feed import
- Archive article content for offline reading
- Add reading time estimates
- Export to Markdown/PDF

**Ready for the next challenge?**

Now that you've mastered maintainable vibe coding with ReadStack, you're ready to tackle **TeamTask** - which adds:
- Multi-tenancy (teams)
- Permissions and roles
- Real-time collaboration
- More complex data relationships
- Drag-and-drop interfaces

But you'll use the same workflow: brainstorm → plan → execute with quality gates → deploy.

The complexity increases, but the process stays the same.

---

## Key Takeaways

**For Newbies:**

1. **Planning isn't optional** - It's the secret to maintainable code
2. **Skills automate best practices** - You don't have to remember them
3. **Quality gates prevent spaghetti** - Catch issues early when they're cheap
4. **TDD makes tests trustworthy** - Tests that never failed prove nothing
5. **v0 + Supabase eliminate boilerplate** - Focus on features, not plumbing

**The Mindset Shift:**

❌ **"Vibe coding = one-shot magic prompts"**
✅ **"Vibe coding = AI-assisted systematic development"**

❌ **"Ship fast, fix later"**
✅ **"Plan thoroughly, ship correctly"**

❌ **"Tests slow me down"**
✅ **"Tests catch bugs before production"**

❌ **"Quality vs. speed trade-off"**
✅ **"Quality gates enable speed"**

**You now understand maintainable vibe coding.**

---

## Visual Asset Checklist

### Screenshots to Capture
- [ ] Step 0: Brainstorming prompt and questions
- [ ] Step 0: Architecture options
- [ ] Step 0: Design document
- [ ] Step 1: Implementation plan prompt
- [ ] Step 1: Plan document with tasks
- [ ] Step 2: v0 prompts for each component
- [ ] Step 2: v0 generated UI
- [ ] Step 2: Local preview of v0 code
- [ ] Step 3: Supabase new project
- [ ] Step 3: API keys
- [ ] Step 3: SQL editor with schema
- [ ] Step 3: Table created
- [ ] Step 4: Subagent-driven development executing
- [ ] Step 4: Code review gate
- [ ] Step 4: Task completion
- [ ] Step 4: Final review
- [ ] Step 5: GitHub repo created
- [ ] Step 6: Pre-deployment review
- [ ] Step 7: Vercel deployment
- [ ] Step 7: Live app

### Loom Videos to Record
- [ ] Intro: What you'll build (2 min)
- [ ] Step 0: Planning with brainstorming skill (5 min)
- [ ] Step 1: Creating implementation plan (3 min)
- [ ] Step 2: Designing with v0 (5 min)
- [ ] Step 3: Setting up Supabase (3 min)
- [ ] Step 4: Watching subagent-driven development (8 min)
- [ ] Step 5-7: Git and deployment (3 min)
- [ ] Conclusion: The maintainable vibe coding philosophy (3 min)

**Total video content:** ~30 minutes

---

**Ready to build ReadStack?** Start with Step 0 and trust the process! 🚀
