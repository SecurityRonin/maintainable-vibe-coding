# Publishing Workflow: Branch Strategy

This document explains the two-branch workflow for managing book content.

## Branch Overview

```
preview → Draft content, work in progress, Leanpub previews
   ↓
  PR
   ↓
main → Published content, stable, public releases
```

### `preview` Branch
**Purpose:** Draft content and work in progress

**Use for:**
- Writing new chapters
- Experimenting with structure
- Testing Leanpub builds
- Getting feedback before publishing

**Leanpub connection:** Set to `preview` branch for draft builds

**Who sees it:**
- You (author)
- Beta readers (if you share Leanpub preview link)
- NOT public on GitHub Pages

### `main` Branch
**Purpose:** Published, stable content

**Use for:**
- Final, polished chapters
- Official Leanpub releases
- GitHub Pages deployment
- Public-facing content

**Leanpub connection:** Optional second book for "stable" releases

**Who sees it:**
- Everyone on GitHub Pages
- Published Leanpub versions (if you create separate "published" book)

## Daily Workflow

### Starting New Work

```bash
# Always start from preview branch
git checkout preview
git pull origin preview

# Create feature branch (optional, for major changes)
git checkout -b feature/chapter-05-design-phase

# Or work directly on preview for small changes
```

### Writing Content

```bash
# Make changes to manuscript files
code manuscript/chapter05-design-with-v0.txt

# Commit as you go
git add manuscript/
git commit -m "wip: add v0 design workflow section"

# Push to preview branch
git push origin preview  # or your feature branch
```

### Testing with Leanpub

1. Push changes to `preview` branch
2. Go to Leanpub dashboard
3. Click **"Preview"** (not "Publish")
4. Download and review PDF/EPUB
5. Iterate until satisfied

### Publishing to Main

When chapter/section is ready for public release:

```bash
# Ensure you're on preview with latest changes
git checkout preview
git pull origin preview

# Merge to main
git checkout main
git pull origin main
git merge preview

# Push to main (triggers GitHub Pages deployment)
git push origin main
```

**Or use Pull Request (recommended):**

```bash
# From preview branch
gh pr create --base main --head preview --title "Publish: Chapter 5 - Design with v0"

# Review PR on GitHub
# Merge when ready
```

## Leanpub Configuration

### Option 1: Single Book (Recommended for Starting)

**Setup:**
- One Leanpub book
- Connected to `preview` branch
- Use "Preview" button for testing
- Use "Publish" button when ready for customers

**Workflow:**
1. Write on `preview` branch
2. Push changes
3. Click "Preview" in Leanpub (test build, not published)
4. When satisfied, click "Publish New Version" (live to customers)
5. Then merge `preview` → `main` for GitHub Pages

**Pros:**
- Simple setup
- One book to manage
- Clear preview vs. publish distinction

**Cons:**
- Must remember to merge to main for GitHub Pages updates

### Option 2: Two Books (Advanced)

**Setup:**
- **Book 1 (Draft):** Connected to `preview` branch
  - Name: "Maintainable Vibe Coding (Preview)"
  - For your testing only
  - Free or private link

- **Book 2 (Published):** Connected to `main` branch
  - Name: "Maintainable Vibe Coding"
  - Public, for sale
  - Only contains stable content

**Workflow:**
1. Write on `preview` branch
2. Generate previews on Draft book
3. When ready, merge `preview` → `main`
4. Publish new version on Published book

**Pros:**
- Clean separation of draft/published
- Can share draft link with beta readers
- Published book only gets stable content

**Cons:**
- Two Leanpub books to manage
- More complex setup

**My Recommendation:** Start with Option 1 (single book). Upgrade to Option 2 if you want beta readers.

## GitHub Pages Deployment

GitHub Pages automatically deploys from `main` branch via the workflow in `.github/workflows/deploy.yml`.

**Current setup:**
- MkDocs builds from `docs/` folder on `main` branch
- Deploys to: https://securityronin.github.io/maintainable-vibe-coding/

**To update GitHub Pages:**
1. Merge `preview` → `main`
2. Push to `main`
3. GitHub Actions automatically rebuilds and deploys

**Preview changes before publishing:**
- Work on `preview` branch (Pages NOT updated)
- Test Leanpub build
- Only merge to `main` when ready for public

## Branch Protection (Optional)

To prevent accidental pushes to `main`:

```bash
# Use GitHub CLI to set up protection
gh api repos/SecurityRonin/maintainable-vibe-coding/branches/main/protection \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
  --input - <<'EOF'
{
  "required_status_checks": null,
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "required_approving_review_count": 0
  },
  "restrictions": null
}
EOF
```

