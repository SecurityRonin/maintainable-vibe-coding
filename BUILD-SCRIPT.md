# TeamTask Build Script (Recording Guide)

This script shows exactly what to do while screen recording the tutorial. Follow this step-by-step to build TeamTask while capturing everything.

## Pre-Recording Setup

```bash
# 1. Create recording directory
mkdir -p ~/Desktop/teamtask-recordings

# 2. Create screenshots directory
mkdir -p ~/Desktop/teamtask-screenshots

# 3. Test your screen recorder
# - Record 10 seconds
# - Check video quality
# - Check audio (if using voiceover)
# - Check file size

# 4. Open these in separate windows/tabs:
# - Terminal
# - VS Code or your editor
# - Browser (Chrome recommended for DevTools)
# - Claude Code CLI
# - This BUILD-SCRIPT.md file
```

## Recording Session 1: Project Setup (10 minutes)

**🎥 START RECORDING**

### Terminal Window

```bash
# Show current directory
pwd

# Create examples directory if needed
mkdir -p examples
cd examples

# Start recording timestamp
date

# Create Next.js project
npx create-next-app@latest teamtask --typescript --tailwind --eslint --app --no-src-dir --import-alias "@/*" --turbopack

# Or interactive mode:
npx create-next-app@latest
# Project name: teamtask
# TypeScript: Yes
# ESLint: Yes
# Tailwind CSS: Yes
# src/ directory: No
# App Router: Yes
# Turbopack: Yes
# Import alias: @/*

# Navigate into project
cd teamtask

# Install additional dependencies
npm install @supabase/supabase-js @supabase/auth-helpers-nextjs

# Install shadcn/ui
npx shadcn@latest init
# Default options are fine, press Enter through prompts

# Install specific shadcn components we'll need
npx shadcn@latest add button card input label select textarea dialog dropdown-menu avatar badge

# Start dev server
npm run dev
```

### Browser Window

```
# Open: http://localhost:3000
# Should see Next.js welcome page
```

**📸 SCREENSHOTS:**
1. Terminal showing `npx create-next-app` prompts
2. VS Code showing project structure
3. Browser showing Next.js welcome page
4. Terminal showing `npm run dev` running

**🎥 STOP RECORDING** → Save as `01-project-setup.mp4`

---

## Recording Session 2: Supabase Setup (15 minutes)

**🎥 START RECORDING**

### Browser: Supabase Dashboard

```
1. Go to: https://supabase.com
2. Click "Start your project"
3. Sign in (or sign up)
4. Click "New Project"
5. Fill in:
   - Project name: teamtask
   - Database password: [generate strong password]
   - Region: [choose closest]
6. Click "Create new project"
7. Wait for provisioning (2-3 minutes)
```

**⏸️ PAUSE RECORDING** during provisioning wait

**▶️ RESUME RECORDING**

### SQL Editor

```sql
1. Click "SQL Editor" in left sidebar
2. Click "New query"
3. Paste schema from TUTORIAL-PLAN.md (copy entire schema section)
4. Click "Run" or press Cmd/Ctrl+Enter
5. Should see: "Success. No rows returned"
```

### Verify Tables

```
1. Click "Table Editor" in left sidebar
2. Should see tables:
   - teams
   - team_members
   - tasks
   - task_attachments
   - activity_log
3. Click on each table to verify columns
```

### RLS Policies

```sql
1. Click "SQL Editor"
2. Click "New query"
3. Paste RLS policies from TUTORIAL-PLAN.md
4. Run
5. Verify in Table Editor > [table] > "RLS" tab
```

### Authentication Settings

```
1. Click "Authentication" in left sidebar
2. Click "Providers"
3. Enable "Email" (should be enabled by default)
4. Optionally enable "Google" for OAuth
5. Click "Settings" > "URL Configuration"
6. Add Redirect URLs:
   - http://localhost:3000/auth/callback
   - https://teamtask.vercel.app/auth/callback (or your domain)
```

### Get API Keys

```
1. Click "Project Settings" (gear icon)
2. Click "API"
3. Copy these (WILL BLUR IN POST-PRODUCTION):
   - Project URL
   - anon/public key
```

**📸 SCREENSHOTS:**
1. Supabase new project form (filled out)
2. SQL Editor with schema
3. Table Editor showing all tables
4. One table's column view
5. RLS policies enabled indicator
6. Authentication providers page
7. API settings page (BLUR THE KEYS)

**🎥 STOP RECORDING** → Save as `02-supabase-setup.mp4`

---

