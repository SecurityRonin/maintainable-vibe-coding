# Maintainable Vibe Coding Book - Architecture Design

**Date:** 2025-11-11
**Status:** Approved
**Author:** Book Project Team

## Executive Summary

A practical workflow tutorial book teaching "vibe coding" best practices - the battle-tested process from design to deployment using v0, Supabase, GitHub, and Claude Code CLI with superpowers. Built with MkDocs Material for web publication and Amazon Kindle export.

## Vision

**What we're building:** A workflow tutorial book (not a React coding tutorial) that teaches readers how to ship fast without breaking things.

**Core philosophy:** Show, don't tell. Loom videos of the author working, with markdown chapters explaining decisions.

## Goals & Constraints

### Primary Goals
- Teaching the proven workflow to ship faster
- Practical tutorial format - readers complete a real project
- Speed to publish with professional polish
- Interactive examples (Loom videos, screenshots, example repos)

### Constraints
- Must support Loom video embeds
- Must export to Amazon Kindle format
- Must look professional and polished
- Must be maintainable by author + contributors

### Success Criteria
- Web version live with working Loom embeds
- Amazon version properly formatted and readable
- At least 5 complete example repos at different stages
- Tutorial completable in one weekend
- Professional appearance competitive with tech publishing standards

## Architecture

### Tech Stack

**Core Platform:**
- MkDocs Material (latest stable)
- Python 3.9+
- GitHub Pages for hosting

**MkDocs Plugins:**
- search
- git-revision-date-localized
- minify (for production)

**Markdown Extensions:**
- admonition (callout boxes)
- pymdownx.details (collapsible sections)
- pymdownx.superfences (enhanced code blocks)
- pymdownx.tabbed (tabbed content)
- attr_list + md_in_html (custom HTML/video embeds)
- pymdownx.emoji (icons)

**Why MkDocs Material:**
- Simple markdown-based writing
- Native support for embedded videos (iframe)
- Beautiful, professional theme out of the box
- Fast to set up and maintain
- Excellent PDF export for Amazon
- No React/JavaScript complexity needed

### Repository Structure

```
maintainable-vibe-coding/
├── docs/                           # All markdown content
│   ├── index.md
│   ├── 01-introduction/
│   ├── 02-workflow-overview/
│   ├── 03-phase-1-design-with-v0/
│   ├── 04-phase-2-infrastructure-supabase/
│   ├── 05-phase-3-github-setup/
│   ├── 06-phase-4-local-development/
│   ├── 07-phase-5-deployment/
│   ├── 08-complete-tutorial/
│   ├── 09-best-practices/
│   ├── 10-advanced-topics/
│   └── 11-conclusion/
├── docs/plans/                     # Design documents
├── examples/                       # Code examples
│   ├── 01-v0-export/
│   ├── 02-with-supabase/
│   └── 03-full-app/
├── assets/                         # Screenshots, diagrams
│   ├── images/
│   └── videos/                     # Local video backups
├── scripts/                        # Build and deployment scripts
│   ├── build-pdf.sh
│   └── deploy.sh
├── mkdocs.yml                      # MkDocs configuration
├── requirements.txt                # Python dependencies
├── .gitignore
├── README.md                       # Project overview
├── CONTRIBUTING.md                 # How to contribute
└── LICENSE
```

### Content Architecture

**Book Structure:** (See full chapter breakdown in Part 1 of design presentation)

**Key Content Principles:**
1. Every chapter has 1-2 Loom videos showing real work
2. Screenshots annotated with decision-making process
3. Links to example repos at each stage
4. "Why" explanations before "How" instructions
5. Common pitfalls sections

**Interactive Elements:**
- Loom video embeds (iframe)
- Annotated screenshots
- Example GitHub repositories with tagged commits
- Deployed demo applications
- Terminal recordings (optional, via asciinema)

## Content Development Workflow

### Phase 1: Proof of Concept (Week 1-2)
1. Set up MkDocs locally
2. Write Chapter 08 (Complete Tutorial) FIRST
   - Build the tutorial project (TaskFlow app)
   - Record Loom videos while working
   - Take screenshots at decision points
   - Commit to example repo after each step
3. Create minimal viable chapters:
   - Index page
   - One tutorial chapter with Loom embed
   - One workflow chapter
4. Deploy to GitHub Pages to validate setup

**Why tutorial first:**
- Proves the workflow works end-to-end
- Generates authentic content (not theoretical)
- Creates example repos other chapters reference
- Records videos while in flow state
- Identifies gaps in the workflow story

### Phase 2: Core Content (Week 3-6)
- Extract lessons from tutorial into Chapters 3-7
- Write introductory chapters (1-2)
- Create additional Loom videos for specific techniques
- Build out best practices from real experiences
- Create additional example projects

