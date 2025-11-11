# Leanpub Setup Guide

This guide walks you through publishing your book on Leanpub.

## What Just Happened

Your book has been successfully migrated to Leanpub format:

✅ **Created `manuscript/` directory** with Leanpub structure
✅ **Migrated 4 introduction chapters** to Leanpub Flavoured Markdown
✅ **Created Book.txt** - Defines book structure and chapter order
✅ **Created Sample.txt** - Defines free preview (first 2 chapters)
✅ **Updated README.md** - Added Leanpub purchase info and instructions
✅ **Fixed all URLs** - Replaced placeholders with SecurityRonin username

## Manuscript Structure

```
manuscript/
├── Book.txt                              # Full book manifest
├── Sample.txt                            # Free preview manifest
├── frontmatter.txt                       # Frontmatter marker
├── introduction.txt                      # Book introduction
├── chapter01-what-is-vibe-coding.txt    # Chapter 1
├── chapter02-why-this-workflow.txt      # Chapter 2
├── chapter03-what-youll-build.txt       # Chapter 3
├── chapter04-prerequisites.txt          # Chapter 4
├── mainmatter.txt                        # Mainmatter marker
└── backmatter.txt                        # Backmatter marker

resources/
├── images/                               # Book images go here
└── videos/                               # Video files (if local)
```

## Next Steps: Publishing on Leanpub

### 1. Create Your Leanpub Book

