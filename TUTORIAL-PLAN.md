# TeamTask Tutorial: Complete Plan

This document outlines the full tutorial for building TeamTask - a collaborative task management app showcasing the entire vibe coding workflow.

## Tutorial Overview

**What you'll build:** TeamTask - A real-time collaborative task manager

**Time to complete:** 4-5 hours (vs. 2-3 weeks traditional)

**What you'll learn:**
- v0 for rapid UI design
- Supabase for backend (auth, database, real-time)
- GitHub for version control and CI/CD
- Claude Code + Superpowers for development
- Playwright for E2E testing
- Vercel for deployment

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

#### teams
```sql
id: uuid (primary key, default: gen_random_uuid())
name: text (not null)
slug: text (unique, not null)
created_at: timestamp (default: now())
created_by: uuid (foreign key -> auth.users)
```

#### team_members
```sql
id: uuid (primary key, default: gen_random_uuid())
team_id: uuid (foreign key -> teams)
user_id: uuid (foreign key -> auth.users)
role: text (enum: 'owner', 'admin', 'member')
joined_at: timestamp (default: now())

-- Unique constraint on (team_id, user_id)
```

#### tasks
```sql
id: uuid (primary key, default: gen_random_uuid())
team_id: uuid (foreign key -> teams, not null)
title: text (not null)
description: text
status: text (enum: 'todo', 'in_progress', 'done')
priority: text (enum: 'low', 'medium', 'high', 'urgent')
assigned_to: uuid (foreign key -> auth.users)
created_by: uuid (foreign key -> auth.users, not null)
due_date: date
created_at: timestamp (default: now())
updated_at: timestamp (default: now())
```

#### task_attachments
```sql
id: uuid (primary key, default: gen_random_uuid())
task_id: uuid (foreign key -> tasks)
file_name: text (not null)
file_path: text (not null) -- Supabase Storage path
file_size: integer
uploaded_by: uuid (foreign key -> auth.users)
uploaded_at: timestamp (default: now())
```

#### activity_log
```sql
id: uuid (primary key, default: gen_random_uuid())
team_id: uuid (foreign key -> teams)
user_id: uuid (foreign key -> auth.users)
action: text (not null) -- 'created_task', 'updated_task', 'deleted_task', etc.
resource_type: text -- 'task', 'team', etc.
resource_id: uuid
metadata: jsonb -- Extra details about the action
created_at: timestamp (default: now())
```

### Row Level Security (RLS) Policies

#### teams
```sql
-- Users can see teams they're members of
CREATE POLICY "Team members can view team"
  ON teams FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM team_members
      WHERE team_members.team_id = teams.id
        AND team_members.user_id = auth.uid()
    )
  );

-- Users can create teams
CREATE POLICY "Users can create teams"
  ON teams FOR INSERT
  WITH CHECK (auth.uid() = created_by);

-- Only owners can update team
CREATE POLICY "Team owners can update team"
  ON teams FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM team_members
      WHERE team_members.team_id = teams.id
        AND team_members.user_id = auth.uid()
        AND team_members.role = 'owner'
    )
  );
```

#### tasks
```sql
-- Team members can view team tasks
CREATE POLICY "Team members can view tasks"
  ON tasks FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM team_members
      WHERE team_members.team_id = tasks.team_id
        AND team_members.user_id = auth.uid()
    )
  );

-- Team members can create tasks
CREATE POLICY "Team members can create tasks"
  ON tasks FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM team_members
      WHERE team_members.team_id = tasks.team_id
        AND team_members.user_id = auth.uid()
    )
    AND auth.uid() = created_by
  );

-- Team members can update tasks
CREATE POLICY "Team members can update tasks"
  ON tasks FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM team_members
      WHERE team_members.team_id = tasks.team_id
        AND team_members.user_id = auth.uid()
    )
  );

-- Only creator or admins can delete tasks
CREATE POLICY "Creators and admins can delete tasks"
  ON tasks FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM team_members
      WHERE team_members.team_id = tasks.team_id
        AND team_members.user_id = auth.uid()
        AND (
          team_members.role IN ('owner', 'admin')
          OR tasks.created_by = auth.uid()
        )
    )
  );
```

