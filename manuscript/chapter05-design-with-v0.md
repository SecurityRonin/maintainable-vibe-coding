# Chapter 5: Phase 1 - Design with v0

Design first. Code second.

In this chapter, you'll learn how v0 generates production UI components from text descriptions.

## What is v0?

v0 (v0.dev) is an AI tool that generates Next.js components from text.

**You write:** "Create a login form with email and password"

**v0 generates in 20 seconds:**
- Complete Next.js/React component
- shadcn/ui components integrated
- Tailwind CSS styling
- TypeScript types
- Responsive design
- Accessible HTML
- Loading states

**Traditional approach:** 2-3 hours per component manually.

**v0 approach:** 5-10 minutes per component.

## Writing Good Prompts

The better your prompt, the better v0's output.

**Good prompt structure:**

```
Create [what you want] for [your app]

LAYOUT:
- [Section 1 details]
- [Section 2 details]

DESIGN:
- shadcn/ui components
- [Color scheme]
- [Style guidance]

FEATURES:
- [Feature 1]
- [Feature 2]
```

**Example for ReadStack auth pages:**

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
- Loading states for form submission

Style: Clean, minimal SaaS aesthetic
```

**Be specific:** Describe layout, colors, features, and interactive states.

**Be concise:** v0 works best with focused prompts, not novels.

## The v0 Workflow

### 1. Generate

1. Go to [v0.dev](https://v0.dev)
2. Click "New Design"
3. Paste your prompt
4. Click "Generate"
5. Wait 10-20 seconds

v0 shows:
- Visual preview
- Complete code
- Mobile view

### 2. Review

Check if it matches your vision:
- Layout correct?
- All elements present?
- Mobile view works?
- Colors and spacing good?

First generation is usually 90% correct.

### 3. Refine (Optional)

Click "Refine" and describe changes:

**Good refinements:**
- "Make the buttons 20% larger"
- "Use darker purple for primary color"
- "Add more spacing between cards"

**Bad refinements:**
- "Make it better" (too vague)
- "Change everything" (start over instead)

Usually need 0-2 refinements.

### 4. Export

When satisfied:
1. Click "Copy Code"
2. Paste into your project

v0 tells you exactly where to put files.

## What v0 Generates

Every export includes:
- Complete TypeScript component
- shadcn/ui base components (Button, Input, Card, etc.)
- Tailwind CSS classes
- Accessibility features (ARIA labels, keyboard navigation)
- Responsive breakpoints

**For ReadStack:** 4 designs (auth, dashboard, save dialog, article detail) = ~1,500 lines of production code.

**Time:** 20 minutes total.

## When to Use v0

**Use v0 for:**
✅ Page layouts
✅ Forms and dialogs
✅ Card grids
✅ Navigation menus
✅ Standard UI patterns

**Don't use v0 for:**
❌ Business logic (API calls, database queries)
❌ Complex interactions (drag-and-drop, canvas)
❌ Custom animations

v0 handles UI. You handle logic. Clear separation.

## v0 Best Practices

**1. Design in v0 before coding**
Start with v0, then add business logic.

**2. One component at a time**
Don't ask for "entire app." Generate one piece at a time.

**3. Be specific**
More details = better results.

**4. Export when "good enough"**
Don't chase pixel perfection. Export at 90%, tweak later if needed.

## Cost

**Free tier:** 200 credits/month (enough for ~20 designs)

**Each generation:** ~10 credits

**For ReadStack:** You'll use ~40 credits. Well within free tier.

## What You Learned

**v0 transforms design from bottleneck to accelerator**
Text → Production code in minutes.

**Good prompts = good results**
Be specific about layout, design, features.

**UI and logic are separate**
v0 handles UI. You handle business logic later.

**For ReadStack:** All UI generated in 20 minutes. That's design-first development.

## Next Steps

Chapter 6 teaches how Supabase provides your backend in 20 minutes.

v0 designs tell you what data you need. Supabase provides it.
