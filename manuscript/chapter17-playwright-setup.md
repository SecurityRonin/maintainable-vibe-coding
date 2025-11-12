# Chapter 17: Playwright E2E Testing

Add end-to-end tests to ReadStack.

**The vibe coding way:** You describe user flows. Claude Code writes Playwright tests.

## Setup Playwright

**In Claude Code:**

```
Set up Playwright for E2E testing in my Next.js ReadStack project.

Configure for:
- Chrome, Firefox, Safari
- Test database fixtures
- GitHub Actions CI
- Local dev server

Create example test to verify setup works.
```

**Claude Code will:**
1. Run `npm init playwright@latest`
2. Configure `playwright.config.ts`
3. Set up test fixtures
4. Add CI workflow
5. Create example test

**Time:** 5 minutes. Done automatically.

## Writing Tests: Describe User Flows

**Don't learn Playwright API. Just describe what users do.**

**Example:**

**You:** "Write E2E test for login flow. User enters email and password, clicks sign in, should see dashboard with welcome message."

**Claude Code generates:**
```typescript
// e2e/auth/login.spec.ts
import { test, expect } from '@playwright/test';

test('user can sign in', async ({ page }) => {
  await page.goto('/login');
  await page.getByLabel('Email').fill('test@example.com');
  await page.getByLabel('Password').fill('password123');
  await page.getByRole('button', { name: 'Sign In' }).click();

  await expect(page).toHaveURL('/dashboard');
  await expect(page.getByText('Welcome back')).toBeVisible();
});
```

**You review:** "Looks good" → commit.

## Common Test Flows to Request

**Authentication:**
"Write E2E tests for signup, login, logout, and password reset flows."

**CRUD operations:**
"Write E2E tests for creating, reading, updating, and deleting articles."

**User flows:**
"Write E2E test for complete user flow: sign up, save URL, filter by status, rate article, delete article."

**Edge cases:**
"Write E2E test for saving invalid URL, should show error message."

Claude Code writes all tests. You just describe behavior.

## Running Tests

**Run all tests:**
```bash
npx playwright test
```

**Run specific test:**
```bash
npx playwright test e2e/auth/login.spec.ts
```

**Run with UI (see browser):**
```bash
npx playwright test --ui
```

**Debug mode:**
```bash
npx playwright test --debug
```

## What You Get

After asking Claude Code to write tests:
- Complete E2E test suite
- Page Object Models (reusable)
- Test fixtures (authentication, database)
- CI integration
- ~20 tests covering all user flows

Written in 30 minutes by Claude Code.

Traditional approach: 1-2 days learning Playwright + writing tests.

## Next

Chapter 18 - Understanding E2E test patterns Claude Code uses.

Chapter 19 - Auto-debugging when tests fail.
