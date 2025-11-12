# Chapter 16: Deployment and Testing

Ship to production.

**Time:** 20 minutes

**What you'll do:** Push to GitHub, deploy to Vercel, test live app.

## Commit Your Work

```bash
git add .
git commit -m "feat: implement ReadStack MVP

- Authentication with Supabase (email/password)
- Save URLs with Open Graph metadata fetching
- Article CRUD operations
- Filter by status and tags
- All tests passing (47 tests)
- Quality gates passed

Built using subagent-driven-development skill"
```

## Push to GitHub

**Option A: GitHub CLI (recommended):**

```bash
gh repo create readstack --public --source=. --remote=origin --push
```

Done.

**Option B: Manual:**

1. Go to [github.com/new](https://github.com/new)
2. Name: `readstack`
3. Public
4. Don't initialize with README
5. Create repository
6. Run:

```bash
git remote add origin https://github.com/yourusername/readstack.git
git branch -M main
git push -u origin main
```

## Deploy to Vercel

**1. Go to [vercel.com](https://vercel.com)**

**2. Click "Add New..." → "Project"**

**3. Import your `readstack` repository**

**4. Configure:**
- Framework: Next.js (auto-detected)
- Root Directory: `./`
- Build/Install commands: (leave default)

**5. Add Environment Variables:**

Click "Environment Variables"

Add:
- `NEXT_PUBLIC_SUPABASE_URL` → (from your `.env.local`)
- `NEXT_PUBLIC_SUPABASE_ANON_KEY` → (from your `.env.local`)

**6. Click "Deploy"**

Wait 2-3 minutes.

## Test Production

When deployment completes:

**1. Click "Visit" button**

Opens: `https://readstack-yourname.vercel.app`

**2. Test flow:**
- Sign up with real email
- Check email for confirmation
- Confirm account
- Log in
- Save a URL
- See article with metadata
- Filter by status
- Rate and add notes
- Log out
- Log back in → data persists

Everything should work in production.

## Setup Continuous Deployment

Already done! Every git push now auto-deploys.

**Test it:**

1. Make small change locally
2. Commit and push
3. Watch Vercel auto-deploy
4. See change live in 2-3 minutes

## What You Have

**Live app at yourname.vercel.app:**
- Working authentication
- URL saving with metadata
- Article management
- Responsive design
- Fast and reliable

**Plus:**
- GitHub repository
- Continuous deployment
- Zero technical debt
- Ready to enhance

**Built in 2h 50min:**
- 30 min planning
- 20 min implementation plan
- 20 min UI design
- 20 min backend setup
- 60 min implementation
- 20 min deployment

Traditional approach: 2-3 weeks.

## Next Steps

**For yourself:**
- Use ReadStack daily
- Add features as needed
- Share with friends

**For learning:**
- Chapter 17-19: Add Playwright testing
- Build your own apps using same workflow

You've completed the maintainable vibe coding workflow.

Fast AND maintainable. Not one or the other. Both.

## Congratulations

You built and deployed a production app in under 3 hours.

With tests. With quality gates. With clean code.

This is the new way to build.
