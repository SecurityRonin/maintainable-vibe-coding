# Chapter 19: Auto-Debugging E2E Tests

E2E tests fail. Debugging with Claude Code is a conversation, not a detective investigation.

## Traditional vs Vibe Coding Debugging

**Traditional:**
1. Test fails
2. Read cryptic error
3. Google Playwright docs
4. Add console.logs
5. Try different selector
6. Add arbitrary timeout
7. Give up after 2 hours

**Vibe coding:**
1. Test fails
2. Copy error to Claude Code
3. Claude fixes it
4. Done in 5 minutes

## The Workflow

### 1. Run Test

```bash
npx playwright test
```

### 2. Get Error

Test output shows:
```
✗ tasks/create.spec.ts › user creates task (5.2s)

Error: Timeout 30000ms exceeded waiting for
getByRole('button', { name: 'Create' })
```

### 3. Tell Claude Code

"The 'create task' test is failing:
```
Error: Timeout 30000ms exceeded waiting for
getByRole('button', { name: 'Create' })
```
"

### 4. Claude Debugs

Claude Code:
```
The button selector is timing out. Checking your UI...

The button text changed from "Create" to "Create Task"
in your last commit.

Updating the test...

Also adding a wait for form to load.
```

### 5. Verify

```bash
npx playwright test tasks/create.spec.ts
```

Test passes → Done.

Test still fails → Go back to step 3.

## Common Failures

### Element Not Found

**Error:**
```
Error: locator.click: Target closed
```

**You:** "Test failed with 'Target closed'. What does that mean?"

**Claude Code:**
"Page navigated before action completed. Adding waitForNavigation..."

**Fixes it.**

### Timing Issues

**Error:**
```
Error: Element is not visible
```

**You:** "Element not visible error."

**Claude Code:**
"Element loads async. Adding proper wait condition..."

**Fixes it.**

### Selector Changed

**Error:**
```
Error: getByRole('button', { name: 'Submit' }) not found
```

**You:** "Button not found but it exists in UI."

**Claude Code:**
"Button text changed to 'Save Changes'. Updating test..."

**Fixes it.**

## Debugging Tools

**Run with UI:**
```bash
npx playwright test --ui
```

See tests run in browser UI. Pause, step through, inspect.

**Debug mode:**
```bash
npx playwright test --debug
```

Runs with Playwright Inspector. Step through test line by line.

**Show trace:**
```bash
npx playwright show-trace trace.zip
```

See screenshots, DOM snapshots, network requests for failed test.

**Ask Claude Code:**
"Show me how to use Playwright trace for debugging this test."

Claude explains and helps interpret traces.

## Visual Debugging Workflow

**1. Test fails**

**2. Run with trace:**
```bash
npx playwright test --trace on
```

**3. Test fails, generates trace.zip**

**4. Tell Claude Code:**
"Test failed. Here's the trace: [attach trace.zip]"

**5. Claude analyzes:**
- Screenshots at each step
- Network requests
- DOM changes
- Console errors

**6. Claude identifies:**
"At step 3, the form submission triggered a network error 500. Your API endpoint changed..."

**Fixes it.**

## What You Never Do

❌ Learn Playwright selector syntax
❌ Read Playwright documentation
❌ Debug async/await issues
❌ Figure out why elements aren't found
❌ Add random timeouts hoping tests pass

✅ Describe what failed
✅ Share error messages with Claude
✅ Review and approve fixes
✅ Run tests again

Claude Code handles the debugging complexity.

## End Result

**E2E test suite that:**
- Tests all critical user flows
- Catches regressions automatically
- Runs in CI on every commit
- Debugs itself (with Claude Code)
- Maintains itself as UI changes

**Your investment:**
- 30 min: Ask Claude to write tests
- 5 min per failure: Copy error to Claude
- 0 hours: Learning Playwright

**Maintainable vibe coding applied to testing.**

Fast AND reliable. Not one or the other. Both.

## Congratulations

You've completed all chapters.

You know how to build production apps in hours, not weeks:
- Design first (v0)
- Infrastructure (Supabase)
- Version control (GitHub)
- Development (Claude Code + Superpowers)
- Deployment (Vercel)
- Testing (Playwright + Claude Code)

**Go build.**
