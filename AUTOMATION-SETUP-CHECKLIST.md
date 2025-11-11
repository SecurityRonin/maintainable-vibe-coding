# ✅ Automation Setup Checklist

Your automated publishing workflows are installed! Follow this checklist to activate them.

## 📋 Setup Steps

### ☐ Step 1: Create Leanpub Book (15 minutes)

1. Go to [leanpub.com](https://leanpub.com) and create account
2. Click "Create a Book"
3. Choose **GitHub** as writing mode
4. Connect to repository: `SecurityRonin/maintainable-vibe-coding`
5. Set branch: `preview`
6. Configure book settings:
   - Title: Maintainable Vibe Coding
   - Minimum price: $9.99
   - Suggested price: $19.99

**📚 Guide:** See [LEANPUB-SETUP.md](LEANPUB-SETUP.md)

### ☐ Step 2: Get Leanpub API Key (2 minutes)

1. Go to [leanpub.com/author_dashboard/api](https://leanpub.com/author_dashboard/api)
2. Click "Generate New API Key"
3. **Copy the key** (shown only once!)
4. Save it somewhere safe temporarily

### ☐ Step 3: Add API Key to GitHub (2 minutes)

1. Go to [Repository Settings → Secrets](https://github.com/SecurityRonin/maintainable-vibe-coding/settings/secrets/actions)
2. Click "New repository secret"
3. Name: `LEANPUB_API_KEY`
4. Value: Paste your API key
5. Click "Add secret"

### ☐ Step 4: Test Auto-Preview (5 minutes)

```bash
# Make a test change
git checkout preview
git pull origin preview

# Create test file
echo "# Test Automation" >> manuscript/test-automation.txt

# Commit and push
git add manuscript/test-automation.txt
git commit -m "test: verify auto-preview workflow"
git push origin preview
```

**Check results:**
1. Go to [GitHub Actions](https://github.com/SecurityRonin/maintainable-vibe-coding/actions)
2. See "Leanpub Auto-Preview" workflow running
3. Check your commit for automated comment
4. Wait for email from Leanpub (2-5 minutes)

**Success looks like:**
- ✅ Workflow shows green checkmark
- ✅ Commit has comment: "📚 Leanpub Preview Build Triggered"
- ✅ Email from Leanpub with preview download link

**If it fails:**
- ❌ Red X on workflow
- ❌ Comment says "Failed to trigger"
- **Fix:** Check API key in Step 3

### ☐ Step 5: Clean Up Test (1 minute)

```bash
# Remove test file
git rm manuscript/test-automation.txt
git commit -m "chore: remove automation test file"
git push origin preview
```

## 🎉 You're Done!

Your workflows are now active:

### Auto-Preview (preview branch)
```bash
git checkout preview
# ... make changes to manuscript/ ...
git push origin preview
# → Leanpub automatically builds preview
# → You get email when ready
```

### Auto-Publish (main branch)
```bash
git checkout main
git merge preview
git push origin main
# → Leanpub automatically publishes
# → Customers get update notification
```

## 📖 What to Read Next

- **Daily workflow:** [PUBLISHING-WORKFLOW.md](PUBLISHING-WORKFLOW.md)
- **Automation details:** [.github/AUTOMATION-GUIDE.md](.github/AUTOMATION-GUIDE.md)
- **Quick commands:** [.github/QUICK-REFERENCE.md](.github/QUICK-REFERENCE.md)
- **Leanpub setup:** [LEANPUB-SETUP.md](LEANPUB-SETUP.md)

## 🚀 Start Writing!

Your publishing system is ready. Time to focus on content:

```bash
# Start your next chapter
git checkout preview
code manuscript/chapter05-design-with-v0.txt

# The automation handles the rest!
```

---

**Questions?** Open an issue: https://github.com/SecurityRonin/maintainable-vibe-coding/issues

**Problems?** See troubleshooting in [AUTOMATION-GUIDE.md](.github/AUTOMATION-GUIDE.md)
