# Chapter 13: Designing UI with v0

Generate UI components with AI.

**Time:** 20 minutes

**What you'll get:** 4 production-ready components.

## The Four Components

1. Authentication pages
2. Dashboard
3. Save URL dialog
4. Article detail page

3-5 minutes each.

## Component 1: Authentication Pages

**1. Go to [v0.dev](https://v0.dev)**

**2. Click "New"**

**3. Paste this prompt:**

```
Create modern authentication pages for ReadStack, a URL manager app.

PAGES NEEDED:
- Login page with email/password
- Signup page with email, password, confirm password
- Password reset page

DESIGN:
- shadcn/ui components
- Purple/indigo primary color
- Clean, minimal style
- Mobile responsive
- Form validation errors inline
- Loading states for buttons

Style: Clean SaaS aesthetic
```

**4. Click "Generate"** → Wait 10-20 seconds

**5. Review:** Check mobile view (phone icon)

**6. Refine if needed:** Click "Refine" and request changes

**7. Export:** Click "Copy Code" → Save locally

## Component 2: Dashboard

**Prompt:**

```
Create a dashboard for ReadStack URL manager.

LAYOUT:
- Header with "ReadStack" logo and "Save URL" button
- Three tabs: To Read, Reading, Archived
- Stats cards showing article counts
- Article grid (2-3 columns on desktop, 1 on mobile)

ARTICLE CARDS:
- Preview image (gradient fallback if no image)
- Title (bold, 2 lines max)
- Description (gray, 3 lines max)
- Tags as small badges
- Status indicator
- Hover: show edit/delete buttons

DESIGN:
- shadcn/ui components
- Purple/indigo theme
- Clean, spacious layout
- Mobile responsive
```

Generate → Review → Export

## Component 3: Save URL Dialog

**Prompt:**

```
Create a "Save URL" dialog modal for ReadStack.

CONTENTS:
- URL input field (autofocus)
- Title field (filled automatically from metadata)
- Description field (filled automatically)
- Tags input (comma-separated)
- Save and Cancel buttons

BEHAVIOR:
- Shows loading state while fetching metadata
- Validation errors inline
- Saves on Enter key

DESIGN:
- shadcn/ui Dialog component
- Purple primary button
- Mobile: full screen
- Desktop: centered modal
```

Generate → Review → Export

## Component 4: Article Detail Page

**Prompt:**

```
Create an article detail page for ReadStack.

LAYOUT:
- Large preview image at top
- Article title (editable inline)
- Article URL (clickable link)
- Status dropdown (To Read, Reading, Archived)
- Rating (1-5 stars, clickable)
- Tags (add/remove chips)
- Notes textarea (auto-save)
- Delete button (bottom, red, with confirmation)

DESIGN:
- shadcn/ui components
- Purple accents
- Inline editing (click to edit)
- Mobile responsive
- Back button to dashboard
```

Generate → Review → Export

## What You Have

After 20 minutes:
- 4 complete UI components
- ~1,500 lines of code
- TypeScript + Tailwind CSS
- Mobile responsive
- Accessible

All generated. Zero manual coding.

## Save Your Components

Create `components/` directory and save each v0 export.

You'll integrate them in Chapter 15.

## Next

Chapter 14 - Setting Up Supabase (20 min)

Create database and auth backend.