## Recording Session 3: Environment Setup (5 minutes)

**🎥 START RECORDING**

### Terminal/VS Code

```bash
# Create .env.local file
touch .env.local

# Open in editor
code .env.local
```

### Edit .env.local

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

### Create .env.example

```bash
# Create template for others
touch .env.example
code .env.example
```

### Edit .env.example

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

### Verify .gitignore

```bash
# Check .env.local is ignored
cat .gitignore | grep .env.local

# Should see: .env*.local
```

**📸 SCREENSHOTS:**
1. .env.local file with keys (BLUR VALUES)
2. .env.example file
3. .gitignore showing .env.local

**🎥 STOP RECORDING** → Save as `03-environment-setup.mp4`

---

## Recording Session 4: Supabase Client Setup (10 minutes)

**🎥 START RECORDING**

### Claude Code CLI

```
# Start Claude Code session
claude-code

# Give it context
"I'm building a Next.js 15 app with Supabase. I need to set up the Supabase client for the app directory with:
1. Client component helper
2. Server component helper
3. Middleware for auth
4. TypeScript types from my schema

My project structure is:
- app/ directory (not src/)
- Using @/ import alias
- Supabase env vars are NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY"
```

### Claude Code will create files

Watch it create:
- `lib/supabase/client.ts`
- `lib/supabase/server.ts`
- `lib/supabase/middleware.ts`
- `lib/supabase/types.ts` (if you shared schema)

### Update middleware.ts in root

Claude Code should update or create `middleware.ts` in project root.

### Test the setup

```bash
# Create a test API route
# Ask Claude Code:
"Create a test API route at app/api/test/route.ts that checks if Supabase connection works"
```

### Test in browser

```
# Go to: http://localhost:3000/api/test
# Should see JSON response indicating successful connection
```

**📸 SCREENSHOTS:**
1. Claude Code prompt
2. Claude Code creating files (show the conversation)
3. VS Code file tree showing new lib/supabase/ directory
4. Each file's content (lib/supabase/client.ts, server.ts, etc.)
5. Browser showing successful test response

**🎥 STOP RECORDING** → Save as `04-supabase-client-setup.mp4`

---

## Recording Session 5: v0 Design Generation (20 minutes)

**🎥 START RECORDING**

### Browser: v0.dev

```
1. Go to: https://v0.dev
2. Sign in with Vercel account
```

### Generate Dashboard

```
# Paste prompt from TUTORIAL-PLAN.md "v0 Prompt 1: Dashboard"
# Wait for generation (30-60 seconds)
# Review the preview
# Click "Copy Code"
```

### VS Code: Create Dashboard

```bash
# Create dashboard page
mkdir -p app/dashboard
touch app/dashboard/page.tsx

# Paste v0 code
# Save file
```

### Browser: Check Dashboard

```
# Go to: http://localhost:3000/dashboard
# Should see dashboard (may be unstyled without auth)
```

### Repeat for each v0 component:

**Login Page:**
```bash
mkdir -p app/login
touch app/login/page.tsx
# Paste v0 code from "v0 Prompt 2: Login Page"
```

**Task Form Modal:**
```bash
mkdir -p components/tasks
touch components/tasks/TaskFormModal.tsx
# Paste v0 code from "v0 Prompt 3: Task Form Modal"
```

**Kanban Board:**
```bash
mkdir -p app/dashboard/kanban
touch app/dashboard/kanban/page.tsx
# Paste v0 code from "v0 Prompt 4: Kanban Board"
```

**Team Settings:**
```bash
mkdir -p app/dashboard/settings
touch app/dashboard/settings/page.tsx
# Paste v0 code from "v0 Prompt 5: Team Settings Page"
```

**Task Detail View:**
```bash
mkdir -p components/tasks
touch components/tasks/TaskDetail.tsx
# Paste v0 code from "v0 Prompt 6: Task Detail View"
```

**📸 SCREENSHOTS:**
1. v0.dev with prompt entered
2. v0 generation preview
3. Copy code button
4. VS Code with pasted code
5. Browser showing each component
6. File tree showing all new files

**🎥 STOP RECORDING** → Save as `05-v0-design-generation.mp4`

---

## Recording Session 6: Authentication Flow (15 minutes)

**🎥 START RECORDING**

### Claude Code CLI

```
"Build authentication for my Next.js + Supabase app:

1. Email/password login at /login
2. Signup at /signup
3. Protected routes (redirect to /login if not authenticated)
4. Dashboard should show user email
5. Logout button
6. Use the v0 UI I already have in app/login/page.tsx

Make sure to use:
- Server Components where possible
- Supabase Auth Helpers for Next.js
- My existing Supabase client from lib/supabase/
- Middleware for protected routes"
```

