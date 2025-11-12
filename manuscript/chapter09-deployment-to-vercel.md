# Chapter 9: Phase 5 - Deployment to Production

You've built your app. Now ship it.

This chapter teaches zero-config deployment with Vercel.

## What is Vercel?

Vercel is a deployment platform built for Next.js (they created Next.js).

**What Vercel provides:**
- Zero-config Next.js deployment
- Global CDN (100+ edge locations)
- Automatic HTTPS
- Environment variable management
- Preview deployments for every PR
- Automatic scaling
- Analytics

**What you don't configure:**
- Build process
- Server setup
- SSL certificates
- CDN
- Load balancing
- Scaling

All automatic.

## Traditional vs Vercel Deployment

**Traditional deployment:**
1. Rent server
2. Install Node.js
3. Configure Nginx
4. Get SSL certificate
5. Set up auto-restart
6. Monitor health
7. Handle scaling

**Total:** 1-2 days setup + ongoing maintenance

**Vercel deployment:**
1. Connect GitHub
2. Add environment variables
3. Click "Deploy"

**Total:** 5 minutes, zero maintenance

**The difference:** Vercel knows Next.js and optimizes everything automatically.

## How It Works

### 1. Git Push Triggers Deploy

```bash
git push origin main
```

**Vercel automatically:**
1. Detects push
2. Clones repository
3. Installs dependencies
4. Runs build
5. Deploys to global CDN
6. Sends notification

**Time:** 2-3 minutes from push to live.

### 2. Automatic Optimization

**Vercel optimizes:**
- Images → WebP, lazy loading, CDN
- JavaScript → Code-split, minified, compressed
- Pages → Pre-rendered, cached, edge-served

**You configure:** Nothing.

### 3. Global Edge Network

**100+ locations worldwide:**
- User in Tokyo → Served from Tokyo
- User in New York → Served from New York
- ~50ms response time globally

**For ReadStack:** Fast everywhere, automatically.

## Environment Variables

### Local Development

`.env.local`:
```
NEXT_PUBLIC_SUPABASE_URL=https://yourproject.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

Not committed to git (in `.gitignore`).

### Production (Vercel)

**Add in Vercel dashboard:**
1. Project → Settings → Environment Variables
2. Add same variables
3. Select "Production"
4. Save

Vercel injects at build time.

## Preview Deployments

**Every PR gets its own URL.**

**Workflow:**
1. Create feature branch
2. Make changes
3. Push to GitHub
4. Create PR
5. **Vercel auto-deploys PR to unique URL**
6. Comment appears in PR with preview link
7. Test preview before merging
8. Merge PR → deploys to production

**Benefits:**
- Test in real environment
- Share for feedback
- Verify mobile responsiveness
- No local environment differences

**For ReadStack:** Test before shipping, even solo.

## Custom Domains (Optional)

**Default:** `readstack-yourname.vercel.app`

**Custom:** `readstack.yourdomain.com`

**Setup:**
1. Vercel → Settings → Domains
2. Add your domain
3. Add DNS records Vercel provides
4. Wait 5-10 minutes
5. **Done. HTTPS automatic.**

Vercel handles SSL certificates, auto-renewal, everything.

## Automatic HTTPS

Every deployment gets HTTPS:
- Let's Encrypt certificates
- Auto-renewal
- HTTP → HTTPS redirect
- Modern TLS

**You do:** Nothing

**You get:** A+ SSL rating

## Deployment Workflow

### Initial Deploy

```bash
git add .
git commit -m "feat: complete ReadStack MVP"
git push origin main

# Vercel auto-deploys
# Live at: readstack-yourname.vercel.app
```

**Time:** 2-3 minutes

### Add Feature

```bash
git checkout -b feature/keyboard-shortcuts
# Add feature
git commit -m "feat: add keyboard shortcuts"
git push

# Vercel creates preview
# Test preview
# Merge PR
# Auto-deploys to production
```

**Time:** 2 minutes deployment

### Rollback (If Needed)

Vercel dashboard → Deployments → Click old deployment → "Promote to Production"

**Time:** 10 seconds

## Cost

### Free Tier (Hobby)

**Includes:**
- Unlimited deployments
- 100GB bandwidth/month
- Preview deployments
- Automatic HTTPS
- Global CDN

**For ReadStack:** Free tier handles 1000s of users.

### Pro Tier ($20/month)

**Includes:**
- 1TB bandwidth/month
- Advanced analytics
- Team collaboration
- Priority support

**For production apps.**

## Automatic Scaling

**Vercel scales automatically:**

- 10 users/day → Minimal resources, free
- 1000 users/day → Scales automatically, still free
- 100k users/day → Scales to handle, upgrade to Pro
- HackerNews spike → Handles it, no downtime

**Set it and forget it.**

## Common Issues

### Environment Variables Missing

**Symptom:** Works locally, breaks in production

**Fix:**
1. Vercel → Settings → Environment Variables
2. Add missing variables
3. Redeploy

### Build Fails

**Symptom:** Vercel build fails

**Fix:**
1. Run `npm run build` locally
2. Fix errors
3. Push again

**Prevention:** Always test `npm run build` before pushing.

## What You Learned

**Vercel = Zero-config deployment**
Push to GitHub → Live in 3 minutes.

**Preview deployments**
Test changes before production.

**Automatic optimizations**
Images, code splitting, caching, CDN.

**Environment variables**
Production, preview, development isolated.

**Automatic HTTPS**
Professional setup in 5 minutes.

**Rollback in seconds**
Every deployment preserved.

**Auto-scaling**
Handles growth without configuration.

**For ReadStack:** Deploy once, updates automatic, zero maintenance.

## What's Next

You've learned the five-phase workflow:
1. Design with v0 (Chapter 5)
2. Infrastructure with Supabase (Chapter 6)
3. GitHub setup (Chapter 7)
4. Development with Claude Code (Chapter 8)
5. Deployment to Vercel (Chapter 9)

**Next:** ReadStack Tutorial (Chapters 10-16)

You'll build ReadStack from scratch in 2 hours 50 minutes, applying everything you learned.