### Phase 3: Polish & Launch (Week 7-8)
- Advanced topics chapter
- Conclusion and resources
- Proofread all content
- Test all Loom embeds and links
- Generate PDF for Amazon
- Launch web version
- Publish to Amazon

## Example Projects Strategy

### Main Tutorial Project: "TaskFlow"
**Description:** A team task management app

**Why this project:**
- Showcases every part of the workflow
- v0: Dashboard, kanban boards, user profiles
- Supabase: Auth, real-time updates, RLS policies
- Claude Code: Complex features (drag-drop, filters)
- TDD: Critical paths (task assignment, permissions)

**Repository:** `github.com/yourusername/taskflow-tutorial/`
- Commits tagged by chapter
- Branches for each major phase
- `.claude/` with project prompts
- README linking to book chapters

### Additional Examples
1. **Simple Blog** - Minimal workflow demo
2. **E-commerce Product Page** - v0 design showcase
3. **Real-time Chat** - Supabase real-time features

## Launch & Distribution Strategy

### Web Version (Primary)
- **Hosting:** GitHub Pages (free, fast)
- **Domain:** Custom domain (TBD)
- **Analytics:** Track chapter traffic
- **Community:** Comments via giscus.app (GitHub Discussions)
- **Pricing:** Free (builds audience)

### Amazon Version (Secondary)
- **Format:** PDF → Kindle + Paperback
- **Video Handling:** QR codes + URLs for Loom videos
- **Pricing:**
  - Ebook: $9.99-$14.99
  - Paperback: $24.99-$29.99
- **Category:** Programming > Web Development

### Marketing & Community
- Tweet progress building the book
- Share Loom videos as standalone content
- Example projects as portfolio pieces
- GitHub Discussions for reader questions
- Newsletter for updates/advanced topics

## Technical Configuration

### MkDocs Configuration (`mkdocs.yml`)

```yaml
site_name: Maintainable Vibe Coding
site_description: Ship fast without breaking things
site_author: Your Name
site_url: https://yourdomain.com

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
  - git-revision-date-localized
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
  # ... (complete navigation tree)
```

### Dependencies (`requirements.txt`)

```
mkdocs>=1.5.0
mkdocs-material>=9.4.0
mkdocs-git-revision-date-localized-plugin
mkdocs-minify-plugin
```

### Loom Video Embedding

```markdown
<div style="position: relative; padding-bottom: 62.5%; height: 0;">
  <iframe
    src="https://www.loom.com/embed/YOUR_VIDEO_ID"
    frameborder="0"
    webkitallowfullscreen
    mozallowfullscreen
    allowfullscreen
    style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
  </iframe>
</div>

*In this video, I walk through designing the task management interface in v0...*
```

## Amazon Publishing Process

1. **PDF Generation:**
   - Use `mkdocs-pdf-export-plugin` or `mkdocs-with-pdf`
   - Configure for proper page breaks and formatting

2. **Video Handling:**
   - Generate QR codes for each Loom video
   - Include full URLs in footnotes/appendix
   - Add "Watch this video at: [URL]" callouts

3. **Formatting:**
   - Maintain screenshot quality (300 DPI minimum)
   - Test PDF on Kindle Previewer
   - Import to Kindle Create for final polish

4. **Metadata:**
   - Title: "Maintainable Vibe Coding: Ship Fast Without Breaking Things"
   - Keywords: web development, rapid prototyping, Next.js, Supabase, Claude AI
   - Categories: Computers > Programming > Web Development

## Maintenance Plan

- **Quarterly Updates:** As tools evolve (v0, Supabase, Claude Code)
- **New Chapters:** Add techniques as you discover them
- **Reader Contributions:** Accept example projects and improvements
- **Video Updates:** Re-record if tools change significantly
- **Community Management:** Respond to GitHub Discussions weekly

## Success Metrics

### Web Version
- 1000+ unique visitors/month by month 3
- 100+ GitHub stars on book repo
- Active community discussions

### Amazon Version
- 100+ copies sold in first 3 months
- 4+ star average rating
- 20+ reviews

### Community
- 10+ contributed example projects
- Weekly engagement in discussions
- Reader success stories

## Risk Mitigation

| Risk | Mitigation |
|------|------------|
| Tools change significantly | Video library lets you re-record selectively |
| Loom goes away | Keep local video backups in assets/videos/ |
| Amazon rejects formatting | Test with Kindle Previewer throughout development |
| Content gets stale | Quarterly review and update cycle |
| No reader engagement | Free web version builds audience first |

## Next Steps

1. Set up local MkDocs environment
2. Create initial repository structure
3. Write and record Chapter 08 (Complete Tutorial)
4. Deploy proof of concept to GitHub Pages
5. Iterate based on early feedback
6. Complete remaining chapters
7. Generate Amazon PDF
8. Launch web and Amazon versions simultaneously

---

**Approved by:** [Your name]
**Date:** 2025-11-11
