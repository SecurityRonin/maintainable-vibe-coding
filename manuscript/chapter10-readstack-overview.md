# Chapter 10: ReadStack Overview and Setup

You're about to build ReadStack using maintainable vibe coding.

**What you'll build:** Personal "read later" URL manager

**Time required:** 2 hours 50 minutes

## What is ReadStack?

You have 100+ browser tabs open. Articles to read "later." Later never comes.

ReadStack solves this.

**Features:**
- Save URLs with automatic metadata
- Three states: To Read, Reading, Archived
- Tags for organization
- Rating system (1-5 stars)
- Personal notes

**Not included (YAGNI):**
- No teams
- No sharing
- No comments
- No AI summarization

Simple. Focused. Useful.

## Time Breakdown

| Chapter | Task | Time |
|---------|------|------|
| 11 | Planning Architecture | 30 min |
| 12 | Implementation Plan | 20 min |
| 13 | UI Design with v0 | 20 min |
| 14 | Supabase Setup | 20 min |
| 15 | Implementation | 60 min |
| 16 | Deployment | 20 min |
| **Total** | | **170 min** |

50 minutes planning, 120 minutes doing.

Traditional approach: 10 min planning, 10+ hours debugging.

## Tech Stack

**Frontend:** Next.js 14, TypeScript, Tailwind CSS, shadcn/ui

**Backend:** Supabase (PostgreSQL + Auth + Row Level Security)

**Deployment:** Vercel + GitHub

**Tools:** v0, Claude Code, Superpowers

All free except Claude Pro ($20/month).

## Prerequisites Check

Before starting:

**Accounts:**
- v0.dev
- Supabase
- Vercel
- Claude Pro

**Tools:**
- `claude-code --version` works
- `node --version` shows v18+
- `npm --version` works
- `git --version` works
- Superpowers plugin installed

If missing, go back to Chapter 4.

## Project Setup

Create your workspace:

```bash
mkdir readstack
cd readstack
git init
claude-code
```

Leave Claude Code open. You'll use it in Chapter 11.

## Database Schema Preview

One table:

```sql
CREATE TABLE articles (
  id              UUID PRIMARY KEY,
  user_id         UUID NOT NULL,
  url             TEXT NOT NULL,
  title           TEXT,
  description     TEXT,
  image_url       TEXT,
  status          TEXT DEFAULT 'to_read',
  rating          INTEGER,
  notes           TEXT,
  tags            TEXT[],
  saved_at        TIMESTAMP DEFAULT NOW(),
  read_at         TIMESTAMP
);
```

That's it. One table. YAGNI principle.

## The Workflow

**Chapter 11:** Use brainstorming skill → design document

**Chapter 12:** Use writing-plans skill → implementation plan

**Chapter 13:** Use v0 → UI components

**Chapter 14:** Create Supabase project → run SQL

**Chapter 15:** Use subagent-driven-development → complete app

**Chapter 16:** Deploy to Vercel → live app

Each chapter stands alone. Take breaks between them.

## Ready?

You understand what you're building.

Tools are set up.

Time to build.

**Next:** Chapter 11 - Planning Architecture (30 min)
