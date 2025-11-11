# Automation Guide: GitHub Actions + Leanpub API

Your book now has automated publishing workflows! This guide explains how they work.

## What's Automated

### 1. Auto-Preview (preview branch)

**Trigger:** Push to `preview` branch with changes to `manuscript/`

**What happens:**
1. GitHub detects push to `preview` branch
2. Workflow calls Leanpub API
3. Leanpub starts building preview (PDF/EPUB/MOBI)
4. You get a commit comment with status
5. Leanpub emails you when preview is ready

**Workflow file:** `.github/workflows/leanpub-preview.yml`

### 2. Auto-Publish (main branch)

**Trigger:** Push to `main` branch with changes to `manuscript/`

**What happens:**
1. GitHub detects push to `main` branch
2. Workflow calls Leanpub API
3. Leanpub publishes new version
4. Customers get update notification
5. You get a commit comment with status

**Workflow file:** `.github/workflows/leanpub-publish.yml`

## Setup Instructions

### Step 1: Create Leanpub Book

Follow [LEANPUB-SETUP.md](../LEANPUB-SETUP.md) to create your book on Leanpub.

### Step 2: Get API Key

1. Go to [leanpub.com/author_dashboard/api](https://leanpub.com/author_dashboard/api)
2. Click "Generate New API Key"
3. Copy the key (shown only once!)

### Step 3: Add Secret to GitHub

1. Go to: https://github.com/SecurityRonin/maintainable-vibe-coding/settings/secrets/actions
2. Click "New repository secret"
3. Name: `LEANPUB_API_KEY`
4. Value: Paste your API key
5. Click "Add secret"

### Step 4: Test It!

```bash
# Make a small change
git checkout preview
echo "# Test" >> manuscript/test.txt

# Commit and push
git add manuscript/test.txt
git commit -m "test: verify auto-preview workflow"
git push origin preview

# Check GitHub Actions tab
# You should see "Leanpub Auto-Preview" workflow running
# Check your commit for a comment with status
```

## How to Use

### Writing Workflow with Automation

```bash
# Start writing
git checkout preview
git pull origin preview

# Write chapter
code manuscript/chapter05-design-with-v0.txt

# Commit and push
git add manuscript/
git commit -m "wip: chapter 5 draft"
git push origin preview
# 👆 This automatically triggers Leanpub preview build!

# Wait for email from Leanpub (usually 2-5 minutes)
# Download preview PDF from email link
# Review

# Make edits based on review
code manuscript/chapter05-design-with-v0.txt

# Commit and push again
git add manuscript/
git commit -m "improve: chapter 5 based on review"
git push origin preview
# 👆 Another preview build triggered!

# Happy with it? Publish to main
git checkout main
git merge preview
git push origin main
# 👆 This automatically publishes new version to customers!
```

### What You No Longer Need to Do

❌ Go to Leanpub website
❌ Click "Preview" button
❌ Wait on page for build
❌ Click "Publish New Version" button

✅ Just push to GitHub, automation handles the rest!

## Workflow Details

### Preview Workflow (`.github/workflows/leanpub-preview.yml`)

**Triggers on:**
- Push to `preview` branch
- Only if files in `manuscript/` changed

**What it does:**
```yaml
1. Checks out code
2. Calls Leanpub API: POST /preview.json
3. Checks if successful
4. Adds comment to commit with status:
   - ✅ Success → "Preview build triggered, check dashboard"
   - ❌ Failure → "Failed to trigger, check API key"
```

**API call:**
```bash
curl -X POST \
  "https://leanpub.com/maintainable-vibe-coding/preview.json" \
  -d "api_key=YOUR_API_KEY"
```

### Publish Workflow (`.github/workflows/leanpub-publish.yml`)

**Triggers on:**
- Push to `main` branch
- Only if files in `manuscript/` changed

**What it does:**
```yaml
1. Checks out code
2. Extracts version from commit message (if present)
3. Calls Leanpub API: POST /publish.json
4. Includes release notes
5. Adds comment to commit with status
```

**API call:**
```bash
curl -X POST \
  "https://leanpub.com/maintainable-vibe-coding/publish.json" \
  -d "api_key=YOUR_API_KEY" \
  -d "release_notes=Published from commit abc123"
```

**Version detection:**
If your commit message includes `v1.2.3` format, it's added to release notes:
```bash
git commit -m "feat: add chapter 5 - v1.2.0"
# Release notes: "v1.2.0 - Published from commit abc123"
```

## Monitoring Builds

### Via GitHub Actions

1. Go to: https://github.com/SecurityRonin/maintainable-vibe-coding/actions
2. See all workflow runs
3. Click on a run to see details
4. Check logs for any errors

### Via Commit Comments

After you push, check your commit on GitHub:
- https://github.com/SecurityRonin/maintainable-vibe-coding/commits/preview
- Click on a commit
- Scroll down to see automated comment with build status

### Via Leanpub Dashboard

1. Go to: https://leanpub.com/maintainable-vibe-coding/dashboard
2. See "Last Preview" and "Last Publish" timestamps
3. View build status and any errors

### Via Email

Leanpub emails you when:
- Preview build completes
- Publish completes
- Build fails (with error details)

## Troubleshooting

### Workflow Not Running

**Check 1: Is API key set?**
```bash
# Check if secret exists (won't show value)
gh secret list
# Should show: LEANPUB_API_KEY
```

**Check 2: Did files in manuscript/ change?**
```bash
git diff HEAD~1 HEAD --name-only
# Should show files in manuscript/
```

**Check 3: Are you on the right branch?**
```bash
git branch --show-current
# Should be "preview" or "main"
```

### Workflow Runs But Fails

**Check Actions log:**
1. Go to: https://github.com/SecurityRonin/maintainable-vibe-coding/actions
2. Click on failed workflow
3. Click on job
4. Read error message

**Common errors:**

**"Invalid API key"**
- API key expired or incorrect
- Regenerate on Leanpub and update GitHub secret

**"Book not found"**
- Book slug might be wrong in workflow file
- Check: Is your book at `leanpub.com/maintainable-vibe-coding`?

**"Rate limit exceeded"**
- You're pushing too frequently
- Wait a few minutes between pushes

### Build Triggered But Leanpub Fails

**Check Leanpub dashboard:**
- https://leanpub.com/maintainable-vibe-coding/dashboard
- Look for error messages in build log

**Common Leanpub errors:**

**"Malformed markdown"**
- Check your markdown syntax
- Validate code blocks use `{lang=language}` format

**"Missing file"**
- File listed in Book.txt doesn't exist
- Check capitalization and file paths

**"Image not found"**
- Image referenced but not in resources/images/
- Check image paths

## Disabling Automation

If you want to go back to manual:

### Disable workflows temporarily:

1. Go to: https://github.com/SecurityRonin/maintainable-vibe-coding/settings/actions
2. Click "Disable Actions" or disable specific workflows

### Or rename workflow files:

```bash
git mv .github/workflows/leanpub-preview.yml .github/workflows/leanpub-preview.yml.disabled
git mv .github/workflows/leanpub-publish.yml .github/workflows/leanpub-publish.yml.disabled
git commit -m "disable auto-publish workflows"
```

## Advanced Usage

### Manual Trigger

You can manually trigger builds from GitHub:

```yaml
# Add to workflow file under 'on:'
on:
  workflow_dispatch:  # Adds "Run workflow" button in Actions tab
  push:
    branches:
      - preview
```

Then go to Actions tab → Select workflow → Click "Run workflow"

### Build Status Badge

Add to README.md:

```markdown
[![Leanpub Preview](https://github.com/SecurityRonin/maintainable-vibe-coding/actions/workflows/leanpub-preview.yml/badge.svg)](https://github.com/SecurityRonin/maintainable-vibe-coding/actions/workflows/leanpub-preview.yml)
```

### Notify Slack/Discord

Add notification step to workflow:

```yaml
- name: Notify Slack
  if: success()
  uses: slackapi/slack-github-action@v1
  with:
    webhook-url: ${{ secrets.SLACK_WEBHOOK }}
    payload: |
      {
        "text": "📚 New Leanpub preview ready!"
      }
```

### Check Sales After Publish

Add sales check to publish workflow:

```yaml
- name: Check Sales
  run: |
    sales=$(curl -s "https://leanpub.com/maintainable-vibe-coding/sales.json?api_key=${{ secrets.LEANPUB_API_KEY }}")
    echo "Sales data: $sales"
```

## Security Notes

### API Key Security

✅ **DO:**
- Store API key in GitHub Secrets (never in code)
- Regenerate if compromised
- Use repository secrets (not environment secrets)

❌ **DON'T:**
- Commit API key to repository
- Share API key in public
- Log API key in workflow output

### Workflow Permissions

The workflows only have permission to:
- Read repository contents
- Post commit comments
- Call Leanpub API on your behalf

They cannot:
- Modify repository code
- Change GitHub settings
- Access other repositories

## Cost Considerations

**GitHub Actions:**
- Free for public repositories (unlimited minutes)
- If repository is private: 2000 minutes/month free, then $0.008/minute

**Leanpub API:**
- Free, no additional cost
- Included with Leanpub author account

**Your usage:**
- ~30 seconds per workflow run
- ~1-2 runs per push
- ~10-20 runs per day while actively writing
- Total: ~10 minutes/day = ~300 minutes/month = Well within free tier

## FAQ

**Q: Will every push publish to customers?**
A: No! Only pushes to `main` publish. Pushes to `preview` just create test builds for you.

**Q: Can I preview before automating publish?**
A: Yes! Use manual workflow: write on `preview`, test with auto-preview, then manually click "Publish" on Leanpub when ready. You don't have to use auto-publish.

**Q: What if I want to review before publishing?**
A: Disable auto-publish workflow. Keep auto-preview for testing. Manually publish when ready.

**Q: Can I rollback a publish?**
A: No, Leanpub doesn't support rollbacks. But you can quickly push a fix and publish again.

**Q: How long does a build take?**
A: Preview/Publish: 2-10 minutes depending on book size. You'll get email when done.

## Summary

**Without automation:**
1. Write → 2. Commit → 3. Push → 4. Go to Leanpub → 5. Click Preview → 6. Wait → 7. Download → 8. Repeat

**With automation:**
1. Write → 2. Commit → 3. Push → 4. Check email when preview is ready

**Time saved:** ~5 minutes per preview build × 10 builds/day = ~50 minutes/day

---

**Questions?** Open an issue: https://github.com/SecurityRonin/maintainable-vibe-coding/issues
