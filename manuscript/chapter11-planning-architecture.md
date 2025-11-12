# Chapter 11: Planning Architecture

This is the most important chapter. You'll spend 30 minutes designing before writing any code.

**Why this matters:** Good architecture makes implementation obvious. Bad architecture makes everything hard.

**What you'll get:** Complete design document defining your data model, user flows, and technical decisions.

---

## The Brainstorming Skill

You'll use the `brainstorming` skill from Superpowers. It guides you through architecture design using Socratic questioning.

**The skill will:**
1. Ask questions about your requirements
2. Propose 2-3 architectural approaches
3. Help you choose the simplest one
4. Validate your design section-by-section
5. Create a design document

You don't manage this process. The skill does.

---

## Start Claude Code

In your `readstack` directory:

```bash
claude-code
```

You should see the prompt: `>`

---

## Copy and Paste This Exact Prompt

Copy everything between the lines:

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

Paste it into Claude Code and press Enter.

![Screenshot: Brainstorming prompt pasted](#placeholder-brainstorm-prompt)

---

## What Happens Next

### Phase 1: Understanding

Claude asks questions to clarify requirements. Examples:

**Claude might ask:** "Should users be able to delete archived articles?"

**You answer:** "Yes, users should be able to delete any article at any time."

**Claude might ask:** "Do you need full-text search in the MVP?"

**You answer:** "No. We can add that later if users ask for it."

**Claude might ask:** "Should we track when an article was last viewed?"

**You answer:** "Not for MVP. Just track when saved and when archived."

Answer honestly. The skill uses your answers to refine the design.

**How many questions?** Usually 8-12. Takes about 10 minutes.

![Screenshot: Claude asking questions](#placeholder-questions)

### Phase 2: Exploration

After understanding your needs, Claude proposes 2-3 architectural approaches.

**Example approaches:**

**Option A: Single-page app with client-side state**
- Simple to build
- All data fetched on page load
- Works offline after first load
- Not ideal for large article lists

**Option B: Server Components with server-side filtering**
- Better performance
- Server handles filtering/sorting
- SEO friendly
- Recommended for this use case

**Option C: Hybrid with client islands**
- Complex setup
- Overkill for MVP
- Not recommended

Claude explains trade-offs and recommends one (usually Option B for ReadStack).

You can accept the recommendation or choose differently.

**Most students:** Accept the recommendation. Claude knows Next.js patterns.

![Screenshot: Architectural options](#placeholder-architecture-options)

### Phase 3: Design Presentation

Claude presents the complete design in sections:

**Data Model:**
- Tables and columns
- Relationships (if any)
- Indexes for performance

**Authentication Flow:**
- Signup → Email confirmation → Login → Dashboard
- Password reset flow
- Session management

**User Flows:**
- Save URL → Fetch metadata → Confirm/edit → Save to database
- View articles → Filter by status → Click to detail
- Edit article → Update fields → Auto-save

**API Structure:**
- Server Actions for mutations (create, update, delete)
- Server Components for data fetching
- Client Components only where needed (forms, dialogs)

Claude presents each section, then asks: "Does this make sense so far?"

You review and confirm, or ask for changes.

**This takes about 15 minutes.**

![Screenshot: Design presentation](#placeholder-design-presentation)

---

## The Design Document

When you confirm the final design, Claude creates:

`docs/plans/YYYY-MM-DD-readstack-design.md`

**This document contains:**

### Data Model
```sql
CREATE TABLE articles (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id         UUID REFERENCES auth.users(id) NOT NULL,
  url             TEXT NOT NULL,
  title           TEXT,
  description     TEXT,
  image_url       TEXT,
  status          TEXT DEFAULT 'to_read'
                  CHECK (status IN ('to_read', 'reading', 'archived')),
  rating          INTEGER CHECK (rating BETWEEN 1 AND 5),
  notes           TEXT,
  tags            TEXT[] DEFAULT '{}',
  saved_at        TIMESTAMP DEFAULT NOW(),
  read_at         TIMESTAMP
);

CREATE INDEX articles_user_id_idx ON articles(user_id);
CREATE INDEX articles_status_idx ON articles(status);
```

### Architecture Decisions
- Next.js App Router with Server Components
- Supabase for auth and database
- Row Level Security for data isolation
- Server Actions for mutations
- Open Graph for metadata fetching

### User Flows
- Authentication flow diagram
- Save URL flow diagram
- Article management flow diagram

### Component Structure
- Page components (dashboard, article detail)
- Shared components (article card, save dialog)
- Server vs Client Component decisions

### Technical Decisions
- TypeScript for type safety
- Tailwind CSS for styling
- shadcn/ui for components
- Vercel for deployment

**The document is your roadmap.**

![Screenshot: Design document](#placeholder-design-doc)

---

## Review Your Design Document

Claude creates the file. Now read it.

```bash
cat docs/plans/YYYY-MM-DD-readstack-design.md
```

(Replace YYYY-MM-DD with the actual date in the filename)

Read through it. Make sure you understand:
- Why one table is enough
- How authentication works
- Where metadata comes from (Open Graph tags)
- What gets saved to the database

If something is unclear, ask Claude:

```
Can you explain how Open Graph metadata fetching works?
```

Claude will clarify.

---

## Commit Your Design

Good designs are worth saving:

```bash
git add docs/
git commit -m "docs: add ReadStack architecture design

- Single table data model (articles)
- Server Components with Server Actions
- Open Graph metadata fetching
- Row Level Security for user data isolation

Designed using brainstorming skill following YAGNI, KISS, SINE, DMMT principles"
```

![Screenshot: Git commit](#placeholder-git-commit)

---

## What Just Happened?

**You spent 30 minutes planning:**
- Answered 8-12 clarifying questions
- Reviewed 2-3 architectural approaches
- Validated the design section-by-section
- Got a complete design document

**You didn't write any code yet.**

**Traditional approach:** Start coding immediately. Realize halfway through that your database design is wrong. Spend 5 hours refactoring.

**Maintainable vibe coding:** 30 minutes planning prevents 5 hours of refactoring.

**This is the secret.**

---

## Time Check

**Planned:** 30 minutes

**Actual:** Probably 25-35 minutes

If you took longer:
- Normal for first time
- You're learning to answer architecture questions
- Next project will be faster

If you took less:
- Did you read the design document?
- Do you understand all decisions?
- If not, ask Claude for clarification

**Don't rush planning.** Every minute here saves 10 minutes later.

---

## Common Questions

**Q: Can I skip this and just start coding?**

You could. But you'll make decisions ad-hoc, change your mind halfway through, and end up refactoring everything. The 30 minutes you "saved" becomes 5 hours of debugging.

**Q: What if I want to change the design later?**

You can. But changes are expensive after implementation starts. Get the architecture right now. Add features after MVP ships.

**Q: The design seems too simple. Should I add more features?**

No. YAGNI. Simple is good. You can enhance after you deploy. Most "necessary" features turn out to be unnecessary.

**Q: What if I disagree with Claude's recommendation?**

Ask why Claude recommends it. If you still disagree, choose differently. But Claude has built thousands of apps - trust the recommendation unless you have specific reasons not to.

---

## What You Learned

- Brainstorming skill guides architecture design
- 30 minutes planning saves hours of debugging
- Simple data models are powerful (one table!)
- Design documents prevent scope creep
- YAGNI, KISS, SINE, DMMT guide good decisions

**What you have:**
- Complete architecture design
- Data model defined
- User flows mapped
- Technical decisions documented
- Committed to git

**What you don't have yet:**
- Any code
- UI designs
- Database created
- Implementation plan

**Next:** Chapter 12 - Creating Implementation Plan (20 min)

You'll break this architecture into 15-25 bite-sized tasks.