### Watch Claude Code work

It should:
1. Update app/login/page.tsx with working auth logic
2. Create app/signup/page.tsx
3. Create app/auth/callback/route.ts
4. Update middleware.ts
5. Update app/dashboard/page.tsx to show user info

### Test the flow

```
# Browser:
1. Go to http://localhost:3000/login
2. Try invalid login (should see error)
3. Go to /signup
4. Create test account: test@example.com / TestPassword123!
5. Should redirect to /dashboard
6. Should see your email displayed
7. Try to access /dashboard in incognito (should redirect to /login)
8. Click logout (should redirect to /login)
```

### Verify in Supabase

```
1. Go to Supabase dashboard
2. Click "Authentication" > "Users"
3. Should see test@example.com user
```

**📸 SCREENSHOTS:**
1. Claude Code creating auth files
2. Login page UI
3. Signup page UI
4. Browser DevTools > Network showing auth requests
5. Dashboard showing logged-in user
6. Supabase showing user in database
7. Incognito browser being redirected
8. After logout, back at login page

**🎥 STOP RECORDING** → Save as `06-authentication-flow.mp4`

---

## Recording Session 7: Teams and Tasks CRUD (20 minutes)

**🎥 START RECORDING**

### Claude Code CLI

```
"Build teams and tasks features:

1. After login, show team selector or 'Create Team' if no teams
2. Create team form with name and description
3. User who creates team becomes owner
4. Dashboard should show tasks for selected team
5. 'New Task' button opens task form modal
6. Task form: title, description, status dropdown, priority dropdown, assign to team member, due date
7. Task list shows all tasks with edit/delete buttons
8. Edit opens same modal with data prefilled
9. Delete shows confirmation dialog

Use:
- Supabase client-side queries for real-time
- React Server Components for initial data
- My existing v0 components
- Proper TypeScript types"
```

### Watch Claude Code build:

Should create:
- API routes or Server Actions for teams/tasks CRUD
- Team selector component
- Task list component
- Update TaskFormModal with actual logic
- Delete confirmation dialog

### Test teams:

```
1. Create first team: "Personal Projects"
2. Should see team selector with "Personal Projects"
3. Create second team: "Work Tasks"
4. Switch between teams
5. Dashboard should update
```

### Test tasks:

```
1. Click "New Task"
2. Fill form:
   - Title: "Build authentication"
   - Description: "Implement login and signup"
   - Status: "done"
   - Priority: "high"
   - Assign to: (your user)
   - Due date: (today)
3. Submit
4. Should see task in list
5. Create 2-3 more tasks with different statuses
6. Click edit on a task
7. Change title and status
8. Save
9. Should see updated in list
10. Click delete
11. Confirm
12. Should disappear from list
```

### Verify in Supabase:

```
1. Table Editor > teams
2. Should see your teams
3. Table Editor > tasks
4. Should see your tasks
5. Check team_id foreign keys are correct
```

**📸 SCREENSHOTS:**
1. Team creation form
2. Team selector dropdown
3. Empty task list with "New Task" button
4. Task form modal (blank)
5. Task form modal (filled)
6. Task list with multiple tasks
7. Task edit modal (prefilled)
8. Delete confirmation dialog
9. Supabase Table Editor showing data

**🎥 STOP RECORDING** → Save as `07-teams-tasks-crud.mp4`

---

## Recording Session 8: Real-time Features (15 minutes)

**🎥 START RECORDING**

### Claude Code CLI

```
"Add real-time updates to tasks:

1. When one user creates/updates/deletes a task, other users see changes immediately
2. Use Supabase real-time subscriptions
3. Subscribe to tasks table for current team
4. Update React state when database changes
5. Show subtle animation when task appears/updates
6. Handle edge cases (user deletes task you're viewing)

Focus on the dashboard task list and kanban board."
```

### Watch Claude Code implement subscriptions

Should update:
- Dashboard task list component
- Kanban board component
- Add useEffect with Supabase subscription
- Handle INSERT/UPDATE/DELETE events

### Test real-time (need 2 browsers):

**Setup:**
```
1. Open Chrome: http://localhost:3000/dashboard
2. Open Firefox/Safari/Incognito: http://localhost:3000/dashboard
3. Login to same team in both
4. Position windows side-by-side
```