1. Go to [leanpub.com](https://leanpub.com)
2. Sign up or log in
3. Click "Create a Book"
4. Choose **"GitHub"** as your writing mode

### 2. Connect to GitHub Repository

1. In Leanpub book settings, select **"GitHub"** writing mode
2. Authorize Leanpub to access your GitHub account
3. Select repository: `SecurityRonin/maintainable-vibe-coding`
4. Set branch: `main`
5. Leave folder as root (Leanpub auto-detects `manuscript/`)

### 3. Configure Book Settings

**Basic Info:**
- **Title:** Maintainable Vibe Coding
- **Subtitle:** Ship fast without breaking things
- **Author:** SecurityRonin
- **Book URL:** `maintainable-vibe-coding`

**Pricing:**
- **Minimum Price:** $9.99 (recommended starting point)
- **Suggested Price:** $19.99
- **Enable "Pay what you want":** Yes (lets readers choose)

**Categories:**
- Web Development
- Software Engineering
- Programming

**Description:**
```
A practical workflow tutorial teaching battle-tested best practices for
modern web development using v0, Supabase, GitHub, and Claude Code CLI
with superpowers.

This isn't a React tutorial. This is a workflow tutorial.

You'll learn the exact process to go from idea to production in days,
not weeks, without accumulating technical debt.
```

### 4. Generate Your First Preview

1. In your Leanpub book dashboard, click **"Preview"**
2. Leanpub will:
   - Clone your GitHub repo
   - Read `manuscript/Book.txt`
   - Convert chapters to PDF/EPUB/MOBI
   - Generate preview downloads

3. Download and review:
   - `book.pdf` - PDF version
   - `book.epub` - EPUB version
   - `book.mobi` - MOBI version (Kindle)
   - `sample.pdf` - Free sample (first 2 chapters)

### 5. Review Output

Check for:
- ✅ Chapter order correct
- ✅ Code blocks formatted properly
- ✅ Tables render correctly
- ✅ Line breaks and spacing look good
- ✅ Sample contains first 2 chapters only

### 6. Publish Your Book

Once preview looks good:

1. Click **"Publish New Version"**
2. Add release notes (optional)
3. Click "Publish"
4. Your book is now live at `leanpub.com/maintainable-vibe-coding`

## Leanpub Markdown Tips

### Code Blocks

Use `{lang=language}` before code blocks:

```
{lang=bash}
```
npm install
```
```

### Info Boxes

Leanpub uses special markers:

```
I> **Info Box**
I>
I> This is an information callout.

T> **Tip Box**
T>
T> This is a helpful tip.

W> **Warning Box**
W>
W> This is a warning.
```

### Images

Place images in `resources/images/`:

```
![Image caption](images/screenshot.png)
```

### Links

Standard markdown links work:

```
[Link text](https://example.com)
```

## Updating Your Book

### Adding New Chapters

1. Create new `.txt` file in `manuscript/`
   ```bash
   touch manuscript/chapter05-new-chapter.txt
   ```

2. Write content using Leanpub Markdown

3. Add to `Book.txt`:
   ```
   chapter05-new-chapter.txt
   ```

4. Commit and push:
   ```bash
   git add manuscript/
   git commit -m "Add Chapter 5"
   git push origin main
   ```

5. In Leanpub, click **"Preview"** to see changes
6. When ready, click **"Publish New Version"**

### Updating Existing Content

1. Edit the chapter file:
   ```bash
   # Edit in your favorite editor
   code manuscript/chapter01-what-is-vibe-coding.txt
   ```

2. Commit and push changes:
   ```bash
   git add manuscript/chapter01-what-is-vibe-coding.txt
   git commit -m "Update Chapter 1 introduction"
   git push origin main
   ```

3. Preview and publish on Leanpub

## Publishing Workflow

**Recommended workflow:**

1. **Draft mode:** Work on chapters, commit to GitHub
2. **Preview frequently:** Generate Leanpub preview to check formatting
3. **Publish milestones:**
   - After completing a major chapter
   - After fixing significant issues
   - Weekly or bi-weekly updates

**Version numbering:**
- 0.1 - First preview with intro chapters
- 0.5 - Half the book complete
- 1.0 - Full book complete
- 1.1, 1.2 - Updates and improvements

## Integrating with Kartra

Once your book is on Leanpub:

### Option 1: Sell on Leanpub (Easier)

- Use Leanpub's built-in sales platform
- 80% royalty to author
- Automatic delivery of updates to readers
- Handles payment processing, VAT, etc.

### Option 2: Sell on Kartra (More Control)

1. **Generate book files:**
   - Download PDF/EPUB/MOBI from Leanpub preview
   - Or use Leanpub API to auto-generate

2. **Upload to Kartra:**
   - Create product in Kartra
   - Upload PDF/EPUB/MOBI as downloadable files
   - Set your pricing

3. **Delivery:**
   - Kartra sends download links after purchase
   - You manually update files when you publish new versions

4. **Integration options:**
   - Leanpub → Webhook → Kartra (auto-add buyers to list)
   - Zapier integration for automation

### Option 3: Hybrid Approach

- Sell on Leanpub for direct sales
- Also sell on Kartra as part of a bundle
- Use Kartra for courses/coaching + book package
- Leanpub handles book-only sales

## Marketing Your Book

### Free Sample Strategy

Your `Sample.txt` includes:
- Introduction
- Chapter 1: What is Vibe Coding
- Chapter 2: Why This Workflow

This gives readers enough to understand the value while leaving:
- Chapter 3: What You'll Build (teaser for tutorial)
- Chapter 4: Prerequisites (practical setup)
- All tutorial content (the meat of the book)

### Landing Page

Free web version on GitHub Pages:
- https://securityronin.github.io/maintainable-vibe-coding/
- Shows introduction chapters
- Links to Leanpub for full book
- Great for SEO and discovery

### Pricing Strategy

**Leanpub "Pay What You Want":**
- Minimum: $9.99
- Suggested: $19.99
- Readers can pay more if they find value

**Volume Discounts:**
- Leanpub supports team purchases
- Bulk pricing for companies

## Royalties and Pricing

**Leanpub:**
- 80% royalty (minus payment processing)
- No upfront cost
- Automatic payment monthly (via PayPal/Wise)

**Kartra:**
- You keep all revenue (minus Kartra fees)
- More control over pricing and bundles
- More work for delivery and updates

## Support and Resources

**Leanpub Docs:**
- [Leanpub Manual](https://leanpub.com/manual/read)
- [Leanpub Flavoured Markdown](https://leanpub.com/lfm/read)
- [Markua Manual](https://leanpub.com/markua/read) (newer format)

**Community:**
- [Leanpub Authors Forum](https://community.leanpub.com/)
- [Leanpub Help Center](https://help.leanpub.com/)

## Troubleshooting

### Build Fails

1. Check Leanpub build log for errors
2. Common issues:
   - Malformed markdown
   - Missing files referenced in Book.txt
   - Images not in resources/images/

### Code Blocks Not Rendering

Ensure you use `{lang=language}` syntax:
```
{lang=bash}
```
code here
```
```

### Sample Not Updating

1. Check Sample.txt lists correct files
2. Ensure you published a new version (not just preview)

### Images Not Showing

1. Images must be in `resources/images/`
2. Reference as: `![caption](images/filename.png)`
3. Not: `![caption](../assets/images/filename.png)`

## Next Steps

1. ☐ Create Leanpub account
2. ☐ Create book and connect to GitHub
3. ☐ Generate first preview
4. ☐ Review PDF/EPUB/MOBI output
5. ☐ Publish first version (0.1)
6. ☐ Continue writing remaining chapters
7. ☐ Update MkDocs web version in parallel
8. ☐ Set up Kartra integration (optional)

## Questions?

Open an issue: https://github.com/SecurityRonin/maintainable-vibe-coding/issues

---

**Your book is ready to publish! 🚀**
