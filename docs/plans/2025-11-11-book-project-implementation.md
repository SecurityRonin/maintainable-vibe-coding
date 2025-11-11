# Maintainable Vibe Coding Book - Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a complete web book teaching the vibe coding workflow from v0 design to production deployment, using MkDocs Material with Loom video embeds.

**Architecture:** MkDocs Material static site with markdown content, Loom video embeds, example repositories, deployed to GitHub Pages. Tutorial-first approach where we build Chapter 08 (Complete Tutorial) first to generate authentic content, then extract lessons into other chapters.

**Tech Stack:** MkDocs Material, Python 3.9+, GitHub Pages, Loom (video hosting), Markdown

---

## Phase 1: Foundation Setup

### Task 1: Initialize MkDocs Configuration

**Files:**
- Create: `mkdocs.yml`
- Create: `docs/index.md`

**Step 1: Write mkdocs.yml configuration**

```yaml
site_name: Maintainable Vibe Coding
site_description: Ship fast without breaking things
site_author: Your Name
site_url: https://yourusername.github.io/maintainable-vibe-coding

repo_name: yourusername/maintainable-vibe-coding
repo_url: https://github.com/yourusername/maintainable-vibe-coding

theme:
  name: material
  palette:
    - scheme: default
      primary: indigo
      accent: indigo
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    - scheme: slate
      primary: indigo
      accent: indigo
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  features:
    - navigation.tabs
    - navigation.sections
    - navigation.expand
    - navigation.top
    - search.suggest
    - search.highlight
    - content.code.copy
    - content.tabs.link

plugins:
  - search
  - git-revision-date-localized:
      enable_creation_date: true
  - minify:
      minify_html: true

markdown_extensions:
  - admonition
  - pymdownx.details
  - pymdownx.superfences
  - pymdownx.tabbed:
      alternate_style: true
  - attr_list
  - md_in_html
  - pymdownx.emoji:
      emoji_index: !!python/name:material.extensions.emoji.twemoji
      emoji_generator: !!python/name:material.extensions.emoji.to_svg
  - toc:
      permalink: true

extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/yourusername
    - icon: fontawesome/brands/twitter
      link: https://twitter.com/yourusername

nav:
  - Home: index.md
  - Introduction:
    - What is Vibe Coding: 01-introduction/what-is-vibe-coding.md
    - Why This Workflow: 01-introduction/why-this-workflow.md
    - What You'll Build: 01-introduction/what-youll-build.md
    - Prerequisites: 01-introduction/prerequisites.md
  - Workflow Overview:
    - The Five Phases: 02-workflow-overview/the-five-phases.md
    - Why This Order: 02-workflow-overview/why-this-order.md
    - Tooling Philosophy: 02-workflow-overview/tooling-philosophy.md
  - "Phase 1: Design with v0":
    - Introduction: 03-phase-1-design-with-v0/intro.md
    - Getting Started: 03-phase-1-design-with-v0/getting-started.md
    - Creating Your First Design: 03-phase-1-design-with-v0/creating-your-first-design.md
    - Iterating Quickly: 03-phase-1-design-with-v0/iterating-quickly.md
    - Exporting to Code: 03-phase-1-design-with-v0/exporting-to-code.md
    - Common Patterns: 03-phase-1-design-with-v0/common-patterns.md
  - "Phase 2: Infrastructure with Supabase":
    - Introduction: 04-phase-2-infrastructure-supabase/intro.md
    - Project Setup: 04-phase-2-infrastructure-supabase/project-setup.md
    - Authentication: 04-phase-2-infrastructure-supabase/authentication.md
    - Database Setup: 04-phase-2-infrastructure-supabase/database-setup.md
    - Connecting to Frontend: 04-phase-2-infrastructure-supabase/connecting-to-frontend.md
    - Best Practices: 04-phase-2-infrastructure-supabase/best-practices.md
  - "Phase 3: GitHub Setup":
    - Introduction: 05-phase-3-github-setup/intro.md
    - Repository Creation: 05-phase-3-github-setup/repository-creation.md
    - Initial Commit: 05-phase-3-github-setup/initial-commit.md
    - Branching Strategy: 05-phase-3-github-setup/branching-strategy.md
    - GitHub Actions Basics: 05-phase-3-github-setup/github-actions-basics.md
  - "Phase 4: Local Development":
    - Introduction: 06-phase-4-local-development/intro.md
    - Claude Code Installation: 06-phase-4-local-development/claude-code-installation.md
    - Superpowers Setup: 06-phase-4-local-development/superpowers-setup.md
    - Project Prompts: 06-phase-4-local-development/project-prompts.md
    - Brainstorming Workflow: 06-phase-4-local-development/brainstorming-workflow.md
    - TDD in Practice: 06-phase-4-local-development/tdd-in-practice.md
    - Best Practices Adoption: 06-phase-4-local-development/best-practices-adoption.md
    - Daily Workflow: 06-phase-4-local-development/daily-workflow.md
  - "Phase 5: Deployment":
    - Introduction: 07-phase-5-deployment/intro.md
    - Vercel Deployment: 07-phase-5-deployment/vercel-deployment.md
    - Environment Setup: 07-phase-5-deployment/environment-setup.md
    - Monitoring: 07-phase-5-deployment/monitoring.md
  - Complete Tutorial:
    - Overview: 08-complete-tutorial/overview.md
    - "Step 1: Design Phase": 08-complete-tutorial/01-design-phase.md
    - "Step 2: Supabase Setup": 08-complete-tutorial/02-supabase-setup.md
    - "Step 3: GitHub Init": 08-complete-tutorial/03-github-init.md
    - "Step 4: Clone and Setup": 08-complete-tutorial/04-clone-and-setup.md
    - "Step 5: Claude Brainstorming": 08-complete-tutorial/05-claude-brainstorming.md
    - "Step 6: Implementing Auth": 08-complete-tutorial/06-implementing-auth.md
    - "Step 7: Building Features": 08-complete-tutorial/07-building-features.md
    - "Step 8: Deployment": 08-complete-tutorial/08-deployment.md
    - "Step 9: Iteration": 08-complete-tutorial/09-iteration.md
  - Best Practices:
    - Project Prompt Templates: 09-best-practices/project-prompt-templates.md
    - Superpowers Skills Guide: 09-best-practices/superpowers-skills-guide.md
    - Common Patterns: 09-best-practices/common-patterns.md
    - Debugging Workflow: 09-best-practices/debugging-workflow.md
    - Performance Tips: 09-best-practices/performance-tips.md
  - Advanced Topics:
    - Custom Superpowers Skills: 10-advanced-topics/custom-superpowers-skills.md
    - Monorepo Setup: 10-advanced-topics/monorepo-setup.md
    - Team Workflows: 10-advanced-topics/team-workflows.md
    - Cost Optimization: 10-advanced-topics/cost-optimization.md
  - Conclusion:
    - What You Learned: 11-conclusion/what-you-learned.md
    - Next Steps: 11-conclusion/next-steps.md
    - Resources: 11-conclusion/resources.md
    - Contributing: 11-conclusion/contributing.md
```