**What this does:**
- Requires pull request to merge to `main`
- Prevents direct pushes to `main`
- You can approve your own PRs (since you're solo)

**Benefits:**
- Forces review before publishing
- Clear record of what was published when
- Prevents accidents

## Typical Scenarios

### Scenario 1: Writing a New Chapter

```bash
# Start on preview
git checkout preview
git pull origin preview

# Write chapter
code manuscript/chapter06-supabase-setup.txt

# Add to Book.txt
echo "chapter06-supabase-setup.txt" >> manuscript/Book.txt

# Commit
git add manuscript/
git commit -m "feat: add Chapter 6 - Supabase setup"
git push origin preview

# Test in Leanpub
# Click "Preview" → Download PDF → Review

# Ready to publish?
git checkout main
git merge preview
git push origin main

# Publish on Leanpub
# Click "Publish New Version"
```

### Scenario 2: Fixing a Typo in Published Chapter

```bash
# Option A: Quick fix directly on main (for tiny changes)
git checkout main
git pull origin main

# Fix typo
code manuscript/chapter01-what-is-vibe-coding.txt

# Commit
git add manuscript/chapter01-what-is-vibe-coding.txt
git commit -m "fix: typo in Chapter 1"
git push origin main

# Sync preview with main
git checkout preview
git merge main
git push origin preview

# Publish on Leanpub

# Option B: Fix on preview first (for larger changes)
git checkout preview
# ... make changes, test, then merge to main
```

### Scenario 3: Major Restructuring

```bash
# Use feature branch for big changes
git checkout preview
git checkout -b refactor/reorganize-tutorial

# Make major changes
# Move chapters around, rename files, update Book.txt

# Commit frequently
git add manuscript/
git commit -m "wip: reorganizing tutorial structure"

# When ready, merge to preview
git checkout preview
git merge refactor/reorganize-tutorial

# Test thoroughly in Leanpub Preview

# If good, merge to main
git checkout main
git merge preview
git push origin main

# Clean up feature branch
git branch -d refactor/reorganize-tutorial
```

### Scenario 4: Beta Reader Feedback

```bash
# Work on preview based on feedback
git checkout preview

# Make improvements
code manuscript/chapter03-what-youll-build.txt

# Commit with context
git add manuscript/chapter03-what-youll-build.txt
git commit -m "improve: add code examples per beta feedback"
git push origin preview

# Generate new preview for beta readers
# Leanpub → Preview → Share link

# When satisfied, publish to main
git checkout main
git merge preview
git push origin main
```

## Version Control Best Practices

### Commit Messages

Use conventional commit format:

- `feat: add Chapter X`
- `fix: correct typo in Chapter Y`
- `improve: enhance code examples in Chapter Z`
- `refactor: reorganize tutorial structure`
- `docs: update publishing workflow`
- `wip: work in progress on Chapter X` (preview branch only)

### When to Commit

**On `preview` branch:**
- Commit often
- WIP commits are fine
- Experimental changes are fine
- Incomplete chapters are fine

**Before merging to `main`:**
- Clean up WIP commits (squash if needed)
- Ensure chapter is complete
- Proofread
- Test Leanpub build

### When to Push

**`preview` branch:**
- Push frequently (backup your work)
- Triggers nothing public
- Safe to push WIP

**`main` branch:**
- Push only when ready for public
- Triggers GitHub Pages deployment
- Triggers Leanpub publish (if you set it up)

## Syncing Branches

### Keep Preview Up-to-Date with Main

If you make hotfixes on `main`:

```bash
git checkout preview
git merge main
git push origin preview
```

### Keep Main Up-to-Date with Preview

When ready to publish:

```bash
git checkout main
git merge preview
git push origin main
```

**Use `--no-ff` for clear history:**

```bash
git merge --no-ff preview -m "Publish: Chapters 5-6 complete"
```

## Troubleshooting

### "Merge Conflict" Error

If you get conflicts when merging:

```bash
# During merge
git status  # shows conflicting files

# Edit files to resolve conflicts
code manuscript/chapter01-what-is-vibe-coding.txt

# Remove conflict markers:
# <<<<<<< HEAD
# =======
# >>>>>>> preview

# Stage resolved files
git add manuscript/chapter01-what-is-vibe-coding.txt

# Complete merge
git commit
```

### Accidentally Pushed to Wrong Branch

```bash
# If you meant to push to preview but pushed to main

# Revert main to previous commit
git checkout main
git reset --hard HEAD~1
git push --force origin main

# Push to correct branch
git checkout preview
git push origin preview
```

**⚠️ Warning:** Only use `--force` if you haven't published yet!

### Want to Undo Last Commit

```bash
# Keep changes, undo commit
git reset --soft HEAD~1

# Discard changes, undo commit
git reset --hard HEAD~1
```

## Summary

**Quick Reference:**

| Action | Branch | Command |
|--------|--------|---------|
| Write new chapter | `preview` | `git checkout preview` |
| Test with Leanpub | `preview` | Push → Leanpub "Preview" |
| Publish chapter | `main` | Merge preview → main |
| Fix published typo | `main` | Commit → push |
| Major refactor | Feature branch | Merge to `preview` → test → merge to `main` |

**Remember:**
- `preview` = work in progress, safe to experiment
- `main` = published, stable, public-facing
- Merge preview → main when ready to publish
- Test on preview before publishing to main

**Next Steps:**
1. Configure Leanpub to use `preview` branch
2. Set up branch protection (optional)
3. Start writing on `preview` branch
4. Merge to `main` when ready to publish

---

**Questions?** Open an issue: https://github.com/SecurityRonin/maintainable-vibe-coding/issues