## v0 Prompts

### Prompt 1: Authentication Pages

```
Create a modern authentication system for a task management app called TeamTask.

Requirements:
- Login page with email/password fields
- Sign up page with email, password, and confirm password
- Password reset page
- Use shadcn/ui components
- Include social auth buttons for Google and GitHub
- Modern, clean design with gradients
- Mobile responsive
- Show form validation errors
- Include "Remember me" checkbox on login
- Loading states for form submission

Color scheme: Indigo primary, slate secondary
Style: Modern SaaS aesthetic
```

### Prompt 2: Dashboard Layout

```
Create a task management dashboard with the following layout:

Sidebar (left):
- TeamTask logo at top
- Navigation menu: Dashboard, Tasks, Kanban, Team, Settings
- Team switcher dropdown at bottom
- User avatar with logout at very bottom

Main content area:
- Header with page title and "New Task" button
- Stats cards showing: Total Tasks, In Progress, Completed, Overdue
- Recent activity feed below stats
- "Your Tasks" section with list of assigned tasks

Use shadcn/ui components
Modern design with subtle shadows and borders
Fully responsive (sidebar collapses to hamburger on mobile)
Dark mode support
```

### Prompt 3: Task List View

```
Create a task list view with:

Features:
- Search bar with filters (status, priority, assigned to)
- Sort dropdown (due date, priority, created date)
- Task cards in a grid or list (toggle view)
- Each task card shows: title, description preview, assignee avatar, due date, priority badge, status badge
- Hover state shows more details
- Click card to open task detail modal
- Empty state with illustration when no tasks

Use shadcn/ui components
Modern card design with hover effects
Priority colors: red (urgent), orange (high), yellow (medium), blue (low)
Status badges: todo (gray), in_progress (blue), done (green)
```

### Prompt 4: Kanban Board

```
Create a kanban board view with drag-and-drop:

Layout:
- Three columns: To Do, In Progress, Done
- Each column has header with task count
- Tasks displayed as cards in each column
- Drag and drop between columns
- Add new task button in each column header

Task cards show:
- Title
- Assignee avatar (small)
- Priority indicator (colored left border)
- Due date if set

Use @dnd-kit/core for drag and drop
shadcn/ui for components
Smooth animations on drag
Visual feedback during drag
Mobile: swipe gestures instead of drag
```

### Prompt 5: Task Detail/Edit Modal

```
Create a task detail modal with edit capabilities:

Layout:
- Full-screen modal on mobile, centered on desktop
- Close button (X) in top right
- Title field (editable inline)
- Description (rich text editor or textarea)
- Status dropdown
- Priority dropdown
- Assigned to (searchable user dropdown)
- Due date picker
- Attachments section (file upload + list of files)
- Delete task button (red, bottom left)
- Save button (primary, bottom right)

Features:
- Unsaved changes warning
- File drag-and-drop upload
- File preview for images
- Activity/comment thread below main fields

Use shadcn/ui components
Modern modal design with backdrop blur
Form validation
Loading states for save
```

### Prompt 6: Team Management

```
Create a team settings page:

Sections:
1. Team Info
   - Team name (editable)
   - Team slug
   - Created date

2. Team Members
   - List of members with avatars, names, emails, roles
   - Role dropdown for each (owner, admin, member)
   - Remove member button (for owners/admins only)
   - Invite member button opens modal

3. Invite Modal
   - Email input
   - Role selector
   - Send invite button
   - List of pending invites with cancel option

Use shadcn/ui components
Table for members list
Permission indicators (who can do what)
Confirmation dialogs for destructive actions
```

## Step-by-Step Tutorial Content

### Introduction

**Goal:** Build TeamTask in 4-5 hours using vibe coding workflow