**Test create:**
```
Browser 1: Create new task "Real-time test"
Browser 2: Should see task appear instantly
```

**Test update:**
```
Browser 2: Edit task, change status to "in progress"
Browser 1: Should see status update instantly
```

**Test delete:**
```
Browser 1: Delete the task
Browser 2: Task should disappear instantly
```

### Check Supabase Realtime:

```
1. Supabase dashboard
2. Database > Replication
3. Should see publication 'supabase_realtime'
4. Click to see subscribed tables (should include 'tasks')
```

**📸 SCREENSHOTS:**
1. Claude Code implementing subscriptions
2. Code showing useEffect with subscription
3. Two browsers side-by-side (BEFORE action)
4. Two browsers side-by-side (AFTER action, both showing update)
5. Browser DevTools > WS (WebSocket) tab showing realtime connection
6. Supabase Replication settings

**🎥 STOP RECORDING** → Save as `08-realtime-features.mp4`

---

## Recording Session 9: Kanban Board (15 minutes)

**🎥 START RECORDING**

### Claude Code CLI

```
"Build interactive Kanban board:

1. Three columns: To Do, In Progress, Done
2. Tasks displayed as cards in appropriate column based on status
3. Drag and drop to move between columns
4. Dropping updates task status in database
5. Real-time: other users see cards move
6. Use @dnd-kit/core for drag and drop
7. Cards show: title, priority badge, assigned user avatar, due date

Path: app/dashboard/kanban/page.tsx (v0 code already there, make it functional)"
```

### Install drag-and-drop library:

```bash
npm install @dnd-kit/core @dnd-kit/sortable @dnd-kit/utilities
```

### Watch Claude Code build:

Should update:
- Kanban page component
- Add drag handlers
- Update task status on drop
- Real-time subscription for kanban

### Test drag and drop:

```
1. Navigate to /dashboard/kanban
2. Should see tasks in columns by status
3. Drag task from "To Do"
4. Drop in "In Progress"
5. Card should move smoothly
6. Refresh page - task should still be in new column (persisted)
```

### Test real-time drag:

```
1. Two browsers again, both on /dashboard/kanban
2. Browser 1: Drag task to different column
3. Browser 2: Should see task move automatically
```

**📸 SCREENSHOTS:**
1. Kanban board with tasks in columns
2. Task being dragged (cursor visible, card has drag styling)
3. Task dropped in new column
4. Two browsers showing synchronized board
5. Browser DevTools showing status update API call

**🎥 STOP RECORDING** → Save as `09-kanban-board.mp4`

---

## Recording Session 10: Testing (20 minutes)

**🎥 START RECORDING**

### Claude Code CLI - Unit Tests

```
"Write unit tests for:
1. Supabase client initialization
2. Auth helper functions
3. Task form validation
4. Date formatting utilities

Use Vitest and React Testing Library."
```

### Install test dependencies:

```bash
npm install -D vitest @testing-library/react @testing-library/jest-dom @vitejs/plugin-react jsdom
```

### Run unit tests:

```bash
npx vitest
```

### Claude Code CLI - E2E Tests

```
"Set up Playwright for E2E testing. Write tests for:

1. User signs up and logs in
2. User creates a team
3. User creates a task
4. User drags task in kanban board
5. Two users see real-time updates

Use my existing test credentials and database."
```

### Install Playwright:

```bash
npm init playwright@latest
```

### Run E2E tests:

```bash
npx playwright test
```

### View test results:

```bash
npx playwright show-report
```

### Intentionally break something to show debugging:

```typescript
// In task creation, comment out status field
// Run tests - should fail
```

### Tell Claude Code:

```
"Task creation test is failing with error:
'Error: Expected status to be in_progress but got null'

Here's the trace file: [attach trace.zip]"
```

### Watch Claude Code debug and fix

**📸 SCREENSHOTS:**
1. Terminal running `npx vitest`
2. Test results (all passing)
3. VS Code showing test file
4. Terminal running `npx playwright test`
5. Playwright test running in headed mode (browser visible)
6. Playwright HTML report
7. Failing test with error
8. Claude Code analyzing trace
9. Claude Code's fix
10. Tests passing after fix

**🎥 STOP RECORDING** → Save as `10-testing.mp4`

---

## Recording Session 11: Deployment (15 minutes)

**🎥 START RECORDING**

### Git setup:

```bash
# Initialize git if not done
git init

# Add all files
git add .

# Initial commit
git commit -m "Initial TeamTask implementation

✨ Features:
- Authentication (email/password)
- Teams and tasks CRUD
- Real-time updates
- Kanban board with drag-drop
- E2E and unit tests

Built using v0, Supabase, Next.js, and Claude Code"

# Create GitHub repo
gh repo create teamtask --public --source=. --remote=origin --push
```

### Browser: Vercel Deployment

```
1. Go to: https://vercel.com
2. Sign in
3. Click "Add New" > "Project"
4. Import from GitHub
5. Select "teamtask" repo
6. Configure:
   - Framework: Next.js
   - Root Directory: ./
   - Build Command: (auto-detected)
   - Output Directory: (auto-detected)
7. Add Environment Variables:
   - NEXT_PUBLIC_SUPABASE_URL
   - NEXT_PUBLIC_SUPABASE_ANON_KEY
8. Click "Deploy"
9. Wait for deployment (~2 minutes)
```

### Update Supabase redirect URLs:

```
1. Supabase dashboard
2. Authentication > URL Configuration
3. Add production URL: https://teamtask.vercel.app/auth/callback
4. Save
```

### Test production:

```
1. Visit: https://teamtask.vercel.app
2. Sign up with new account
3. Create team and tasks
4. Test all features
5. Check Supabase for production data
```

### Setup custom domain (optional):

```
1. Vercel dashboard > teamtask project > Settings > Domains
2. Add custom domain
3. Follow DNS instructions
```

**📸 SCREENSHOTS:**
1. Terminal showing git commands
2. GitHub repo page
3. Vercel import screen
4. Vercel environment variables form
5. Vercel deployment in progress
6. Vercel deployment success
7. Production site running
8. Vercel dashboard showing deployment
9. Supabase showing production usage

**🎥 STOP RECORDING** → Save as `11-deployment.mp4`

---

## Recording Session 12: Post-Deployment (10 minutes)

**🎥 START RECORDING**

### Make a change:

```typescript
// Change dashboard header
// "Welcome back" -> "Welcome to TeamTask"
```

### Commit and push:

```bash
git add .
git commit -m "Update welcome message"
git push
```

### Watch auto-deploy:

```
1. Vercel dashboard should show new deployment starting
2. Wait for deployment
3. Visit production site
4. See updated message
```

### Check analytics:

```
1. Vercel dashboard > teamtask > Analytics
2. Show visitor stats (if any)
3. Supabase dashboard > Reports
4. Show database usage
```

### Add monitoring:

```
# Ask Claude Code:
"Add basic error monitoring with Sentry to catch production errors"
```

### Review what we built:

```
1. Full-stack task management app
2. Authentication
3. Real-time collaboration
4. Drag-and-drop kanban
5. Full test coverage
6. Deployed to production
7. Continuous deployment

Built in ~5 hours vs 2-3 weeks traditionally!
```

**📸 SCREENSHOTS:**
1. Code change in VS Code
2. Git commit
3. Vercel showing new deployment
4. Production site with change
5. Vercel analytics dashboard
6. Supabase reports dashboard
7. Side-by-side: Original plan vs. Completed app

**🎥 STOP RECORDING** → Save as `12-post-deployment.mp4`

---

## Post-Production Checklist

After all recording sessions:

- [ ] Edit videos to remove long pauses
- [ ] Add blur effects to sensitive data
- [ ] Add chapter markers to videos
- [ ] Extract key screenshots
- [ ] Annotate screenshots with arrows/highlights
- [ ] Add captions/subtitles (optional but recommended)
- [ ] Upload to Loom or video host
- [ ] Generate embed codes
- [ ] Write markdown documentation for each step
- [ ] Test tutorial by following your own instructions
- [ ] Get feedback from beta reader
- [ ] Revise based on feedback

## Estimated Total Time

**Recording:** 3-4 hours
**Post-production:** 2-3 hours
**Documentation:** 2-3 hours
**Total:** 7-10 hours

**Result:** Complete visual tutorial that can save readers 20-40 hours!

## Notes for Narrator (if adding voiceover)

**Tone:** Friendly, enthusiastic, conversational

**Key phrases to emphasize:**
- "Notice how Claude Code..."
- "This would traditionally take..."
- "In just X minutes, we've..."
- "No need to learn [complex tool], just describe what you want"
- "Real-time collaboration works out of the box"

**Avoid:**
- Technical jargon without explanation
- Assuming prior knowledge
- Rushing through important concepts
- Dead air during loading/waiting

**Do:**
- Explain *why* not just *what*
- Point out best practices
- Mention common mistakes
- Celebrate wins ("Look at that, it just works!")