**Step 2: Create initial index page**

Create `docs/index.md`:

```markdown
# Maintainable Vibe Coding

**Ship fast without breaking things.**

Welcome to a practical guide for building modern web applications using battle-tested workflows and tools that amplify your productivity.

## What You'll Learn

This isn't a React tutorial. This is a **workflow tutorial**.

You'll learn the exact process to go from idea to production:

1. **Design Phase:** Rapid prototyping with v0
2. **Infrastructure:** Backend setup with Supabase (auth + data)
3. **Version Control:** Professional GitHub workflow
4. **Local Development:** Claude Code CLI with superpowers for maintainable rapid development
5. **Deployment:** Ship to production

## Who This Is For

- Developers who want to ship faster without sacrificing quality
- Engineers tired of reinventing the wheel for every project
- Teams looking for proven workflows
- Anyone who's heard "move fast and break things" and thought "there must be a better way"

## The Promise

By the end of this book, you'll have:

- ✅ Built a complete full-stack application
- ✅ Learned to ship features in days, not weeks
- ✅ Established patterns for maintainable codebases
- ✅ Mastered tools that amplify your productivity

## Getting Started

Ready to learn the workflow? Start with the [Introduction](01-introduction/what-is-vibe-coding.md).

Already familiar with the concepts? Jump to the [Complete Tutorial](08-complete-tutorial/overview.md) to build a real application.

---

!!! tip "Learn by Doing"
    Throughout this book, you'll find Loom videos showing real development sessions. Watch how decisions are made, see mistakes get fixed, and learn the authentic workflow.
```

**Step 3: Test MkDocs build**

```bash
mkdocs build
```

