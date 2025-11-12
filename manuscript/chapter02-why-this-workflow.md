# Chapter 2: Why This Workflow Works

Every choice in this workflow is battle-tested. Here's why each phase exists and why they're in this order.

## Design First (v0)

**Why design first:**
You can't build the backend until you know what the frontend needs. Design reveals actual requirements.

**Why v0:**
Generates production Next.js code. No Figma handoffs. No manual CSS.

**For ReadStack:**
4 designs in 20 minutes: auth pages, dashboard, save dialog, article detail.

Traditional approach: 6-8 hours building components and writing CSS.

## Infrastructure Second (Supabase)

**Why infrastructure second:**
Now you know what the UI needs. Build exactly the schema required. Nothing more.

**Why Supabase:**
Backend as a service. Authentication, database, and API automatically generated.

**For ReadStack:**
One SQL script creates your entire backend in 20 minutes.

Traditional approach: 2-3 days building API routes, auth, database setup.

## Version Control Third (GitHub)

**Why version control third:**
You have something real to commit: v0 export and Supabase schema. Not an empty repo.

**Why GitHub:**
Industry standard. Free. Integrates with Vercel for deployment.

**For ReadStack:**
First commit includes complete UI and backend schema. Clean history from day one.

## Development Fourth (Claude Code + Superpowers)

**Why development fourth:**
Design, infrastructure, and git are ready. Now you're building something specific with clear rails.

**Why Claude Code + Superpowers:**
AI speed with quality gates. You get suggestions, not surprises.

**What Superpowers provides:**

- **Brainstorming skill:** Architecture design through questions
- **Writing-plans skill:** Breaks architecture into bite-sized tasks (2-5 min each)
- **Subagent-driven-development skill:** Executes plan with TDD (test first, always)
- **Code review after each task:** Critical issues block progress

**For ReadStack:**
30 min planning + 20 min implementation plan + 60 min execution = 110 minutes total.

Traditional approach: 2-3 weeks coding and debugging.

## Deployment Fifth (Vercel)

**Why deployment fifth:**
Deploy frequently from the start. Not "we'll deploy when ready."

**Why Vercel:**
Zero-config Next.js deployment. Push to GitHub → automatic deploy.

**For ReadStack:**
First deployment: 20 minutes. Every subsequent deploy: automatic on git push.

Traditional approach: Hours setting up servers, CI/CD, SSL.

## The Order Matters

**Design → Infrastructure:**
Design shows what you actually need. Build that. Not what you think you need.

**Infrastructure → Version Control:**
Empty repos are confusing. Real code makes git make sense.

**Version Control → Development:**
Git history documents decisions. Commits tell the story.

**Development → Deployment:**
Deploy frequently, catch issues early. Deploy on day one, every day after.

## Tool Choices

| Tool | Why | For ReadStack |
|------|-----|---------------|
| **v0** | Generates production Next.js code | 20 min vs 6-8 hours |
| **Supabase** | Auth + database + API in one | 20 min vs 2-3 days |
| **GitHub** | Industry standard, free | Standard workflow |
| **Claude Code** | Best coding AI with codebase context | Architecture + tests |
| **Superpowers** | Quality gates prevent bad code | TDD enforced |
| **Vercel** | Zero-config Next.js deployment | 20 min vs hours |

## What You Give Up

**Trade-offs:**
- v0 requires access (paid tier recommended)
- Supabase is another service
- Claude Code requires Claude Pro ($20/month)
- Vercel free tier has limits (upgrade eventually)

**Worth it because:**
Build in 3 hours what normally takes 2-3 weeks.

**Total cost for ReadStack:** $20/month (Claude Pro)

## What's Next

Chapter 3 shows you exactly what ReadStack does and why it's the perfect first project.

Then Chapter 4 gets you set up with all the tools.

By understanding WHY before learning HOW, you'll internalize the workflow instead of just following steps.
