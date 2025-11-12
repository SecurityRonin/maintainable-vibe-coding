# Chapter 15: Implementation with Quality Gates

This is where everything comes together.

**Time required:** 60 minutes

**What you'll do:** Execute your implementation plan with automatic quality gates.

---

## The Subagent-Driven Development Skill

This skill executes your plan systematically:
1. Spawns a subagent for each task
2. Each subagent follows TDD (test first)
3. Automatic code review after each task
4. Critical issues block next task
5. Final review when all tasks complete

**You don't manage this process. The skill does.**

---

## First: Integrate v0 Components

Before running the plan, integrate your v0 exports.

### Create Next.js Project

In your `readstack` directory:

```bash
npx create-next-app@latest . --typescript --tailwind --app --no-src-dir
```

Answer prompts:
- Would you like to use ESLint? **Yes**
- Would you like to use Turbopack? **No**
- Would you like to customize default import alias? **No**

This creates the Next.js structure.

### Install Supabase Dependencies

```bash
npm install @supabase/supabase-js @supabase/ssr
```

### Copy v0 Components

Go back to v0.dev → History

For each of your four designs:
1. Click the design
2. Click "Copy Code"
3. v0 tells you where to put files

**Example structure:**
```
app/
  (auth)/
    login/page.tsx          ← v0 auth component
    signup/page.tsx          ← v0 auth component
  (dashboard)/
    dashboard/page.tsx       ← v0 dashboard component
    articles/[id]/page.tsx   ← v0 detail component
components/
  save-url-dialog.tsx        ← v0 dialog component
```