**What makes this fast:**
- v0 generates 80% of UI code
- Supabase handles 100% of backend
- Claude Code writes tests and business logic
- GitHub Actions handles deployment
- You focus on product decisions, not boilerplate

**Prerequisites:**
- Accounts: v0, Supabase, GitHub, Vercel, Claude Pro
- Tools: Node.js 18+, Git, Claude Code CLI
- Time: 4-5 hours (can pause and resume)

### Step 1: Design Authentication with v0 (15 min)

**Objective:** Create login and signup pages

**Instructions:**

1. Go to v0.dev
2. Click "New Design"
3. Paste [Auth Prompt from above]
4. Click "Generate"
5. Review generated code
6. Click "Export" → "Copy Code"
7. Save to local project

**Expected result:**
- Login page at `/app/(auth)/login/page.tsx`
- Signup page at `/app/(auth)/signup/page.tsx`
- Reusable auth components

**Screenshot locations:**
- `resources/images/step1-v0-new-design.png`
- `resources/images/step1-v0-auth-result.png`
- `resources/images/step1-export-code.png`

**Video:**
- `[Loom: Designing auth pages with v0]`

**Pro tips:**
- If design isn't perfect, click "Refine" and describe changes
- v0 shows mobile and desktop views - review both
- Export gives you complete, working Next.js code

### Step 2: Set Up Supabase Project (20 min)

**Objective:** Create backend with auth and database

**Instructions:**

**2.1 Create Project**
1. Go to supabase.com
2. Click "New Project"
3. Name: "teamtask"
4. Database password: (generate strong password, save it)
5. Region: Choose closest to you
6. Click "Create"
7. Wait 2-3 minutes for provisioning

**2.2 Enable Authentication**
1. Go to Authentication → Providers
2. Enable "Email"
3. Enable "Google" (add OAuth credentials)
4. Enable "GitHub" (add OAuth credentials)
5. Save

**2.3 Create Database Schema**

Ask Claude Code:
```
"Create the Supabase schema for TeamTask with these tables:
- teams (id, name, slug, created_by, created_at)
- team_members (id, team_id, user_id, role, joined_at)
- tasks (id, team_id, title, description, status, priority, assigned_to, created_by, due_date, created_at, updated_at)

Include Row Level Security policies so users can only see data for teams they're members of."
```

Claude Code will generate SQL. Copy it.

**2.4 Run Migrations**
1. In Supabase dashboard, go to SQL Editor
2. Click "New Query"
3. Paste Claude's SQL
4. Click "Run"
5. Verify tables in Table Editor

**Screenshot locations:**
- `resources/images/step2-supabase-new-project.png`
- `resources/images/step2-auth-providers.png`
- `resources/images/step2-sql-editor.png`
- `resources/images/step2-table-editor.png`

**Video:**
- `[Loom: Setting up Supabase from scratch]`

