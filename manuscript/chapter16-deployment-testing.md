# Chapter 16: Deployment and Testing

Time to ship.

**Time required:** 20 minutes

**What you'll do:** Push to GitHub, deploy to Vercel, test production.

---

## Commit Your Work

First, save everything to git.

```bash
git add .
git commit -m "feat: implement ReadStack MVP

- Authentication with Supabase (email/password)
- Save URLs with Open Graph metadata fetching
- Article CRUD operations
- Filter by status and tags
- Article detail with inline editing
- All tests passing (47 tests)
- TDD enforced throughout
- Quality gates passed

Built using subagent-driven-development skill with automatic code review"
```

![Screenshot: Git commit](#placeholder-git-commit)

---

## Push to GitHub

### Option A: Using GitHub CLI (Recommended)

```bash
gh repo create readstack --public --source=. --remote=origin --push
```

Done. Your repo is live.

### Option B: Manual (If No GitHub CLI)

1. Go to [github.com/new](https://github.com/new)
2. Repository name: `readstack`
3. Public
4. Don't initialize with README
5. Click "Create repository"
6. Follow the push instructions shown:

```bash
git remote add origin https://github.com/yourusername/readstack.git
git branch -M main
git push -u origin main
```

![Screenshot: GitHub repo created](#placeholder-github-repo)

---

## Deploy to Vercel

Go to [vercel.com](https://vercel.com)

Click "Add New..." → "Project"

![Screenshot: Vercel add new](#placeholder-vercel-add-new)

### Import Repository

1. Find your `readstack` repository
2. Click "Import"

![Screenshot: Import repository](#placeholder-vercel-import)

### Configure Project

**Framework Preset:** Next.js (auto-detected)

**Root Directory:** `./` (leave default)

**Build Command:** (leave default)

**Install Command:** (leave default)

![Screenshot: Vercel config](#placeholder-vercel-config)

### Add Environment Variables

Click "Environment Variables"

Add two variables:

**Name:** `NEXT_PUBLIC_SUPABASE_URL`
**Value:** (paste from your `.env.local`)

**Name:** `NEXT_PUBLIC_SUPABASE_ANON_KEY`
**Value:** (paste from your `.env.local`)

![Screenshot: Environment variables](#placeholder-vercel-env)

### Deploy

Click "Deploy"

Wait 2-3 minutes.

You'll see:
```
Building...
✓ Building application
✓ Generating static pages
✓ Finalizing
✓ Deployment ready
```

**Success!** 🎉

![Screenshot: Deployment success](#placeholder-vercel-success)

---

## Get Your URL

Vercel shows your deployment URL:

`https://readstack-xyz123.vercel.app`

Click "Visit" to open it.

![Screenshot: Vercel URL](#placeholder-vercel-url)

---

## Configure Supabase Redirect URLs

**Important:** Update Supabase for OAuth to work correctly.

Go to Supabase Dashboard → Authentication → URL Configuration

Add these redirect URLs:
```
https://readstack-xyz123.vercel.app/auth/callback
http://localhost:3000/auth/callback
```

Replace `readstack-xyz123.vercel.app` with your actual Vercel URL.

Click "Save"

![Screenshot: Supabase redirect URLs](#placeholder-supabase-redirects)

---

## Test Production

Visit your Vercel URL.

### Test 1: Sign Up

1. Click "Sign up"
2. Enter email and password
3. Click "Create account"
4. Should redirect to dashboard
5. Success!

![Screenshot: Production signup](#placeholder-prod-signup)

### Test 2: Save URL

1. Click "Save URL" button
2. Paste: `https://github.com/vercel/next.js`
3. Wait for metadata to load
4. Title and description auto-fill
5. Add tag: "nextjs"
6. Click "Save"
7. Article appears in "To Read"

![Screenshot: Production save URL](#placeholder-prod-save-url)

### Test 3: Article Management

1. Click the article you just saved
2. Edit the title
3. Change status to "Reading"
4. Add rating: 5 stars
5. Add notes: "Documentation for Next.js"
6. Everything saves automatically
7. Click back
8. See changes persisted

![Screenshot: Production article detail](#placeholder-prod-article)

### Test 4: Filtering

1. Save a few more URLs
2. Move some to "Reading"
3. Archive one or two
4. Click "To Read" tab → see only unread
5. Click "Reading" tab → see in-progress
6. Click "Archive" tab → see completed

### Test 5: Mobile

1. Open on your phone (or use DevTools responsive mode)
2. Everything should work
3. Dialog becomes full-screen
4. Cards stack vertically
5. Navigation is touch-friendly

![Screenshot: Mobile view](#placeholder-prod-mobile)

### Test 6: Log Out and Back In

1. Click user menu → "Log out"
2. You're logged out
3. Click "Log in"
4. Enter credentials
5. See all your articles still there

**Everything works!**

---

## Verify Automatic Deployments

Make a small change:

```bash
# Edit app/(dashboard)/dashboard/page.tsx
# Change "Save URL" button text to "Add Article"
```

Commit and push:
```bash
git add .
git commit -m "feat: update button text"
git push
```

Go to Vercel dashboard. You'll see:
```
Building... (new deployment triggered)
✓ Deployment ready
```

Refresh your production URL. Button text updated.

**Continuous deployment is working.**

![Screenshot: Auto deployment](#placeholder-auto-deploy)

---

## Add Custom Domain (Optional)

If you have a domain:

1. Go to Vercel → Your Project → Settings → Domains
2. Add your domain: `readstack.yourdomain.com`
3. Follow DNS instructions
4. Wait 5-10 minutes for propagation
5. Your app is now at your custom domain

![Screenshot: Custom domain](#placeholder-custom-domain)

---

## Performance Check

Open DevTools → Network tab

Reload page.

**Check metrics:**
- Time to First Byte (TTFB): < 200ms
- First Contentful Paint (FCP): < 1.5s
- Time to Interactive (TTI): < 3s

If slower, check:
- Vercel region (should be close to you)
- Image sizes (optimize if needed)
- Bundle size (run `npm run build` to see)

![Screenshot: Performance metrics](#placeholder-performance)

---

## SEO Check

View page source (right-click → View Page Source)

**Check for:**
- `<title>` tag
- `<meta name="description">`
- `<meta property="og:title">`
- Semantic HTML (`<main>`, `<header>`, etc.)

v0 includes these. Server Components ensure they're rendered.

---

## What You Just Deployed

**A production app with:**
- Authentication (Supabase)
- Database (PostgreSQL with RLS)
- CRUD operations
- Metadata fetching
- Responsive design
- Fast (< 3s to save URL)
- Secure (RLS, input validation)
- Tested (47 passing tests)
- Clean code (quality gates enforced)

**Hosted on:**
- Vercel (CDN, automatic scaling)
- Supabase (managed database)
- GitHub (version control)

**Cost:**
- $0 (free tiers)
- Except Claude Pro: $20/month

---

## What's Next

### Use It

You built ReadStack to solve your "too many tabs" problem.

Use it. Save articles. Organize them. See if it actually helps.

**Get feedback:**
- Does the workflow make sense?
- Is anything missing?
- What would make it better?

Build features based on actual use, not speculation.

### Enhance It

Ideas for v2:
- Full-text search
- Collections/folders
- Chrome extension
- RSS feed import
- Public reading lists
- Export to Markdown

Use the same workflow:
1. Brainstorm the feature
2. Write implementation plan
3. Execute with quality gates
4. Deploy

### Share It

- Tweet your Vercel URL
- Show friends
- Post in communities
- Get users
- Learn from usage

### Build Something Else

Now that you know the workflow, build your own ideas:

- Workout tracker
- Recipe manager
- Book notes app
- Freelance invoice tracker
- Habit tracker
- Anything with CRUD operations

Same process. Different domain.

---

## Time Spent (Total)

**Chapter 11:** Planning (30 min)
**Chapter 12:** Implementation Plan (20 min)
**Chapter 13:** v0 Design (20 min)
**Chapter 14:** Supabase Setup (20 min)
**Chapter 15:** Implementation (60 min)
**Chapter 16:** Deployment (20 min)

**Total:** 170 minutes (2h 50min)

**Lines you wrote manually:** ~30 (prompts and answers to Claude)

**Lines generated:** ~2,000 (components, business logic, tests)

**Traditional approach:** 2-3 weeks

---

## What You Learned

### The Workflow

1. **Plan thoroughly** (50 min) before coding
2. **Design with v0** (20 min) generates UI
3. **Supabase backend** (20 min) handles database
4. **Execute with quality gates** (60 min) builds features
5. **Deploy automatically** (20 min) ships to production

### The Principles

- **YAGNI:** Only MVP features (no teams, no sharing)
- **KISS:** Simplest solution (one table)
- **SINE:** Simple is hard work (30 min planning)
- **DMMT:** Quality gates prevent mistakes automatically

### The Tools

- **v0:** Generates production-ready components
- **Supabase:** Managed backend (database + auth)
- **Claude Code:** AI-assisted development
- **Superpowers:** Enforces quality gates
- **Vercel:** Automatic deployments

### The Results

- Working app in < 3 hours
- Zero technical debt
- All tests passing
- Production-ready code
- Immediately useful

---

## You Did It

You built ReadStack from scratch.

You followed maintainable vibe coding workflow.

You shipped to production.

**You understand the process now.**

---

## Ready for More?

**Part 4: TeamTask Tutorial (Chapters 17-27)**

Now that you've mastered the basics with ReadStack, you're ready for TeamTask.

TeamTask adds:
- **Multi-tenancy:** Teams with members
- **Permissions:** Role-based access (owner, admin, member)
- **Real-time:** Live collaboration with WebSockets
- **Complex data:** Multiple related tables
- **Drag-and-drop:** Kanban board with @dnd-kit
- **E2E testing:** Playwright for full workflow tests

**Same workflow. More complexity.**

But you'll use brainstorming → planning → quality-gated implementation → deployment.

**The process scales.**

---

## Final Thoughts

Traditional coding: Write code, debug for days, ship with bugs.

Maintainable vibe coding: Plan thoroughly, let AI implement with quality gates, ship with confidence.

**You just proved it works.**

Now go build something amazing.

---

## What You Have

- ✅ Working ReadStack app
- ✅ Deployed to production
- ✅ GitHub repository
- ✅ Continuous deployment
- ✅ Clean, tested code
- ✅ Architecture documentation
- ✅ Implementation plan
- ✅ Zero technical debt

**What you gained:**

- Understanding of maintainable vibe coding
- Confidence that quality gates work
- Proof that planning prevents problems
- Experience with v0, Supabase, Claude Code
- A useful app you'll actually use
- Foundation for building more complex apps

**Next:** Chapter 17 - TeamTask Overview

Ready to level up? Turn the page.
