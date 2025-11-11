# Quick Reference: Publishing Workflow

## Branch Cheat Sheet

```bash
# Start writing
git checkout preview
git pull origin preview

# Make changes
code manuscript/chapter-XX.txt

# Commit and push (backup + Leanpub can preview)
git add manuscript/
git commit -m "wip: working on chapter XX"
git push origin preview

# Test in Leanpub
# Go to Leanpub → Click "Preview" → Download PDF

# Ready to publish?
git checkout main
git merge preview
git push origin main

# Then publish on Leanpub
# Go to Leanpub → Click "Publish New Version"
```

## Two Branches

| Branch | Purpose | Who Sees It |
|--------|---------|-------------|
| `preview` | Draft, WIP, testing | You only (via Leanpub Preview) |
| `main` | Published, stable | Everyone (GitHub Pages + published Leanpub) |

## Common Tasks

### Write New Chapter

```bash
git checkout preview
code manuscript/chapter-new.txt
echo "chapter-new.txt" >> manuscript/Book.txt
git add manuscript/
git commit -m "feat: add new chapter"
git push origin preview
```

### Fix Typo in Published Chapter

```bash
# Quick fix on main
git checkout main
code manuscript/chapter-01.txt
git add manuscript/chapter-01.txt
git commit -m "fix: typo in chapter 1"
git push origin main

# Sync preview
git checkout preview
git merge main
git push origin preview
```

### Publish Preview to Main

```bash
git checkout main
git merge preview
git push origin main
```

## Leanpub Setup

**Single Book (Recommended):**
1. Create book on Leanpub
2. Connect to GitHub: `SecurityRonin/maintainable-vibe-coding`
3. Set branch: `preview`
4. Use "Preview" button to test
5. Use "Publish" button when ready
6. Merge to `main` for GitHub Pages

**Two Books (Advanced):**
- Book 1: Connected to `preview` (draft/testing)
- Book 2: Connected to `main` (published)

## Key Rules

✅ **DO:**
- Work on `preview` branch
- Test with Leanpub Preview before publishing
- Merge to `main` only when ready for public
- Commit often on `preview`

❌ **DON'T:**
- Push WIP directly to `main`
- Forget to merge `preview` → `main` after publishing on Leanpub
- Force push to `main` (unless you really need to)

## Files to Know

- `manuscript/Book.txt` - Defines chapter order
- `manuscript/Sample.txt` - Defines free preview
- `LEANPUB-SETUP.md` - Full Leanpub setup guide
- `PUBLISHING-WORKFLOW.md` - Detailed workflow documentation
- `CONTRIBUTING.md` - Contribution guidelines

## Help

- **Detailed workflow:** See [PUBLISHING-WORKFLOW.md](../PUBLISHING-WORKFLOW.md)
- **Leanpub setup:** See [LEANPUB-SETUP.md](../LEANPUB-SETUP.md)
- **Questions:** Open issue on GitHub
