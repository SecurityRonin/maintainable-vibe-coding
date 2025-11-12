# Chapter 11: Planning Architecture

30 minutes designing before any code.

**Why:** Good architecture makes implementation obvious.

**What you'll get:** Complete design document.

## The Brainstorming Skill

Use the `brainstorming` skill from Superpowers.

**It will:**
1. Ask questions about requirements
2. Propose 2-3 approaches
3. Help you choose the simplest one
4. Create design document

## Start Claude Code

In your `readstack` directory:

```bash
claude-code
```

You should see: `>`

## Copy This Exact Prompt

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

Paste and press Enter.

## What Happens

### Phase 1: Understanding (10 min)

Claude asks 8-12 questions:

- "Should users be able to delete archived articles?" → Answer: Yes
- "Do you need full-text search in MVP?" → Answer: No, add later if needed
- "Track when article was last viewed?" → Answer: No, just saved and archived

Answer honestly. Skill uses answers to refine design.

### Phase 2: Exploration (5 min)

Claude proposes 2-3 approaches:

**Option A:** Single-page app with client state
**Option B:** Server Components with server-side filtering (recommended)
**Option C:** Hybrid with client islands (overkill)

Accept recommendation or choose differently.

### Phase 3: Design (15 min)

Claude presents complete design in sections:

- Data Model (tables, columns, indexes)
- Authentication Flow
- User Flows
- API Structure (Server Actions, Server Components)

Review each section. Confirm or ask for changes.

## The Design Document

Claude creates: `docs/plans/YYYY-MM-DD-readstack-design.md`

**Contains:**
- Data model (SQL)
- Architecture decisions
- User flows
- Component structure
- Technical decisions

## Review

```bash
cat docs/plans/YYYY-MM-DD-readstack-design.md
```

Read it. Understand:
- Why one table is enough
- How authentication works
- Where metadata comes from
- What gets saved

If unclear, ask Claude for clarification.

## Commit

```bash
git add docs/
git commit -m "docs: add ReadStack architecture design

- Single table data model (articles)
- Server Components with Server Actions
- Open Graph metadata fetching
- Row Level Security for user data isolation

Designed using brainstorming skill following YAGNI, KISS, SINE, DMMT principles"
```

## What Just Happened

30 minutes planning:
- Answered 8-12 questions
- Reviewed approaches
- Got complete design document
- Didn't write any code

**This prevents 5 hours of refactoring later.**

## Next

Chapter 12 - Creating Implementation Plan (20 min)

Break architecture into 15-25 bite-sized tasks.
