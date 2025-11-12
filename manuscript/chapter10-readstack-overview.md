# Chapter 10: ReadStack Overview and Setup

You're about to build your first app using maintainable vibe coding. This chapter explains what you'll build and why.

**What you'll build:** ReadStack - a personal "read later" URL manager

**Time required:** 2 hours 50 minutes

**What you'll learn:** The complete workflow from planning to deployment

---

## What is ReadStack?

You have 100+ browser tabs open right now. Articles you want to read "later." But later never comes, and finding that article again is impossible.

ReadStack solves this.

**Core features:**
- Save URLs with one paste
- Automatic metadata (title, description, preview image)
- Three states: To Read, Reading, Archived
- Tags for organization
- Rating system (1-5 stars)
- Personal notes on each article

**What it's NOT:**
- No teams (that's TeamTask - Chapter 17)
- No sharing (YAGNI - you aren't gonna need it)
- No comments or discussions
- No AI summarization (yet)

Simple. Focused. Useful.

![Screenshot: ReadStack dashboard preview](#placeholder-readstack-preview)

---

## Why ReadStack?

This is the perfect first project because:

**1. Simple data model**
- One table: `articles`
- No complex relationships
- No teams or permissions
- Easiest possible database

**2. Immediate value**
- You'll actually use this
- Solves a real problem (tab overload)
- See results in 3 hours

**3. Complete workflow**
- Planning before coding
- Quality gates enforced
- TDD throughout
- Deployed to production

**4. Foundation for TeamTask**
- Same tech stack
- Same workflow
- Add complexity later (teams, real-time, etc.)

You'll build ReadStack in this chapter. Then build TeamTask in Chapter 17 using the same process.

---

## Time Breakdown

Here's how the 2h 50min breaks down:

| Chapter | Task | Time |
|---------|------|------|
| 11 | Planning Architecture | 30 min |
| 12 | Creating Implementation Plan | 20 min |
| 13 | Designing UI with v0 | 20 min |
| 14 | Setting Up Supabase | 20 min |
| 15 | Implementation with Quality Gates | 60 min |
| 16 | Deployment and Testing | 20 min |
| **Total** | | **170 min** |

Notice: 50 minutes planning (30%), 120 minutes doing (70%).

Traditional approach: 10 min planning, 10+ hours debugging spaghetti code.

**The secret:** Thorough planning makes implementation straightforward.

---

## Tech Stack

**Frontend:**
- Next.js 14+ (React framework)
- TypeScript (type safety)
- Tailwind CSS (styling)
- shadcn/ui (component library)

**Backend:**
- Supabase (PostgreSQL database)
- Supabase Auth (email/password authentication)
- Row Level Security (automatic data isolation per user)

**Deployment:**
- Vercel (automatic deployments on git push)
- GitHub (version control)

**Tools:**
- v0 (generates UI components)
- Claude Code (AI-assisted development)
- Superpowers (enforces quality gates)

All free tiers except Claude Pro ($20/month).

---

## What You'll Have at the End

**A deployed app at yourapp.vercel.app with:**
- Working authentication (sign up, log in, log out)
- Save URLs automatically fetch metadata
- Filter articles by status (To Read, Reading, Archived)
- Organize with tags
- Rate articles (1-5 stars)
- Add personal notes
- Responsive design (works on mobile)
- Fast (<3 seconds to save a URL)

**Plus:**
- GitHub repository with complete code
- All tests passing (TDD enforced)
- Zero technical debt (quality gates prevented it)
- Architecture documentation
- Ready to enhance with new features

![Screenshot: Completed ReadStack app](#placeholder-readstack-complete)

---

## Prerequisites Check

Before starting, verify you completed Chapter 4:

**Required accounts:**
- [ ] v0.dev
- [ ] Supabase
- [ ] Vercel
- [ ] Claude Pro

**Required tools:**
- [ ] claude-code CLI (`claude-code --version` works)
- [ ] Node.js v18+ (`node --version` works)
- [ ] npm (`npm --version` works)
- [ ] Git (`git --version` works)
- [ ] Superpowers plugin (check with `/plugins list` in Claude Code)

**Optional but recommended:**
- [ ] GitHub CLI (`gh --version` works)

If anything is missing, go back to Chapter 4.

---

## Project Setup

Let's create your workspace.

### Create Project Directory

```bash
mkdir readstack
cd readstack
```

### Initialize Git

```bash
git init
```

You'll see:
```
Initialized empty Git repository in /path/to/readstack/.git/
```

### Start Claude Code

```bash
claude-code
```

First time in this directory, Claude Code opens and shows the prompt: `>`

**Leave it open.** You'll use it in Chapter 11.

---

## ReadStack Database Schema Preview

Before you start, here's what your database will look like. Don't create this yet - you'll do it in Chapter 14.

**One table: `articles`**

```sql
CREATE TABLE articles (
  id              UUID PRIMARY KEY,
  user_id         UUID NOT NULL,           -- Which user owns this
  url             TEXT NOT NULL,            -- The article URL
  title           TEXT,                     -- Auto-fetched
  description     TEXT,                     -- Auto-fetched
  image_url       TEXT,                     -- Auto-fetched preview
  status          TEXT DEFAULT 'to_read',  -- to_read, reading, archived
  rating          INTEGER,                  -- 1-5 stars (nullable)
  notes           TEXT,                     -- User's personal notes
  tags            TEXT[],                   -- Array of tag strings
  saved_at        TIMESTAMP DEFAULT NOW(),
  read_at         TIMESTAMP                 -- When marked as archived
);
```

That's it. **One table.**

No teams. No permissions. No complex joins.

This is YAGNI (You Aren't Gonna Need It) in practice.

---

## The Workflow You'll Follow

**Chapter 11: Planning (30 min)**
- Use brainstorming skill to design architecture
- Answer questions about requirements
- Get complete design document

**Chapter 12: Planning (20 min)**
- Use writing-plans skill to create implementation plan
- Break design into bite-sized tasks (2-5 min each)
- Each task includes complete code and tests

**Chapter 13: Design (20 min)**
- Use v0 to generate UI components
- 4 prompts → 4 beautiful components
- No manual CSS or component building

**Chapter 14: Backend (20 min)**
- Create Supabase project
- Run SQL to create database
- Get API credentials

**Chapter 15: Implementation (60 min)**
- Use subagent-driven-development skill
- Automatic code review after each task
- Quality gates block bad code
- TDD enforced throughout

**Chapter 16: Deployment (20 min)**
- Push to GitHub
- Deploy to Vercel
- Test production app
- Done!

Each chapter stands alone. You can take breaks between them.

---

## What Success Looks Like

**At the end of Chapter 11:**
- Design document at `docs/plans/2025-XX-XX-readstack-design.md`
- Complete architecture defined
- Data model decided (one table)
- User flows mapped

**At the end of Chapter 12:**
- Implementation plan at `docs/plans/2025-XX-XX-readstack-implementation.md`
- 15-25 tasks, each 2-5 minutes
- Complete code examples included

**At the end of Chapter 13:**
- Auth pages (login, signup)
- Dashboard layout
- Save URL dialog
- Article detail page
- All generated by v0

**At the end of Chapter 14:**
- Supabase project running
- `articles` table created
- Row Level Security enabled
- API credentials saved

**At the end of Chapter 15:**
- Full authentication working
- Save URLs with metadata fetch
- Article CRUD operations
- Filtering and tags
- All tests passing

**At the end of Chapter 16:**
- Live at yourapp.vercel.app
- GitHub repository created
- Continuous deployment enabled
- Ready for real use

---

## Common Questions

**Q: Can I skip the planning chapters (11-12)?**

No. That's the whole point. Planning prevents spaghetti code. You'll see why when implementation goes smoothly.

**Q: Do I need to follow the exact times?**

No. Times are estimates. Take breaks. But if planning takes 2 hours, something's wrong - ask for help in the book's Discord.

**Q: Can I add features beyond what's in the tutorial?**

After completing Chapter 16, yes. But finish the tutorial first. YAGNI - don't add features during learning.

**Q: What if I get stuck?**

1. Read the "Common Issues" section in that chapter
2. Check your work against screenshots
3. Ask in the book's Discord (link in frontmatter)
4. Review the tutorial plan document (for authors, but helps debug)

**Q: Can I build something other than ReadStack?**

After finishing ReadStack, yes. Use the same workflow for your own ideas. But complete ReadStack first - it teaches the process.

---

## Ready?

You understand what you're building and why.

You have your tools set up.

You have 3 hours set aside.

**Time to build.**

Turn to Chapter 11 and start planning your architecture.

---

## What You Learned

- ReadStack solves the "too many tabs" problem
- One table database (simplest possible)
- 50 minutes planning, 120 minutes implementing
- Quality gates prevent technical debt
- Same workflow scales to complex apps (TeamTask)
- Planning first = smooth implementation

**Next:** Chapter 11 - Planning Architecture (30 min)
