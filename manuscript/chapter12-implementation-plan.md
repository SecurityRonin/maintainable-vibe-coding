# Chapter 12: Creating Implementation Plan

Break architecture into tasks.

**Time:** 20 minutes

**What you'll get:** 15-25 bite-sized tasks, each 2-5 minutes.

## The Writing-Plans Skill

Use the `writing-plans` skill from Superpowers.

**It will:**
- Break architecture into tasks
- Include exact file paths
- Provide complete code
- Specify TDD approach
- Include verification steps

## Copy This Exact Prompt

In Claude Code (still open from Chapter 11):

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

Press Enter.

## What Happens

Claude reads your design document.

Creates task breakdown.

Takes 15-20 minutes automatically.

## The Implementation Plan

Claude creates: `docs/plans/YYYY-MM-DD-readstack-implementation.md`

**Each task has:**
- Files to create/modify
- Test code (write first)
- Implementation code (complete)
- Verification steps
- Git commit message

**Example task:**

### Task 1: Set up Supabase client

**Files:** `lib/supabase/client.ts`

**Test first:**
```typescript
// __tests__/lib/supabase/client.test.ts
it('creates client with environment variables', () => {
  const client = createClient()
  expect(client).toBeDefined()
})
```

**Implementation:**
```typescript
// lib/supabase/client.ts
import { createBrowserClient } from '@supabase/ssr'

export function createClient() {
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  )
}
```

**Verify:** `npm test -- client.test.ts` → Test passes

**Commit:** `git commit -m "feat: add Supabase client setup"`

15-25 tasks like this.

## Review

```bash
cat docs/plans/YYYY-MM-DD-readstack-implementation.md
```

Check each task has:
- Clear objective
- Exact files
- Test code
- Implementation code
- Verification steps

If unclear, ask Claude.

## Commit

```bash
git add docs/
git commit -m "docs: add ReadStack implementation plan

- 18 tasks, each 2-5 minutes
- TDD approach for all features
- Complete code examples included
- Verification steps specified

Created using writing-plans skill"
```

## What Just Happened

20 minutes creating plan:
- 15-25 tasks defined
- Each 2-5 minutes
- All code provided
- TDD enforced
- Verification included

**Still no code written.**

But implementation is now trivial - just follow the plan.

## Why This Works

**Small tasks (2-5 min each):**
Instead of "Implement authentication" (60 min, overwhelming), you get:
1. Set up Supabase client (3 min)
2. Create auth actions (4 min)
3. Wire up signup form (3 min)
4. Wire up login form (3 min)
5. Add logout (2 min)
6. Password reset (5 min)

Same work, achievable pieces, clear wins.

**Complete code included:**
No guessing. Just copy.

**TDD enforced:**
Test first → Implementation → Refactor
Tests actually validate (they failed first).

## Next

Chapter 13 - Designing UI with v0 (20 min)

Generate beautiful components without writing CSS or JSX manually.
