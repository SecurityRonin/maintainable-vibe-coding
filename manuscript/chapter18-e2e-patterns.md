# Chapter 18: Understanding E2E Test Patterns

Claude Code writes Playwright tests. You should understand the patterns it uses.

**Not to write them yourself.**
**But to review them and request specific patterns.**

## Pattern 1: Page Objects

**What Claude Code creates:**

```typescript
// e2e/pages/DashboardPage.ts
export class DashboardPage {
  constructor(private page: Page) {}

  async goto() {
    await this.page.goto('/dashboard');
  }

  async createTask(title: string) {
    await this.page.getByRole('button', { name: 'New Task' }).click();
    await this.page.getByLabel('Title').fill(title);
    await this.page.getByRole('button', { name: 'Create' }).click();
  }

  async expectTaskVisible(title: string) {
    await expect(this.page.getByText(title)).toBeVisible();
  }
}
```

**Why:** Changes to UI only need updating in one place.

**Usage:** Tests read like English: `dashboard.createTask('My Task')`

**When to request:** "Use Page Object pattern for dashboard tests."

## Pattern 2: Test Fixtures

**What Claude Code creates:**

```typescript
// e2e/fixtures.ts
export const test = base.extend({
  authenticatedPage: async ({ page }, use) => {
    // Logs in before each test
    await page.goto('/login');
    await page.getByLabel('Email').fill('test@example.com');
    await page.getByLabel('Password').fill('password');
    await page.getByRole('button', { name: 'Sign In' }).click();
    await page.waitForURL('/dashboard');

    await use(page);

    // Logs out after test
    await page.getByRole('button', { name: 'Logout' }).click();
  },
});
```

**Why:** No repeated login code in every test.

**Usage:** Tests that need authentication use this fixture automatically.

**When to request:** "Add fixture for authenticated admin user."

## Pattern 3: Test Isolation

**What Claude Code creates:**

```typescript
test('edit article', async ({ page }) => {
  // Each test creates its own data
  const articleId = await createTestArticle({ title: 'Original' });

  await page.goto(`/articles/${articleId}/edit`);
  await page.getByLabel('Title').fill('Updated');
  await page.getByRole('button', { name: 'Save' }).click();

  await expect(page.getByText('Updated')).toBeVisible();
});
```

**Why:** Tests don't depend on each other. Run in any order.

**When to request:** "Each test should create and clean up its own data."

## Pattern 4: Waiting for States

**What Claude Code creates:**

```typescript
test('save URL shows metadata', async ({ page }) => {
  await page.goto('/dashboard');
  await page.getByRole('button', { name: 'Save URL' }).click();

  // Wait for dialog to be ready
  await page.getByLabel('URL').waitFor({ state: 'visible' });

  await page.getByLabel('URL').fill('https://example.com/article');

  // Wait for metadata fetch
  await page.getByLabel('Title').waitFor({ state: 'visible' });

  await expect(page.getByLabel('Title')).not.toBeEmpty();
});
```

**Why:** Handles async operations without arbitrary timeouts.

**When to request:** "Wait for elements to be ready, not fixed timeouts."

## What You Do

**Review tests Claude Code writes:**
- Does it match my UI?
- Are the right elements selected?
- Are waits appropriate?

**Request patterns:**
- "Use Page Objects for all dashboard tests"
- "Add fixture for authenticated user"
- "Each test should be isolated"

**Trust Claude Code** to know when to use each pattern.

You don't need to become a Playwright expert. Just understand what good tests look like.

## Next

Chapter 19 - Auto-debugging E2E tests when they fail.