![Screenshot: Project structure](#placeholder-project-structure)

### Test the UI

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

You'll see the v0 components (no functionality yet).

![Screenshot: v0 components running](#placeholder-v0-running)

Press Ctrl+C to stop the dev server.

---

## Execute Implementation Plan

Now in Claude Code (should still be open):

**Copy and paste this exact prompt:**

```
Use your subagent-driven-development skill to execute the ReadStack implementation plan at docs/plans/YYYY-MM-DD-readstack-implementation.md

IMPLEMENTATION STANDARDS:
- Follow TDD strictly: write failing test first → minimal code → refactor
- Apply DRY: extract reusable patterns as you discover them
- Single responsibility: each component has one clear purpose
- Type safety: leverage TypeScript for compile-time guarantees
- Server Components by default, Client Components only when needed

QUALITY REQUIREMENTS:
- Every feature must have tests that failed first
- No production code without failing test first
- Clear error messages and boundaries
- Loading states for all async operations
- Optimistic updates where appropriate

Execute the plan with automatic quality gates between tasks.
```

Replace `YYYY-MM-DD` with your actual plan file date.

Press Enter.

![Screenshot: Subagent-driven development starting](#placeholder-sdd-start)

---

## What Happens Next

### Task 1: Supabase Client Setup

```
Starting Task 1: Set up Supabase client...

Writing test:
  ✓ Test written: client.test.ts
  ✓ Test runs and fails (RED)

Writing implementation:
  ✓ lib/supabase/client.ts created
  ✓ lib/supabase/server.ts created
  ✓ middleware.ts created
  ✓ Test now passes (GREEN)

Running code review...
  ✓ No Critical issues found
  ✓ 1 Minor issue: Consider adding error handling

Task 1 complete (3 minutes)
```

The skill moves to Task 2.

![Screenshot: Task 1 complete](#placeholder-task1-complete)

### Task 2: Authentication

```
Starting Task 2: Implement email/password authentication...

Writing test:
  ✓ auth.test.ts created
  ✓ Test fails (RED)

Writing implementation:
  ✓ app/actions/auth.ts created
  ✓ Signup function implemented
  ✓ Login function implemented
  ✓ Test passes (GREEN)

Running code review...
  ⚠ CRITICAL: Missing input validation on email
  ⚠ CRITICAL: Password not validated for length

Fixing Critical issues...
  ✓ Email validation added
  ✓ Password length check added
  ✓ Tests updated and passing

Task 2 complete (5 minutes)
```

Notice: Critical issues blocked progress until fixed.

![Screenshot: Critical issues found](#placeholder-critical-issues)

### This Continues for ~15-20 Tasks

Each task follows the same pattern:
1. Write test (fails)
2. Write code (test passes)
3. Code review
4. Fix Critical issues
5. Move to next task

**You don't do anything. Just watch.**

---

## The Workflow in Detail

### RED Phase (Test First)

```typescript
// __tests__/features/save-url.test.ts
describe('Save URL', () => {
  it('fetches metadata from URL', async () => {
    const metadata = await fetchMetadata('https://example.com')
    expect(metadata.title).toBeDefined()
    expect(metadata.description).toBeDefined()
  })
})
```

Run test: **FAILS** (function doesn't exist yet)

### GREEN Phase (Minimal Code)

```typescript
// lib/metadata.ts
export async function fetchMetadata(url: string) {
  const response = await fetch(url)
  const html = await response.text()

  // Extract Open Graph tags
  const titleMatch = html.match(/<meta property="og:title" content="([^"]+)"/)
  const descMatch = html.match(/<meta property="og:description" content="([^"]+)"/)

  return {
    title: titleMatch?.[1] || null,
    description: descMatch?.[1] || null
  }
}
```

Run test: **PASSES**

### REFACTOR Phase (Clean Up)

Extract regex patterns, add error handling, improve types.

Tests still pass after refactoring.

### CODE REVIEW Phase (Quality Gate)

Automatic review checks:
- Security (SQL injection, XSS, etc.)
- Performance (N+1 queries, large payloads)
- Best practices (error boundaries, loading states)
- Code quality (DRY, single responsibility)

**Critical issues block next task.**

![Screenshot: Code review running](#placeholder-code-review)

---

## Common Issues During Implementation

### Issue: Test Fails After Implementation

**This is the skill working correctly.**

If code doesn't pass the test, the subagent fixes it. You might see:

```
Test still failing after implementation...
Analyzing failure...
Root cause: Missing await on async function
Fixing...
Test now passes
```

### Issue: Critical Issue Found

**This is quality gates working.**

Example:
```
CRITICAL: User input not sanitized before database query
This could allow SQL injection

Fixing...
Added input validation and parameterized queries
Issue resolved
```

### Issue: Task Takes Longer Than Expected

Some tasks are complex. If Task 7 takes 10 minutes instead of 5, that's normal. The skill estimates are averages.

---

## Midpoint Check (30 minutes in)

After ~10 tasks, you should have:
- Authentication working (signup, login, logout)
- Supabase client configured
- Basic UI wired up
- No failing tests
- Zero Critical issues

Test it:
```bash
npm run dev
```

Try signing up. It should work.

![Screenshot: Midpoint - signup working](#placeholder-midpoint-signup)

---

## Final Tasks (Tasks 15-20)

The last tasks add polish:
- Error boundaries
- Loading states
- Optimistic updates
- Edge case handling
- Final integrations

These are where quality gates catch the most issues.

**Don't skip them.** They're what make the app production-ready.

---

## Final Comprehensive Review

After all tasks complete:

```
All tasks complete. Running final comprehensive review...

Checking:
  ✓ All tests passing (47 tests, 0 failures)
  ✓ No Critical issues
  ✓ 3 Important issues found
  ⚠ TypeScript errors in 2 files

Fixing Important issues:
  ✓ Added missing error boundary
  ✓ Fixed loading state race condition
  ✓ Added proper cleanup in useEffect

Fixing TypeScript errors:
  ✓ All type errors resolved

Final check:
  ✓ All tests passing
  ✓ TypeScript compiles without errors
  ✓ Build succeeds
  ✓ Ready for deployment
```

![Screenshot: Final review](#placeholder-final-review)

---

## Test Everything

Run the app:
```bash
npm run dev
```

**Test signup:**
1. Go to /signup
2. Enter email and password
3. Click "Sign up"
4. Should redirect to /dashboard

**Test save URL:**
1. Click "Save URL" button
2. Paste: `https://react.dev`
3. See metadata load automatically
4. Add tags: "react", "docs"
5. Click "Save"
6. See article in "To Read" list

**Test article management:**
1. Click an article card
2. Edit the title
3. Change status to "Reading"
4. Add rating (4 stars)
5. Add notes
6. Everything saves automatically

![Screenshot: Testing features](#placeholder-testing-features)

---

## Run Tests

```bash
npm test
```

All tests should pass:
```
Test Suites: 12 passed, 12 total
Tests:       47 passed, 47 total
```

If any fail, ask Claude Code:
```
Tests are failing. What's wrong?
```

Claude will debug and fix.

---

## Build for Production

```bash
npm run build
```

Should complete without errors:
```
✓ Compiled successfully
✓ Collecting page data
✓ Generating static pages (8/8)
✓ Finalizing page optimization

Route (app)                              Size     First Load JS
┌ ○ /                                    142 B          87.3 kB
├ ○ /dashboard                           2.1 kB         89.2 kB
└ ○ /login                               891 B          88.0 kB
...

○  (Static)  automatically rendered as static HTML
```

![Screenshot: Build success](#placeholder-build-success)

---

## What Just Happened?

**You spent 60 minutes building ReadStack:**
- 15-20 tasks executed
- Each task followed TDD
- Code review after each task
- Critical issues caught early
- All tests passing
- Production build succeeds

**Quality gates ensured:**
- No SQL injection vulnerabilities
- No XSS vulnerabilities
- Proper error handling
- Loading states everywhere
- Accessible HTML
- Type-safe code

**Traditional approach:** 2-3 days, probably buggy, technical debt everywhere.

**Maintainable vibe coding:** 60 minutes, clean code, zero debt.

---

## Time Check

**Planned:** 60 minutes

**Actual:** Probably 50-70 minutes

If you took longer:
- Critical issues required fixes (that's good!)
- Complex tasks took longer (normal)
- First time seeing this workflow (faster next time)

---

## What You Learned

- Subagent-driven-development executes plans systematically
- TDD is enforced (test fails first, always)
- Quality gates catch issues early
- Critical issues block progress (prevents compounding)
- 60 minutes from zero to working app

**What you have:**
- Working authentication
- Full CRUD operations
- Metadata fetching
- All tests passing
- Production build ready

**What you don't have yet:**
- Git repository (next chapter)
- Deployed to production (next chapter)
- Custom domain

**Next:** Chapter 16 - Deployment and Testing (20 min)

Push to GitHub, deploy to Vercel, test production.