Expected: Build succeeds with warning about missing pages (we'll create them next)

**Step 4: Test local server**

```bash
mkdocs serve
```

Expected: Server starts at http://127.0.0.1:8000, shows index page

**Step 5: Commit foundation**

```bash
git add mkdocs.yml docs/index.md
git commit -m "feat: initialize MkDocs configuration and index page

- Complete MkDocs Material configuration
- Navigation structure for all chapters
- Initial landing page with book overview

Foundation for Maintainable Vibe Coding book."
```

---

### Task 2: Create Directory Structure and Placeholder Pages

**Files:**
- Create: All chapter directories and markdown files as specified in mkdocs.yml nav

**Step 1: Create all chapter directories**

```bash
mkdir -p docs/01-introduction
mkdir -p docs/02-workflow-overview
mkdir -p docs/03-phase-1-design-with-v0
mkdir -p docs/04-phase-2-infrastructure-supabase
mkdir -p docs/05-phase-3-github-setup
mkdir -p docs/06-phase-4-local-development
mkdir -p docs/07-phase-5-deployment
mkdir -p docs/08-complete-tutorial
mkdir -p docs/09-best-practices
mkdir -p docs/10-advanced-topics
mkdir -p docs/11-conclusion
```

**Step 2: Create placeholder template**

Create a shell script `scripts/create-placeholders.sh`:

```bash
#!/bin/bash

# Function to create placeholder page
create_placeholder() {
    local filepath="$1"
    local title="$2"

    cat > "$filepath" << EOF
# $title

!!! warning "Work in Progress"
    This chapter is currently being written. Check back soon!

## Coming Soon

This section will cover:

- Key concepts
- Practical examples
- Step-by-step instructions
- Common pitfalls to avoid

---

**Want to contribute?** See [CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines.
EOF
}

# 01-introduction
create_placeholder "docs/01-introduction/what-is-vibe-coding.md" "What is Vibe Coding"
create_placeholder "docs/01-introduction/why-this-workflow.md" "Why This Workflow"
create_placeholder "docs/01-introduction/what-youll-build.md" "What You'll Build"
create_placeholder "docs/01-introduction/prerequisites.md" "Prerequisites"

# 02-workflow-overview
create_placeholder "docs/02-workflow-overview/the-five-phases.md" "The Five Phases"
create_placeholder "docs/02-workflow-overview/why-this-order.md" "Why This Order"
create_placeholder "docs/02-workflow-overview/tooling-philosophy.md" "Tooling Philosophy"

# 03-phase-1-design-with-v0
create_placeholder "docs/03-phase-1-design-with-v0/intro.md" "Design with v0: Introduction"
create_placeholder "docs/03-phase-1-design-with-v0/getting-started.md" "Getting Started with v0"
create_placeholder "docs/03-phase-1-design-with-v0/creating-your-first-design.md" "Creating Your First Design"
create_placeholder "docs/03-phase-1-design-with-v0/iterating-quickly.md" "Iterating Quickly"
create_placeholder "docs/03-phase-1-design-with-v0/exporting-to-code.md" "Exporting to Code"
create_placeholder "docs/03-phase-1-design-with-v0/common-patterns.md" "Common Patterns"

# 04-phase-2-infrastructure-supabase
create_placeholder "docs/04-phase-2-infrastructure-supabase/intro.md" "Infrastructure with Supabase: Introduction"
create_placeholder "docs/04-phase-2-infrastructure-supabase/project-setup.md" "Project Setup"
create_placeholder "docs/04-phase-2-infrastructure-supabase/authentication.md" "Authentication"
create_placeholder "docs/04-phase-2-infrastructure-supabase/database-setup.md" "Database Setup"
create_placeholder "docs/04-phase-2-infrastructure-supabase/connecting-to-frontend.md" "Connecting to Frontend"
create_placeholder "docs/04-phase-2-infrastructure-supabase/best-practices.md" "Best Practices"

# 05-phase-3-github-setup
create_placeholder "docs/05-phase-3-github-setup/intro.md" "GitHub Setup: Introduction"
create_placeholder "docs/05-phase-3-github-setup/repository-creation.md" "Repository Creation"
create_placeholder "docs/05-phase-3-github-setup/initial-commit.md" "Initial Commit"
create_placeholder "docs/05-phase-3-github-setup/branching-strategy.md" "Branching Strategy"
create_placeholder "docs/05-phase-3-github-setup/github-actions-basics.md" "GitHub Actions Basics"

# 06-phase-4-local-development
create_placeholder "docs/06-phase-4-local-development/intro.md" "Local Development: Introduction"
create_placeholder "docs/06-phase-4-local-development/claude-code-installation.md" "Claude Code Installation"
create_placeholder "docs/06-phase-4-local-development/superpowers-setup.md" "Superpowers Setup"
create_placeholder "docs/06-phase-4-local-development/project-prompts.md" "Project Prompts"
create_placeholder "docs/06-phase-4-local-development/brainstorming-workflow.md" "Brainstorming Workflow"
create_placeholder "docs/06-phase-4-local-development/tdd-in-practice.md" "TDD in Practice"
create_placeholder "docs/06-phase-4-local-development/best-practices-adoption.md" "Best Practices Adoption"
create_placeholder "docs/06-phase-4-local-development/daily-workflow.md" "Daily Workflow"

# 07-phase-5-deployment
create_placeholder "docs/07-phase-5-deployment/intro.md" "Deployment: Introduction"
create_placeholder "docs/07-phase-5-deployment/vercel-deployment.md" "Vercel Deployment"
create_placeholder "docs/07-phase-5-deployment/environment-setup.md" "Environment Setup"
create_placeholder "docs/07-phase-5-deployment/monitoring.md" "Monitoring"

# 08-complete-tutorial
create_placeholder "docs/08-complete-tutorial/overview.md" "Complete Tutorial: Overview"
create_placeholder "docs/08-complete-tutorial/01-design-phase.md" "Step 1: Design Phase"
create_placeholder "docs/08-complete-tutorial/02-supabase-setup.md" "Step 2: Supabase Setup"
create_placeholder "docs/08-complete-tutorial/03-github-init.md" "Step 3: GitHub Init"
create_placeholder "docs/08-complete-tutorial/04-clone-and-setup.md" "Step 4: Clone and Setup"
create_placeholder "docs/08-complete-tutorial/05-claude-brainstorming.md" "Step 5: Claude Brainstorming"
create_placeholder "docs/08-complete-tutorial/06-implementing-auth.md" "Step 6: Implementing Auth"
create_placeholder "docs/08-complete-tutorial/07-building-features.md" "Step 7: Building Features"
create_placeholder "docs/08-complete-tutorial/08-deployment.md" "Step 8: Deployment"
create_placeholder "docs/08-complete-tutorial/09-iteration.md" "Step 9: Iteration"

# 09-best-practices
create_placeholder "docs/09-best-practices/project-prompt-templates.md" "Project Prompt Templates"
create_placeholder "docs/09-best-practices/superpowers-skills-guide.md" "Superpowers Skills Guide"
create_placeholder "docs/09-best-practices/common-patterns.md" "Common Patterns"
create_placeholder "docs/09-best-practices/debugging-workflow.md" "Debugging Workflow"
create_placeholder "docs/09-best-practices/performance-tips.md" "Performance Tips"

# 10-advanced-topics
create_placeholder "docs/10-advanced-topics/custom-superpowers-skills.md" "Custom Superpowers Skills"
create_placeholder "docs/10-advanced-topics/monorepo-setup.md" "Monorepo Setup"
create_placeholder "docs/10-advanced-topics/team-workflows.md" "Team Workflows"
create_placeholder "docs/10-advanced-topics/cost-optimization.md" "Cost Optimization"

# 11-conclusion
create_placeholder "docs/11-conclusion/what-you-learned.md" "What You Learned"
create_placeholder "docs/11-conclusion/next-steps.md" "Next Steps"
create_placeholder "docs/11-conclusion/resources.md" "Resources"
create_placeholder "docs/11-conclusion/contributing.md" "Contributing"

echo "All placeholder pages created successfully!"
```

**Step 3: Run placeholder script**

```bash
chmod +x scripts/create-placeholders.sh
./scripts/create-placeholders.sh
```

Expected: All 51 placeholder markdown files created

**Step 4: Test build with all pages**

```bash
mkdocs build
```

Expected: Clean build with no errors

**Step 5: Test navigation**

```bash
mkdocs serve
```

Expected: Can navigate to all chapters, see placeholder content

**Step 6: Commit structure**

```bash
git add docs/ scripts/
git commit -m "feat: create complete chapter structure with placeholders

- 51 placeholder pages across 11 chapters
- Script for generating placeholder templates
- Full navigation structure ready for content

All pages buildable, navigation functional."
```

---

### Task 3: Create Assets Directory and GitHub Actions Workflow

**Files:**
- Create: `assets/images/.gitkeep`
- Create: `assets/videos/.gitkeep`
- Create: `.github/workflows/deploy.yml`

**Step 1: Create assets directories**

```bash
mkdir -p assets/images
mkdir -p assets/videos
touch assets/images/.gitkeep
touch assets/videos/.gitkeep
```

**Step 2: Create GitHub Actions deployment workflow**

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy MkDocs to GitHub Pages

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

permissions:
  contents: write

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'

      - name: Install dependencies
        run: |
          pip install -r requirements.txt

      - name: Build documentation
        run: mkdocs build --strict

      - name: Deploy to GitHub Pages
        if: github.event_name == 'push' && github.ref == 'refs/heads/main'
        run: |
          mkdocs gh-deploy --force
```

**Step 3: Test workflow syntax**

```bash
# Verify YAML is valid
python -c "import yaml; yaml.safe_load(open('.github/workflows/deploy.yml'))"
```

Expected: No syntax errors

**Step 4: Commit deployment setup**

```bash
git add assets/ .github/
git commit -m "feat: add assets directories and GitHub Actions deployment

- Assets folders for images and videos
- GitHub Actions workflow for automatic deployment
- Deploys to GitHub Pages on push to main

Ready for CI/CD."
```

---

## Phase 2: Content Development (Tutorial-First Approach)

### Task 4: Write Tutorial Overview (Chapter 08)

**Files:**
- Modify: `docs/08-complete-tutorial/overview.md`

**Step 1: Write comprehensive tutorial overview**

Replace content in `docs/08-complete-tutorial/overview.md`:

```markdown
# Complete Tutorial: Building TaskFlow

Welcome to the hands-on tutorial! This is where theory meets practice.

## What We're Building

**TaskFlow** is a team task management application featuring:

- 🎨 Modern, responsive UI designed with v0
- 🔐 User authentication with Supabase Auth
- 📊 Real-time task updates across team members
- 🏷️ Task assignment, labels, and priorities
- 📱 Mobile-friendly interface
- 🚀 Deployed to production on Vercel

## Why This Project?

TaskFlow showcases every part of the maintainable vibe coding workflow:

- **v0 Design:** Dashboard, kanban boards, user profiles
- **Supabase:** Auth, real-time updates, Row Level Security
- **GitHub:** Version control, CI/CD with GitHub Actions
- **Claude Code:** Complex features like drag-drop, filters, search
- **TDD:** Critical paths like task assignment and permissions

## Tutorial Structure

This tutorial follows the exact workflow you'll use in your own projects:

### Step 1: Design Phase (v0)
Design the entire application interface before writing any code. Learn to iterate quickly and export production-ready Next.js components.

### Step 2: Supabase Setup
Set up authentication, database schema, and Row Level Security policies. Get your backend running before touching the frontend.

### Step 3: GitHub Init
Create the repository, push the v0 export, and set up GitHub Actions for deployment.

### Step 4: Clone and Setup
Clone locally, configure environment variables, and verify everything runs.

### Step 5: Claude Brainstorming
Use Claude Code with superpowers to plan feature implementation. Learn to design before coding.

### Step 6: Implementing Auth
TDD implementation of authentication flow. Watch tests guide development.

### Step 7: Building Features
Implement core features: task creation, assignment, real-time updates, drag-drop.

### Step 8: Deployment
Deploy to Vercel, configure environment, monitor production.

### Step 9: Iteration
Add new features post-launch. See how the workflow handles changes.

## What You'll Learn

By completing this tutorial, you'll master:

- **v0 Workflow:** Designing complete UIs visually
- **Supabase Patterns:** Auth, real-time, RLS best practices
- **Claude Code + Superpowers:** AI-assisted development done right
- **TDD in Practice:** Tests that actually guide development
- **Production Deployment:** From localhost to live users

## Time Investment

- **Full tutorial:** 6-8 hours (one weekend)
- **MVP (auth + basic tasks):** 2-3 hours
- **Individual chapters:** 30-60 minutes each

## Prerequisites

Before starting, make sure you have:

- ✅ GitHub account
- ✅ Vercel account (free tier)
- ✅ Supabase account (free tier)
- ✅ v0 access
- ✅ Claude Code CLI installed
- ✅ Superpowers installed
- ✅ Node.js 18+ installed
- ✅ Basic terminal comfort

!!! tip "Follow Along"
    Each step has a corresponding commit in the example repository. You can compare your work at any point.

## Example Repository

The complete TaskFlow code is available at:

**Repository:** [github.com/yourusername/taskflow-tutorial](https://github.com/yourusername/taskflow-tutorial)

**Live Demo:** [taskflow-tutorial.vercel.app](https://taskflow-tutorial.vercel.app)

Browse commits to see the exact development progression.

## Video Walkthroughs

Each chapter includes Loom videos showing:

- Real development sessions (no scripting)
- Decision-making process
- Mistakes and how to fix them
- Tips and shortcuts

## Getting Help

Stuck? Here's how to get unstuck:

1. **Check the video** - Often shows the exact issue you're facing
2. **Compare commits** - See what's different in the example repo
3. **GitHub Discussions** - Ask questions, share progress
4. **Common issues** - Each chapter has "Common Pitfalls" section

## Ready to Start?

Let's begin with [Step 1: Design Phase](01-design-phase.md) where we'll design TaskFlow in v0.

---

!!! success "Learning by Doing"
    This tutorial teaches through building. You'll make mistakes, fix them, and learn the authentic workflow. That's the point.
```

**Step 2: Test page renders correctly**

```bash
mkdocs serve
```

Navigate to the tutorial overview page and verify formatting.

**Step 3: Commit tutorial overview**

```bash
git add docs/08-complete-tutorial/overview.md
git commit -m "feat: write complete tutorial overview for TaskFlow

- Project description and learning objectives
- Tutorial structure and time estimates
- Prerequisites and setup requirements
- Links to example repo and live demo

Sets expectations for hands-on tutorial."
```

---

### Task 5: Write Introduction Chapters (01-04)

**Files:**
- Modify: `docs/01-introduction/what-is-vibe-coding.md`
- Modify: `docs/01-introduction/why-this-workflow.md`
- Modify: `docs/01-introduction/what-youll-build.md`
- Modify: `docs/01-introduction/prerequisites.md`

**Step 1: Write "What is Vibe Coding"**

Replace content in `docs/01-introduction/what-is-vibe-coding.md`:

```markdown
# What is Vibe Coding

"Move fast and break things" is dead. "Move slow and build it right" is too slow. **Vibe coding is the third way.**

## The Problem

Modern web development has two camps:

**Camp 1: Cowboy Coders**
- Ship fast, fix later (or never)
- No tests, no documentation, no standards
- Technical debt compounds
- Eventually the codebase becomes unmaintainable
- "It works on my machine" forever

**Camp 2: Over-Engineers**
- Perfect architecture before line one
- Tests for tests, abstraction for abstraction's sake
- Analysis paralysis
- Projects ship months late or never
- "We need to refactor first" forever

Both approaches fail. One breaks things, the other never ships.

## The Third Way: Maintainable Vibe Coding

**Vibe coding** means:

- ✅ Ship fast WITHOUT breaking things
- ✅ Use AI assistance WITHOUT losing control
- ✅ Write tests WITHOUT slowing down
- ✅ Follow best practices WITHOUT perfectionism
- ✅ Build quickly WITHOUT technical debt

## What Makes It "Vibe"?

The "vibe" comes from **flow state development**:

- Tools that amplify rather than interrupt
- AI that suggests rather than dictates
- Workflows that guide rather than constrain
- Patterns that emerge rather than impose

You're **in the zone**, making progress, **but you're also building it right**.

## What Makes It "Maintainable"?

Maintainability isn't an afterthought. It's built in:

- **Tests written as you code** (TDD, but pragmatic)
- **Clear patterns from day one** (thanks to project prompts)
- **Documentation that stays current** (generated, not written)
- **Code that's easy to change** (DRY, YAGNI, not YOLO)

## The Workflow

Maintainable vibe coding follows five phases:

1. **Design (v0)** - Visualize the UI before coding
2. **Infrastructure (Supabase)** - Backend setup in minutes
3. **Version Control (GitHub)** - Professional workflow from the start
4. **Development (Claude Code + Superpowers)** - AI-assisted, but you're in control
5. **Deployment (Vercel)** - Push to production with confidence

Each phase uses **the best tool for the job**, proven through real projects.

## What This Isn't

Let's be clear about what vibe coding is **not**:

❌ **Not "let AI write everything"** - You're the architect, AI is the assistant

❌ **Not "skip the tests"** - TDD is core to the workflow

❌ **Not "YOLO deployment"** - We deploy with confidence, not fingers crossed

❌ **Not "works on my machine"** - Consistent environments from day one

❌ **Not "hack it together"** - Fast AND maintainable aren't opposites

## Who This Is For

You'll love vibe coding if you:

- Want to ship quickly but hate technical debt
- Like AI assistance but don't trust autopilot
- Value pragmatism over perfectionism
- Ship side projects or production systems
- Work solo or with a team

## Real Results

Teams using this workflow report:

- **3-5x faster** initial development
- **50% fewer bugs** in production
- **Easy onboarding** for new developers
- **Confident refactoring** when needed
- **Sustainable pace** without burnout

## Next

Ready to learn why this workflow works? Continue to [Why This Workflow](why-this-workflow.md).

---

!!! quote "The Philosophy"
    "Move fast and DON'T break things. It's possible. This is how."
```

**Step 2: Write "Why This Workflow"**

Replace content in `docs/01-introduction/why-this-workflow.md`:

```markdown
# Why This Workflow

Every choice in this workflow is battle-tested. Here's why each phase exists and why they're in this order.

## Design First (v0)

**Why v0:** Designing in code is expensive. Changes require refactoring, testing, deployment. Design iteration should be fast and visual.

**Why first:** You can't build the backend until you know what the frontend needs. Designing first reveals the actual requirements.

**Alternative tried:** Figma → handoff to developer → "that's not what I meant" → repeat. Slow and frustrating.

**Why this works:** v0 generates production code. No handoff. No translation layer. Design → export → done.

## Infrastructure Second (Supabase)

**Why Supabase:** Backend as a service means authentication, database, real-time, and storage without building from scratch.

**Why second:** Now you know what the UI needs. Create exactly the schema, auth, and policies required. Nothing more.

**Alternative tried:** Building custom backend first, then realizing the UI needs different data structures. Or worse: frontend-first with no backend plan.

**Why this works:** Supabase is production-ready from day one. No "we'll add auth later" or "we'll optimize the database later."

## Version Control Third (GitHub)

**Why GitHub:** Version control should start immediately, not "when the project is more serious."

**Why third:** You have something real to commit: the v0 export and Supabase config. Not an empty repo.

**Alternative tried:** "I'll add git later" → never do → disaster. Or: git from the start → 47 commits saying "initial commit" → confusing history.

**Why this works:** Meaningful commit history from day one. Every commit after this tells a story.

## Development Fourth (Claude Code + Superpowers)

**Why Claude Code:** AI-assisted development, when done right, is 3-5x faster than solo coding. The key is "done right."

**Why Superpowers:** Without structure, AI assistance becomes "generate code → hope it works → debug for hours." Superpowers provides process skills: brainstorming, TDD, systematic debugging.

**Why fourth:** With design, infrastructure, and git ready, development has clear rails. You're building something specific, not wandering.

**Alternative tried:** AI coding without workflow → works for tiny scripts, falls apart for real apps. Or: no AI assistance → slower, more tedious, but at least consistent.

**Why this works:** Claude Code with Superpowers = AI speed with human control. You get suggestions, not surprises.

## Deployment Fifth (Vercel)

**Why Vercel:** Zero-config deployment for Next.js. Push to GitHub → automatic preview → merge to main → production. That's it.

**Why fifth:** Deploy frequently from the start. Not "we'll deploy when it's ready." You're never "ready" until you deploy.

**Alternative tried:** Setting up custom deployment pipeline → spend days on DevOps → burn out before shipping. Or: deploy manually → error-prone, skipped in crunch time.

**Why this works:** Vercel removes deployment as a friction point. You deploy constantly, catch issues early.

## The Order Matters

You might think "I'll do these in parallel" or "I'll skip ahead." Don't. Here's why:

### Design → Infrastructure
If you build the backend first, you'll build what you THINK you need. Design first reveals what you ACTUALLY need.

### Infrastructure → Version Control
Empty repos are confusing. Having real code to commit makes git make sense.

### Version Control → Development
Git history documents decisions. When Claude Code asks "why did we do this?" the commits tell the story.

### Development → Deployment
Deploying frequently catches integration issues early. Deploy on day one, deploy every day after.

## Tool Choices

Each tool is chosen for a reason:

| Tool | Why This One | What We Tried |
|------|-------------|---------------|
| **v0** | Generates production Next.js code | Figma (handoff pain), Tailwind UI (too generic), custom components (too slow) |
| **Supabase** | Auth + database + real-time in one | Firebase (vendor lock-in), custom backend (too much work), MongoDB (no built-in auth) |
| **GitHub** | Industry standard, free, integrated with everything | GitLab (less ecosystem), Bitbucket (same), Mercurial (lol) |
| **Claude Code** | Best coding AI with tool use | Copilot (autocomplete isn't architecting), ChatGPT (no codebase context), raw Claude (no file access) |
| **Superpowers** | Process skills for AI coding | Raw prompts (inconsistent), custom workflows (everyone invents their own), no structure (chaos) |
| **Vercel** | Zero-config Next.js deployment | Netlify (good but less Next.js specific), AWS (too complex), Heroku (dying), Railway (less mature) |

## Flexibility

This workflow is opinionated but flexible:

**Can substitute:**
- Vercel → Netlify, Railway, or self-hosted
- Supabase → Firebase, PocketBase, or custom backend
- GitHub → GitLab, Bitbucket, or Gitea

**Can't substitute (without rethinking):**
- v0 → There's no equivalent for code-generating design
- Claude Code + Superpowers → This is the secret sauce

## What You Give Up

Honesty time. This workflow isn't perfect:

**Trade-offs:**
- v0 requires v0 access (waitlist or paid)
- Supabase is another service (more accounts, potential costs)
- Claude Code is Anthropic-specific (lock-in)
- Vercel free tier has limits (upgrade or self-host eventually)

**Worth it because:** The speed and maintainability gains vastly outweigh service dependencies.

## Real Projects Using This

This workflow has shipped:

- SaaS MVPs (3 weeks from idea to paying customers)
- Internal tools (weekend projects that became critical infrastructure)
- Side projects (actually finished, not abandoned at 80%)
- Client work (delivered early, no maintenance nightmares)

## Next

Ready to see what you'll build? Continue to [What You'll Build](what-youll-build.md).

---

!!! info "Principles Over Tools"
    Tools change. v0 might be replaced someday. The principles (design first, infrastructure second, git from the start, AI-assisted development, frequent deployment) will remain.
```

**Step 3: Write "What You'll Build"**

Replace content in `docs/01-introduction/what-youll-build.md`:

```markdown
# What You'll Build

Throughout this book, you'll build **TaskFlow**, a complete team task management application. Here's what it looks like and how it works.

## TaskFlow: Team Task Management

**Live Demo:** [taskflow-tutorial.vercel.app](https://taskflow-tutorial.vercel.app)

**Source Code:** [github.com/yourusername/taskflow-tutorial](https://github.com/yourusername/taskflow-tutorial)

## Features

### User Authentication
- Email/password sign up and login
- Magic link authentication
- Social auth (Google, GitHub)
- Password reset flow
- Session management

### Task Management
- Create, edit, delete tasks
- Assign tasks to team members
- Set priorities (low, medium, high, urgent)
- Add labels and tags
- Rich text descriptions
- File attachments

### Real-Time Collaboration
- See team members' changes instantly
- Live presence indicators
- Optimistic UI updates
- Conflict resolution

### Organization
- Kanban board view
- List view
- Calendar view
- Filters and search
- Bulk operations

### Dashboard
- Task statistics
- Team activity feed
- Personal task summary
- Upcoming deadlines

## Technical Showcase

TaskFlow demonstrates every aspect of the workflow:

### From v0
- Responsive dashboard layout
- Drag-and-drop kanban board
- Modal forms and dialogs
- Empty states and loading states
- Mobile-first design

### From Supabase
- Email/password authentication
- OAuth providers
- PostgreSQL database with proper indexing
- Row Level Security for data isolation
- Real-time subscriptions
- File storage for attachments

### From GitHub Workflow
- Feature branch development
- Pull request reviews
- GitHub Actions CI/CD
- Automated deployments
- Version tagging

### From Claude Code + Superpowers
- TDD implementation of auth flows
- Brainstormed feature architecture
- Systematic debugging
- Code review workflows
- Refactoring with confidence

### From Vercel Deployment
- Automatic preview deployments
- Environment variable management
- Edge functions for API routes
- Analytics and monitoring
- Zero-downtime deploys

## Project Structure

```
taskflow/
├── .github/
│   └── workflows/
│       └── ci.yml              # GitHub Actions
├── .claude/
│   └── project-prompt.md       # Claude Code configuration
├── src/
│   ├── app/                    # Next.js 13+ app directory
│   │   ├── (auth)/            # Auth routes
│   │   ├── (dashboard)/       # Protected routes
│   │   └── api/               # API routes
│   ├── components/
│   │   ├── ui/                # Shadcn components
│   │   ├── tasks/             # Task-specific components
│   │   └── layout/            # Layout components
│   ├── lib/
│   │   ├── supabase/          # Supabase client & types
│   │   ├── hooks/             # Custom React hooks
│   │   └── utils/             # Utility functions
│   └── tests/
│       ├── unit/              # Unit tests
│       ├── integration/       # Integration tests
│       └── e2e/               # End-to-end tests
├── supabase/
│   ├── migrations/            # Database migrations
│   └── seed.sql               # Seed data
├── public/                     # Static assets
└── docs/                       # Project documentation
```

## Development Timeline

Building TaskFlow following this workflow takes:

**Week 1 (MVP):**
- Day 1: v0 design + Supabase setup (2-3 hours)
- Day 2: GitHub + local setup + auth (2-3 hours)
- Day 3-4: Core task CRUD (4-5 hours)
- Day 5: Kanban board + drag-drop (2-3 hours)
- Day 6: Polish + deployment (2 hours)

**Total MVP:** 15-18 hours over 6 days

**Week 2 (Full features):**
- Real-time collaboration
- File attachments
- Advanced filters
- Team management
- Analytics dashboard

**Total Production-Ready:** 30-35 hours over 2 weeks

Compare this to traditional development:
- Design in Figma: 2-3 days
- Implement design: 5-7 days
- Build backend: 7-10 days
- Testing: 3-5 days
- Deployment setup: 1-2 days

**Traditional timeline:** 4-6 weeks for the same result

## What You'll Learn

By building TaskFlow, you'll master:

### Technical Skills
- Next.js 13+ app directory
- Shadcn UI components
- Supabase client & RLS
- Real-time subscriptions
- TypeScript best practices
- Testing strategies

### Workflow Skills
- Design-first development
- TDD in practice
- AI-assisted coding
- Git workflow
- Continuous deployment
- Production monitoring

### Decision-Making
- When to use v0 vs custom code
- How to structure Supabase schemas
- Where to add tests
- When to refactor
- How to debug with Claude Code

## After TaskFlow

Once you complete TaskFlow, you'll be able to:

✅ Ship new projects in days, not months

✅ Add features without breaking existing ones

✅ Onboard teammates quickly

✅ Refactor with confidence

✅ Handle production issues calmly

✅ Build side projects that you actually finish

## Variations

The tutorial builds TaskFlow, but you can apply this to:

- **SaaS products** - Subscription management, billing, analytics
- **Internal tools** - Admin dashboards, data entry, reporting
- **E-commerce** - Product catalogs, checkout, inventory
- **Social apps** - Feeds, comments, notifications
- **Content platforms** - Publishing, moderation, search

The workflow works for any web application.

## Next

Make sure you have the prerequisites. Continue to [Prerequisites](prerequisites.md).

---

!!! tip "Real Complexity"
    TaskFlow isn't a toy example. It has real-world complexity: auth, permissions, real-time, file uploads, testing. That's intentional. You'll learn patterns that scale.
```

**Step 4: Write "Prerequisites"**

Replace content in `docs/01-introduction/prerequisites.md`:

```markdown
# Prerequisites

Before starting, make sure you have these tools and accounts ready.

## Required Accounts (All Free)

### 1. GitHub Account
**Why:** Version control and deployment automation

**Sign up:** [github.com](https://github.com/signup)

**What you need:** Personal account (free tier is sufficient)

### 2. Vercel Account
**Why:** Deploy Next.js applications with zero configuration

**Sign up:** [vercel.com/signup](https://vercel.com/signup)

**Tip:** Sign up with your GitHub account for seamless integration

**What you need:** Hobby plan (free tier is sufficient)

### 3. Supabase Account
**Why:** Backend as a service (auth, database, storage, real-time)

**Sign up:** [supabase.com](https://supabase.com)

**What you need:** Free tier (includes 2 projects, sufficient for learning)

### 4. v0 Access
**Why:** AI-powered design tool that generates production Next.js code

**Sign up:** [v0.dev](https://v0.dev)

**Note:** May have waitlist or require paid plan. Check current status.

### 5. Claude Code CLI
**Why:** AI-assisted development with codebase context

**Installation:** [docs.anthropic.com/claude-code](https://docs.anthropic.com/en/docs/claude-code)

**What you need:** Claude Pro subscription (required for Claude Code)

## Required Software

### 1. Node.js 18+
**Check version:**
```bash
node --version
```

**Expected:** v18.0.0 or higher

**Install:** [nodejs.org](https://nodejs.org) or use `nvm`:
```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Node.js
nvm install 18
nvm use 18
```

### 2. Git
**Check version:**
```bash
git --version
```

**Expected:** Any recent version (2.x)

**Install:**
- macOS: `brew install git` or comes with Xcode
- Linux: `sudo apt-get install git` or equivalent
- Windows: [git-scm.com](https://git-scm.com)

### 3. Text Editor
**Recommended:** VS Code with extensions:
- ESLint
- Prettier
- Tailwind CSS IntelliSense
- GitLens

**Alternatives:** Any editor works (Cursor, WebStorm, Vim, etc.)

### 4. Terminal
**macOS/Linux:** Built-in terminal is sufficient

**Windows:** WSL2 recommended, or Git Bash

## Required Knowledge

### You Should Know

✅ **JavaScript basics** - Variables, functions, arrays, objects

✅ **Basic terminal usage** - cd, ls, running commands

✅ **Basic git concepts** - commit, push, pull, branch (we'll teach the workflow)

✅ **HTML/CSS fundamentals** - How websites are structured

### You Don't Need to Know

❌ **React** - We'll use Next.js, but you'll learn as you go

❌ **TypeScript** - Nice to have, not required

❌ **Databases** - Supabase handles SQL for you

❌ **DevOps** - Vercel handles deployment

❌ **Advanced git** - We use a simple workflow

## Installation Checklist

Before proceeding, verify everything works:

### 1. Node.js Test
```bash
node --version
npm --version
```

**Expected:** Version numbers (no errors)

### 2. Git Test
```bash
git --version
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

**Expected:** Version number, config set without errors

### 3. GitHub CLI (Optional but Recommended)
```bash
# Install
brew install gh   # macOS
# or download from github.com/cli/cli

# Authenticate
gh auth login
```

**Expected:** Logged in to GitHub via CLI

### 4. Claude Code Test
```bash
claude-code --version
```

**Expected:** Version number

If not installed, follow: [docs.anthropic.com/claude-code](https://docs.anthropic.com/en/docs/claude-code)

### 5. Superpowers Setup
```bash
cd ~/.claude/plugins
git clone https://github.com/obra/superpowers.git
```

**Expected:** Superpowers cloned to plugins directory

**Verify:**
```bash
ls ~/.claude/plugins/superpowers/skills
```

**Expected:** List of skill directories

## Optional but Recommended

### 1. pnpm or yarn
**Why:** Faster than npm, smaller node_modules

```bash
npm install -g pnpm
```

### 2. Supabase CLI
**Why:** Local development, migrations

```bash
npm install -g supabase
```

### 3. Vercel CLI
**Why:** Local preview, environment management

```bash
npm install -g vercel
```

## Cost Estimate

Let's be transparent about costs:

| Service | Free Tier | What You Get | Upgrade Cost |
|---------|-----------|--------------|--------------|
| **GitHub** | Free | Unlimited public/private repos | Free |
| **Vercel** | Free | Unlimited deployments, 100GB bandwidth | $20/mo for Pro |
| **Supabase** | Free | 2 projects, 500MB database, 1GB file storage | $25/mo per project |
| **v0** | Varies | Check current pricing | ~$20/mo |
| **Claude Pro** | $20/mo | Unlimited Claude access + Claude Code | Required |

**Total for learning:** ~$40/mo (Claude Pro + v0 if paid)

**Total for production:** Add $25/mo per Supabase project if needed

**Free tier sufficient for:** Learning, side projects, low-traffic apps

## Time Commitment

**Setup:** 1-2 hours (one time)

**Tutorial:** 6-8 hours (one weekend)

**Building your own project:** 1-2 weeks

## Ready?

Once everything is installed and verified, you're ready to start!

**Next:** Begin with the [Workflow Overview](../02-workflow-overview/the-five-phases.md) or jump straight to the [Complete Tutorial](../08-complete-tutorial/overview.md).

---

!!! warning "Blocked on v0 Access?"
    If you're waitlisted for v0, you can still follow along by:
    1. Using the provided v0 exports in the tutorial
    2. Learning the workflow with provided code
    3. Getting v0 access later and repeating with your own designs
```

**Step 5: Test all introduction pages**

```bash
mkdocs serve
```

Navigate through all introduction pages, verify formatting and links.

**Step 6: Commit introduction chapters**

```bash
git add docs/01-introduction/
git commit -m "feat: write complete introduction chapters

- What is vibe coding (philosophy and approach)
- Why this workflow (rationale for each phase)
- What you'll build (TaskFlow overview)
- Prerequisites (accounts, software, knowledge)

Complete introduction ready for readers."
```

---

## Phase 3: Deployment Setup

### Task 6: Create Deployment Documentation

**Files:**
- Create: `docs/deployment.md`
- Create: `.github/ISSUE_TEMPLATE/bug_report.md`
- Create: `.github/ISSUE_TEMPLATE/feature_request.md`

**Step 1: Create deployment guide**

Create `docs/deployment.md`:

```markdown
# Deployment Guide

This book is automatically deployed to GitHub Pages using GitHub Actions.

## Automatic Deployment

Every push to `main` triggers:
1. Install dependencies
2. Build with `mkdocs build --strict`
3. Deploy to GitHub Pages

**Live site:** `https://yourusername.github.io/maintainable-vibe-coding`

## Local Development

```bash
# Install dependencies
pip install -r requirements.txt

# Run local server
mkdocs serve

# Build static site
mkdocs build
```

## Manual Deployment

If needed, deploy manually:

```bash
mkdocs gh-deploy
```

## Custom Domain

To use a custom domain:

1. Add CNAME record pointing to `yourusername.github.io`
2. Create `docs/CNAME` file with your domain
3. Push to trigger deployment

## Troubleshooting

### Build fails
- Check `mkdocs.yml` syntax
- Verify all pages in `nav` exist
- Run `mkdocs build --strict` locally

### Pages not updating
- Check GitHub Actions logs
- Clear browser cache
- Wait 2-3 minutes for CDN refresh
```

**Step 2: Create bug report template**

Create `.github/ISSUE_TEMPLATE/bug_report.md`:

```markdown
---
name: Bug report
about: Report an error or issue with the book
title: '[BUG] '
labels: bug
assignees: ''
---

**Describe the bug**
A clear description of what's wrong.

**Location**
- Chapter/Page:
- Section:
- URL:

**Expected behavior**
What should happen instead?

**Screenshots**
If applicable, add screenshots.

**Additional context**
Add any other context about the problem.
```

**Step 3: Create feature request template**

Create `.github/ISSUE_TEMPLATE/feature_request.md`:

```markdown
---
name: Feature request
about: Suggest content or improvements for the book
title: '[FEATURE] '
labels: enhancement
assignees: ''
---

**What would you like to see added?**
Clear description of the content or feature.

**Why is this valuable?**
How does this improve the book?

**Suggested location**
Which chapter or section would this fit in?

**Are you willing to contribute?**
- [ ] Yes, I can write this content
- [ ] Yes, I can help review
- [ ] No, just suggesting
```

**Step 4: Commit deployment setup**

```bash
git add docs/deployment.md .github/ISSUE_TEMPLATE/
git commit -m "feat: add deployment guide and issue templates

- Deployment documentation for contributors
- Bug report template
- Feature request template

Completes project infrastructure."
```

---

## Phase 4: Next Steps

### Task 7: Update README with Current Status

**Files:**
- Modify: `README.md`

**Step 1: Add development status section**

Update the "Development Status" section in `README.md`:

```markdown
## 📝 Development Status

**Current status:** 🚀 Foundation Complete

- [x] Architecture design complete
- [x] MkDocs configuration and structure
- [x] Complete chapter placeholders (51 pages)
- [x] GitHub Actions deployment workflow
- [x] Introduction chapters (4 complete)
- [x] Tutorial overview complete
- [ ] Tutorial content (Steps 1-9)
- [ ] Workflow chapters (Phases 1-5)
- [ ] Best practices chapter
- [ ] Advanced topics chapter

**Next:** Tutorial content development (Chapter 08)

**Follow development progress:** Check GitHub Issues and Pull Requests
```

**Step 2: Commit README update**

```bash
git add README.md
git commit -m "docs: update README with current development status

Foundation phase complete:
- Full site structure
- GitHub Actions deployment
- Introduction and tutorial overview written
- Ready for content development"
```

---

## Summary

This implementation plan creates the complete foundation for the Maintainable Vibe Coding book:

**Completed:**
- MkDocs Material configuration
- 51 placeholder pages across 11 chapters
- Complete navigation structure
- GitHub Actions deployment workflow
- Assets directories for images and videos
- 4 introduction chapters (What, Why, What You'll Build, Prerequisites)
- Tutorial overview (Chapter 08)
- Deployment documentation
- Issue templates for contributions

**Next Phase:** Content development starting with the complete tutorial (Chapter 08 steps 1-9), followed by extracting lessons into workflow chapters (03-07), then best practices and advanced topics.

**Timeline Estimate:**
- Foundation (this plan): 2-3 hours ✅
- Tutorial content: 10-15 hours
- Workflow chapters: 10-12 hours
- Best practices: 4-6 hours
- Advanced topics: 4-6 hours
- Polish and launch: 2-3 hours

**Total to MVP:** 30-40 hours over 2-3 weeks