**Pro tips:**
- Save your project URL and anon key (you'll need them)
- Test RLS policies in the SQL editor before proceeding
- Enable realtime for `tasks` table (toggle in table settings)

### Step 3: Initialize GitHub Repository (10 min)

**Objective:** Version control from day one

**Instructions:**

**3.1 Create Local Git Repo**
```bash
cd teamtask
git init
git add .
git commit -m "Initial commit: v0 export and Supabase schema

- Auth pages generated by v0
- Supabase project created
- Database schema with RLS policies
- Ready for development"
```

**3.2 Create GitHub Repo**
```bash
gh repo create teamtask --public --source=. --remote=origin
git push -u origin main
```

Or manually:
1. Go to github.com/new
2. Name: "teamtask"
3. Public
4. Don't initialize with README
5. Create
6. Follow push instructions

**3.3 Set Up GitHub Actions (via Claude Code)**

Ask Claude Code:
```
"Set up GitHub Actions to:
1. Run tests on every PR
2. Deploy to Vercel on merge to main
3. Run Playwright E2E tests

Include Node.js cache for faster builds."
```

Claude creates `.github/workflows/ci.yml`

Commit:
```bash
git add .github/
git commit -m "Add GitHub Actions CI/CD"
git push
```

**Screenshot locations:**
- `resources/images/step3-github-new-repo.png`
- `resources/images/step3-actions-tab.png`

**Pro tips:**
- Use conventional commits for better history
- Set up branch protection on main (require PR reviews)
- GitHub Actions runs automatically on push

### Step 4: Connect Frontend to Supabase (45 min)

**Objective:** Wire up auth and task CRUD

**Instructions:**

**4.1 Install Supabase Client**
```bash
npm install @supabase/supabase-js @supabase/auth-helpers-nextjs
```

**4.2 Add Environment Variables**

Create `.env.local`:
```bash
NEXT_PUBLIC_SUPABASE_URL=your_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key
```

Add to `.gitignore`:
```
.env.local
```

Commit:
```bash
git add .env.example .gitignore
git commit -m "Add Supabase environment variables"
```

**4.3 Create Supabase Client**

Ask Claude Code:
```
"Create a Supabase client for Next.js app directory with:
1. Client component helper
2. Server component helper
3. Middleware for auth
4. TypeScript types from my schema"
```

Claude creates:
- `lib/supabase/client.ts`
- `lib/supabase/server.ts`
- `lib/supabase/middleware.ts`
- `lib/supabase/types.ts`

**4.4 Implement Auth Flow**

Ask Claude Code:
```
"Implement the authentication flow:
1. Sign up with email/password
2. Sign in with email/password
3. Sign out
4. OAuth with Google/GitHub
5. Redirect to /dashboard after login
6. Protect /dashboard routes (redirect to /login if not auth)"
```

Claude updates:
- Auth pages with working forms
- Server actions for auth
- Middleware protection
- Success/error handling

**4.5 Test Auth**
```bash
npm run dev
```

1. Go to http://localhost:3000/signup
2. Create account
3. Should redirect to /dashboard
4. Logout
5. Login again
6. Success!

**Screenshot locations:**
- `resources/images/step4-env-variables.png`
- `resources/images/step4-signup-form.png`
- `resources/images/step4-dashboard-protected.png`

**Video:**
- `[Loom: Connecting Supabase auth to Next.js]`

**Pro tips:**
- Test both email and OAuth flows
- Check Supabase dashboard to see user created
- Use error.tsx files for better error handling

### Step 5: Design Dashboard with v0 (15 min)

**Objective:** Create main dashboard UI

**Instructions:**

1. Go to v0.dev
2. New design
3. Paste [Dashboard Prompt from above]
4. Generate
5. Review
6. Export code
7. Copy to `app/(dashboard)/dashboard/page.tsx`

**Integrate with real data:**

Ask Claude Code:
```
"Update the dashboard to show real data from Supabase:
1. Fetch user's tasks
2. Calculate stats (total, in_progress, done, overdue)
3. Show recent activity
4. Handle loading and error states"
```

**Test:**
```bash
npm run dev
```

Dashboard shows your stats!

**Screenshot locations:**
- `resources/images/step5-v0-dashboard.png`
- `resources/images/step5-dashboard-live-data.png`

### Step 6: Implement Task CRUD (30 min)

**Objective:** Create, read, update, delete tasks

**Instructions:**

Ask Claude Code:
```
"Implement full CRUD for tasks using Supabase:

1. Create task form with validation
2. List tasks with filters
3. Edit task (update any field)
4. Delete task with confirmation
5. All operations respect RLS policies

Use React Server Components for data fetching and Server Actions for mutations."
```

Claude creates:
- `app/(dashboard)/tasks/page.tsx` - Task list
- `app/(dashboard)/tasks/new/page.tsx` - Create form
- `app/(dashboard)/tasks/[id]/page.tsx` - Task detail
- `app/actions/tasks.ts` - Server actions
- `components/task-card.tsx` - Reusable card
- `components/task-form.tsx` - Reusable form

**Test each operation:**
1. Create task
2. View task list
3. Edit task
4. Delete task

All working!

Commit:
```bash
git add .
git commit -m "Implement task CRUD with Supabase

- Create, read, update, delete tasks
- Server actions for mutations
- RLS policies enforced
- Form validation
- Error handling"
git push
```

**Screenshot locations:**
- `resources/images/step6-create-task-form.png`
- `resources/images/step6-task-list.png`
- `resources/images/step6-task-detail.png`

**Video:**
- `[Loom: Building CRUD operations with Claude Code]`

### Step 7: Add Real-Time Updates (30 min)

**Objective:** See changes from other users instantly

**Instructions:**

Ask Claude Code:
```
"Add real-time subscriptions so when one user creates/updates/deletes a task, other users see the change instantly.

Use Supabase real-time subscriptions on the tasks table.
Handle connection status (show indicator when connected).
Use optimistic updates for better UX."
```

Claude updates:
- `hooks/useTaskSubscription.ts` - Real-time hook
- Task list component - Uses subscription
- Connection indicator component
- Optimistic updates on mutations

**Test real-time:**
1. Open localhost:3000 in two browser windows
2. Login to both (different users or same)
3. Create task in window 1
4. See it appear in window 2 instantly!

**Screenshot locations:**
- `resources/images/step7-two-windows.png`
- `resources/images/step7-realtime-indicator.png`

**Video:**
- `[Loom: Real-time collaboration with Supabase]`

**Pro tips:**
- Real-time subscriptions use WebSockets
- Check Supabase dashboard for active connections
- Handle reconnection on network issues

### Step 8: Build Kanban Board (30 min)

**Objective:** Drag-and-drop kanban board

**Instructions:**

**8.1 Design with v0**
1. Go to v0.dev
2. Paste [Kanban Prompt from above]
3. Generate
4. Export to `app/(dashboard)/kanban/page.tsx`

**8.2 Wire Up Drag-and-Drop**

Ask Claude Code:
```
"Make the kanban board functional:

1. Install @dnd-kit/core for drag and drop
2. Load tasks grouped by status
3. When task is dragged to new column, update status in Supabase
4. Use optimistic updates for smooth UX
5. Real-time updates from other users
6. Mobile: use buttons instead of drag-drop"
```

Claude implements full drag-and-drop with database persistence!

**Test:**
1. Create tasks in different columns
2. Drag task from To Do to In Progress
3. See database updated
4. Open in second window, see it moved
5. Mobile view: use status buttons

**Screenshot locations:**
- `resources/images/step8-kanban-board.png`
- `resources/images/step8-dragging-task.png`

**Video:**
- `[Loom: Building drag-and-drop kanban board]`

### Step 9: Write E2E Tests with Playwright (30 min)

**Objective:** Automated tests for critical flows

**Instructions:**

Ask Claude Code:
```
"Set up Playwright and write E2E tests for:

1. User signup
2. User login
3. Create task
4. Edit task
5. Drag task in kanban
6. Real-time update (two users)
7. Logout

Use Page Object pattern and fixtures for auth."
```

Claude:
1. Runs `npm init playwright@latest`
2. Creates test fixtures
3. Writes all 7 tests
4. Sets up GitHub Actions for CI

**Run tests:**
```bash
npx playwright test
```

All passing!

**Screenshot locations:**
- `resources/images/step9-playwright-tests.png`
- `resources/images/step9-test-results.png`

**Video:**
- `[Loom: Claude Code writing E2E tests]`

**Pro tips:**
- Tests run in CI on every PR
- Use `--ui` mode for debugging
- Ask Claude to fix flaky tests

### Step 10: Deploy to Vercel (15 min)

**Objective:** Ship to production!

**Instructions:**

**10.1 Connect to Vercel**
1. Go to vercel.com
2. Click "Import Project"
3. Select your GitHub repo
4. Configure:
   - Framework: Next.js (auto-detected)
   - Build command: (default)
   - Environment variables: Add Supabase URL and key
5. Click "Deploy"

**10.2 Wait for Deploy**
- Takes 2-3 minutes
- Watch build logs
- Success! 🎉

**10.3 Test Production**
1. Visit your-app.vercel.app
2. Sign up
3. Create tasks
4. Everything works!

**Screenshot locations:**
- `resources/images/step10-vercel-import.png`
- `resources/images/step10-env-vars.png`
- `resources/images/step10-deploy-success.png`
- `resources/images/step10-live-app.png`

**Video:**
- `[Loom: Deploying to Vercel in 2 minutes]`

**Pro tips:**
- Every PR gets a preview deployment
- Set up custom domain in Vercel settings
- Add Vercel to GitHub Actions for automatic deploys

### Step 11: Add Team Features (45 min)

**Objective:** Multi-team support

**Instructions:**

Ask Claude Code:
```
"Add team functionality:

1. Create team form
2. Team switcher in sidebar
3. Invite members via email
4. Accept/decline invitations
5. Role management (owner, admin, member)
6. RLS ensures users only see their team's data

Update all queries to filter by current team."
```

Claude updates entire app for multi-tenancy!

**Test:**
1. Create team
2. Invite member (use second email)
3. Accept invite
4. See team's tasks
5. Switch teams
6. See different tasks

**Screenshot locations:**
- `resources/images/step11-create-team.png`
- `resources/images/step11-team-switcher.png`
- `resources/images/step11-invite-member.png`

**Video:**
- `[Loom: Adding multi-team support]`

### Conclusion

**What you built:**
- ✅ Full-stack app with auth
- ✅ Real-time collaboration
- ✅ Drag-and-drop interface
- ✅ Multi-team support
- ✅ E2E tests
- ✅ Deployed to production

**Time:** 4-5 hours

**Lines of code you wrote manually:** ~50

**Lines of code total:** ~5,000

**Traditional approach:** 2-3 weeks, all manual

**Next steps:**
- Add notifications
- Add file attachments
- Add task comments
- Add analytics dashboard
- Invite real users!

## Visual Asset Checklist

For each step, we need:

### Screenshots to Capture
- [ ] v0 new design button
- [ ] v0 prompt interface
- [ ] v0 generated results
- [ ] v0 export button
- [ ] Supabase new project
- [ ] Supabase auth providers
- [ ] Supabase SQL editor
- [ ] Supabase table editor
- [ ] GitHub new repo
- [ ] GitHub Actions tab
- [ ] Environment variables setup
- [ ] Sign up form working
- [ ] Dashboard with real data
- [ ] Task list view
- [ ] Task creation form
- [ ] Kanban board
- [ ] Dragging task
- [ ] Playwright test results
- [ ] Vercel deployment
- [ ] Live app screenshot

### Loom Videos to Record
- [ ] Intro: What you'll build (2 min)
- [ ] Designing with v0 (3 min)
- [ ] Setting up Supabase (5 min)
- [ ] Connecting auth (5 min)
- [ ] Building CRUD with Claude Code (5 min)
- [ ] Real-time subscriptions (3 min)
- [ ] Kanban drag-and-drop (3 min)
- [ ] E2E testing with Claude (4 min)
- [ ] Deploying to Vercel (2 min)
- [ ] Adding teams (5 min)
- [ ] Conclusion: What's next (2 min)

**Total video content:** ~40 minutes

### Annotations Needed
- Arrow pointing to buttons
- Circles highlighting important fields
- Numbers for step sequences
- Highlight boxes for code sections
- Before/after comparisons

## How to Record

**When building the actual tutorial app:**

1. **Screen recording software:** Loom or CleanShot X
2. **Record entire build process** in one session
3. **Extract screenshots** from video frames
4. **Annotate** in Figma or Markup
5. **Trim videos** into ~3-5 min segments
6. **Upload videos** to Loom
7. **Save images** to `resources/images/tutorial/`
8. **Reference** in tutorial markdown

**Alternative:** Build first, then record walkthrough while explaining.

---

**Ready to start building?** Follow Step 1 and let's go! 🚀
