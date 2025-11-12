# Chapter 12: Creating Implementation Plan

You have architecture. Now break it into tasks.

**Time required:** 20 minutes

**What you'll get:** Implementation plan with 15-25 bite-sized tasks, each taking 2-5 minutes.

---

## The Writing-Plans Skill

You'll use the `writing-plans` skill from Superpowers. It creates detailed implementation plans.

**The skill will:**
- Break your architecture into tasks
- Include exact file paths
- Provide complete code (not "add auth here")
- Specify TDD approach for each task
- Include verification steps

---

## Copy and Paste This Exact Prompt

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

![Screenshot: Writing plans prompt](#placeholder-writing-plans-prompt)

---

## What Happens Next

Claude reads your design document from Chapter 11.

Then creates a task breakdown.

**This takes about 15-20 minutes.**

You don't need to do anything - the skill works automatically.

---

## The Implementation Plan

Claude creates:

`docs/plans/YYYY-MM-DD-readstack-implementation.md`

**Structure:**

### Task 1: Set up Supabase client

**Files:**
- `lib/supabase/client.ts`
- `lib/supabase/server.ts`
- `middleware.ts`

**Test first:**
```typescript
// __tests__/lib/supabase/client.test.ts
import { createClient } from '@/lib/supabase/client'

describe('Supabase Client', () => {
  it('creates client with environment variables', () => {
    const client = createClient()
    expect(client).toBeDefined()
  })
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

**Verify:**
```bash
npm test -- client.test.ts
```

Expected: Test passes

**Commit:**
```bash
git add lib/ __tests__/
git commit -m "feat: add Supabase client setup"
```

### Task 2: Implement email/password authentication

**Files:**
- `app/actions/auth.ts`
- `__tests__/app/actions/auth.test.ts`

**Test first:**
```typescript
describe('Authentication', () => {
  it('signs up user with email and password', async () => {
    const result = await signUp('test@example.com', 'password123')
    expect(result.error).toBeNull()
    expect(result.data.user).toBeDefined()
  })
})
```

**Implementation:**
```typescript
// app/actions/auth.ts
'use server'

import { createClient } from '@/lib/supabase/server'

export async function signUp(email: string, password: string) {
  const supabase = createClient()
  return await supabase.auth.signUp({ email, password })
}
```

**Continue for 15-25 tasks...**

![Screenshot: Implementation plan document](#placeholder-impl-plan)

---

## Review Your Implementation Plan

```bash
cat docs/plans/YYYY-MM-DD-readstack-implementation.md
```

**Check that each task has:**
- Clear objective ("Implement X")
- Exact files to modify
- Test code (what to write first)
- Implementation code (complete, not partial)
- Verification steps (how to confirm it works)
- Git commit message

If anything is unclear, ask Claude:

```
In Task 7, what does "optimistic update" mean?
```

Claude will explain.

---

## Commit Your Plan

```bash
git add docs/
git commit -m "docs: add ReadStack implementation plan

- 18 tasks, each 2-5 minutes
- TDD approach for all features
- Complete code examples included
- Verification steps specified

Created using writing-plans skill"
```

---

## What Just Happened?

**You spent 20 minutes creating a plan:**
- 15-25 tasks defined
- Each task is 2-5 minutes
- All code provided (not abstractions)
- TDD enforced (test first, always)
- Verification steps included

**You still haven't written any code.**

But now implementation is trivial - just follow the plan task by task.

---

## Time Check

**Planned:** 20 minutes

**Actual:** Probably 15-25 minutes

The skill works automatically. Most of the time is Claude generating the detailed plan.

---

## Understanding the Plan Structure

### Why tasks are small (2-5 min each)

Large tasks are overwhelming. Small tasks are achievable.

**Bad task:** "Implement authentication" (60 minutes, complex)

**Good tasks:**
1. Set up Supabase client (3 min)
2. Create auth actions (4 min)
3. Wire up signup form (3 min)
4. Wire up login form (3 min)
5. Add logout functionality (2 min)
6. Implement password reset (5 min)

Same work, but broken into pieces. Each piece has a clear win.

### Why complete code is included

**Bad plan:** "Add validation to the signup form"

You have to figure out what validation, how to implement it, what error messages, etc.

**Good plan:**
```typescript
// Add this to app/(auth)/signup/actions.ts
export async function validateSignup(email: string, password: string) {
  if (!email.includes('@')) {
    return { error: 'Invalid email format' }
  }
  if (password.length < 8) {
    return { error: 'Password must be at least 8 characters' }
  }
  return { error: null }
}
```

No decisions needed. Just copy the code.

### Why TDD is enforced

**Test first approach:**
1. Write test (it fails - RED)
2. Write minimal code (test passes - GREEN)
3. Refactor if needed (test still passes)

This ensures:
- Tests actually validate something (they failed first)
- No untested code
- Bugs caught immediately

**The plan includes tests for every task.**

---

## What You Learned

- Writing-plans skill breaks architecture into tasks
- Each task is 2-5 minutes (small wins)
- Complete code included (no guessing)
- TDD enforced throughout
- 20 minutes planning = clear roadmap

**What you have:**
- Architecture design (Chapter 11)
- Implementation plan (this chapter)
- 15-25 tasks ready to execute
- All committed to git

**What you don't have yet:**
- UI designs (coming in Chapter 13)
- Database created (Chapter 14)
- Any implementation (Chapter 15)

**Next:** Chapter 13 - Designing UI with v0 (20 min)

You'll generate beautiful components without writing CSS or JSX manually.
