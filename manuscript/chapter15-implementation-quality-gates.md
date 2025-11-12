# Chapter 15: Implementation with Quality Gates

Build the complete app.

**Time:** 60 minutes

**What you'll do:** Execute implementation plan with automatic quality gates.

## Setup Next.js Project

**1. Create Next.js app:**

```bash
cd readstack
npx create-next-app@latest . --typescript --tailwind --app --no-src-dir
```

Answer prompts:
- ESLint? **Yes**
- Turbopack? **No**
- Customize import alias? **No**

**2. Install Supabase:**

```bash
npm install @supabase/supabase-js @supabase/ssr
```

**3. Copy v0 components:**

Go to v0.dev → History → Each design → "Copy Code"

Follow v0's instructions for where to place files.

**4. Test UI:**

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

See v0 components running (no functionality yet).

Press Ctrl+C to stop.

## Execute Implementation Plan

In Claude Code (still open):

**Paste this prompt:**

```
Use your subagent-driven-development skill to execute the ReadStack implementation plan at docs/plans/YYYY-MM-DD-readstack-implementation.md

IMPLEMENTATION STANDARDS:
- Follow TDD strictly: write failing test first → minimal code → refactor
- Apply DRY: extract reusable patterns
- Use DMMT: make wrong things impossible, right things effortless
- Code review after each task
- Block on Critical issues

QUALITY GATES:
- All tests must pass
- No security vulnerabilities
- No performance issues
- Clean code (no duplication)

Execute all tasks systematically.
```

Press Enter.

## What Happens (60 min)

**Task-by-task execution:**

For each task in your plan:
1. Subagent spawns
2. Writes failing test (RED)
3. Writes minimal code (GREEN)
4. Refactors if needed
5. Automatic code review
6. Fixes critical issues
7. Commits code
8. Moves to next task

**You watch this happen.**

Give guidance if asked. Otherwise let it work.

## Progress Updates

Claude shows progress:

```
Task 1/18: Set up Supabase client
→ Writing test... ✓
→ Test fails (good) ✓
→ Writing implementation... ✓
→ Test passes ✓
→ Code review... ✓
→ No critical issues ✓
→ Committed ✓

Task 2/18: Implement email/password authentication
→ Writing test... ✓
...
```

## Quality Gates in Action

**When critical issues found:**

```
Task 5: Save URL with metadata
→ Code review... ⚠️
→ Critical: Missing input validation on URL
→ Fixing... ✓
→ Code review... ✓
→ No critical issues ✓
```

Quality gates catch problems immediately.

## Final Review

After all tasks complete:

```
All 18 tasks completed.

Running final review...
→ 47 tests passing ✓
→ No security vulnerabilities ✓
→ No performance issues ✓
→ Code quality: Good ✓

Ready for deployment.
```

## Test Everything

**1. Run tests:**

```bash
npm test
```

Should show: All 47 tests passing

**2. Run dev server:**

```bash
npm run dev
```

**3. Test manually:**
- Sign up with test email
- Log in
- Save a URL
- See article in dashboard
- Filter by status
- Rate article
- Add notes
- Delete article

Everything should work.

## What You Have

After 60 minutes:
- Complete ReadStack app
- Authentication working
- URL saving with metadata
- Article CRUD operations
- Filtering and tags
- 47 tests passing
- Zero technical debt

Built systematically. Quality guaranteed.

## Next

Chapter 16 - Deployment and Testing (20 min)

Push to GitHub and deploy to Vercel.
