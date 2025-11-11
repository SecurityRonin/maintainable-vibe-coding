# Contributing to Maintainable Vibe Coding

Thank you for your interest in contributing to this book project! This guide will help you contribute effectively.

## Table of Contents

- [Ways to Contribute](#ways-to-contribute)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Content Guidelines](#content-guidelines)
- [Code Examples Guidelines](#code-examples-guidelines)
- [Submitting Changes](#submitting-changes)
- [Community Guidelines](#community-guidelines)

## Ways to Contribute

### 1. Content Contributions
- **Fix typos and grammar**: Simple PRs always welcome
- **Improve explanations**: Make concepts clearer
- **Add examples**: Share your own workflow variations
- **Update outdated content**: Tools evolve, help keep content current

### 2. Example Projects
- **Create new examples**: Show the workflow in different contexts
- **Improve existing examples**: Add features, fix bugs, enhance documentation
- **Share case studies**: Real-world applications of the workflow

### 3. Media Contributions
- **Record video tutorials**: Loom videos showing your workflow
- **Create diagrams**: Visualize complex concepts
- **Design graphics**: Improve visual appeal
- **Take screenshots**: Document tool interfaces

### 4. Community Support
- **Answer questions**: Help in GitHub Discussions
- **Review PRs**: Provide feedback on contributions
- **Share feedback**: What's working, what needs improvement
- **Report issues**: Found something wrong? Let us know

## Getting Started

### Prerequisites

You'll need:
- Python 3.9 or higher
- Git
- A text editor (VS Code recommended)
- Basic markdown knowledge

### Setup Local Environment

1. **Fork and clone the repository:**
```bash
# Fork on GitHub first, then:
git clone https://github.com/YOUR_USERNAME/maintainable-vibe-coding.git
cd maintainable-vibe-coding
```

2. **Install dependencies:**
```bash
# Create virtual environment (recommended)
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install MkDocs and plugins
pip install -r requirements.txt
```

3. **Run local development server:**
```bash
mkdocs serve
```

Visit `http://127.0.0.1:8000` to see your local version of the book.

4. **Verify everything works:**
```bash
# Test build
mkdocs build

# Check for broken links (if plugin installed)
mkdocs build --strict
```

### Understanding the Structure

```
docs/                   # All markdown content lives here
  01-introduction/      # Chapter folders match book structure
  02-workflow-overview/
  ...
examples/              # Code examples
  01-v0-export/        # Example projects at different stages
  02-with-supabase/
  ...
assets/                # Media files
  images/              # Screenshots, diagrams
  videos/              # Local video backups
mkdocs.yml            # Site configuration
```

## Development Workflow

### 1. Create a Branch

Always create a new branch for your changes:

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/issue-number-description
```

**Branch naming conventions:**
- `feature/` - New content or functionality
- `fix/` - Bug fixes or corrections
- `docs/` - Documentation improvements
- `examples/` - New or updated example projects

### 2. Make Your Changes

- Edit markdown files in the `docs/` folder
- Add images to `assets/images/`
- Add example code to `examples/`
- Test locally with `mkdocs serve`

### 3. Preview Your Changes

Always preview before submitting:
```bash
mkdocs serve
# Open http://127.0.0.1:8000
# Check your changes render correctly
```

### 4. Commit Your Changes

Write clear, descriptive commit messages:

```bash
git add .
git commit -m "Add section on debugging Supabase connections

- Add troubleshooting steps for common auth issues
- Include screenshot of Supabase dashboard
- Reference issue #42"
```

**Good commit messages:**
- Start with a verb (Add, Fix, Update, Remove)
- First line is a summary (50 chars or less)
- Add details in the body if needed
- Reference issues/PRs when relevant

### 5. Push and Create Pull Request

```bash
git push origin your-branch-name
```

Then create a pull request on GitHub.

## Content Guidelines

### Writing Style

**Tone:**
- Conversational and approachable
- Show, don't just tell
- Share real experiences, including mistakes
- Encourage experimentation

**Structure:**
- Start with "Why" before "How"
- Use concrete examples
- Include common pitfalls
- End with "What's next"

**Example structure for a chapter:**
```markdown
# Chapter Title

## Why This Matters
[Explain the problem this solves]

## How It Works
[Explain the concept]

## Hands-On Example
[Show it in action]

## Common Pitfalls
[What to watch out for]

## Best Practices
[Hard-won lessons]

## Next Steps
[Where to go from here]
```

### Markdown Conventions

**Headings:**
```markdown
# H1 - Chapter Title (only one per file)
## H2 - Major sections
### H3 - Subsections
#### H4 - Rarely needed
```

**Code Blocks:**
````markdown
```bash
# Always specify language for syntax highlighting
npm install
```

```typescript
// Use real, working code examples
export async function fetchUser(id: string) {
  return await supabase.from('users').select('*').eq('id', id);
}
```
````

**Callouts:**
```markdown
!!! note "Pro Tip"
    Use callouts for important information

!!! warning "Common Mistake"
    Highlight pitfalls this way

!!! info "Learn More"
    Additional resources go here
```

**Links:**
```markdown
[Descriptive text](https://example.com) - External links
[Another chapter](../02-workflow/intro.md) - Internal links
```

**Images:**
```markdown
![Descriptive alt text](../../assets/images/screenshot.png)

*Caption explaining what the image shows*
```

**Loom Videos:**
```markdown
<div style="position: relative; padding-bottom: 62.5%; height: 0;">
  <iframe
    src="https://www.loom.com/embed/VIDEO_ID"
    frameborder="0"
    webkitallowfullscreen
    mozallowfullscreen
    allowfullscreen
    style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
  </iframe>
</div>

*In this video: [Brief description of what the video shows]*
```

### Content Quality Standards

Before submitting content:

- [ ] Spell check and grammar check
- [ ] All code examples tested and working
- [ ] All links verified (no 404s)
- [ ] Images are clear and properly sized
- [ ] Video embeds work correctly
- [ ] Content flows logically
- [ ] Technical accuracy verified
- [ ] Follows book's writing style

## Code Examples Guidelines

### Creating Example Projects

Example projects should:

1. **Be complete and runnable**
   - Include all necessary files
   - Have clear setup instructions
   - Actually work when followed

2. **Follow the book's workflow**
   - Start with v0 design (or explain why not)
   - Use Supabase for backend
   - Include `.claude/` project prompts
   - Show git history of development

3. **Include proper documentation**
   ```
   example-project/
   ├── README.md              # Setup and overview
   ├── WORKFLOW.md            # How this was built
   ├── .claude/
   │   └── project-prompt.md  # Claude Code configuration
   ├── src/                   # Application code
   └── docs/                  # Additional documentation
   ```

4. **Have clear commit history**
   ```bash
   # Tag commits that correspond to book chapters
   git tag -a chapter-08-step-1 -m "Initial v0 export"
   git tag -a chapter-08-step-2 -m "Supabase integration"
   ```

### Code Style

Follow these conventions:

**TypeScript/JavaScript:**
- Use TypeScript when possible
- Follow Next.js conventions
- Use Shadcn components
- Implement proper error handling
- Add comments for complex logic

**File naming:**
- `kebab-case` for files and folders
- `PascalCase` for React components
- `camelCase` for functions and variables

**Example structure:**
```typescript
// Good example structure
import { useState, useEffect } from 'react';
import { supabase } from '@/lib/supabase';

/**
 * Fetches user data from Supabase
 * Handles loading and error states
 */
export function useUser(userId: string) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    async function fetchUser() {
      try {
        const { data, error } = await supabase
          .from('users')
          .select('*')
          .eq('id', userId)
          .single();

        if (error) throw error;
        setUser(data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    }

    fetchUser();
  }, [userId]);

  return { user, loading, error };
}
```

### Testing Examples

Before submitting example code:

```bash
# 1. Fresh clone test
cd /tmp
git clone [your-example-repo]
cd [example]

# 2. Follow your own setup instructions
# (Do they actually work?)

# 3. Verify all features work
# - Authentication
# - Database operations
# - UI interactions

# 4. Check for common issues
npm run build    # Does it build?
npm run lint     # Any linting errors?
```

## Submitting Changes

### Pull Request Process

1. **Update your branch:**
```bash
git checkout main
git pull upstream main
git checkout your-branch
git rebase main
```

2. **Create descriptive PR:**

**PR Title:** Use conventional commits format
- `feat: Add chapter on debugging workflows`
- `fix: Correct Supabase configuration steps`
- `docs: Improve contributing guidelines`
- `examples: Add e-commerce example project`

**PR Description Template:**
```markdown
## What does this PR do?
[Brief description]

## Why is this needed?
[Explain the motivation]

## What changed?
- [List key changes]
- [Be specific]

## How to test:
1. [Step by step testing instructions]
2. [Make it easy to review]

## Screenshots/Videos:
[If UI changes, show before/after]

## Checklist:
- [ ] Tested locally with `mkdocs serve`
- [ ] All links work
- [ ] Code examples tested
- [ ] Follows style guidelines
- [ ] Updated navigation if needed

## Related Issues:
Closes #123
References #456
```

3. **Respond to feedback:**
   - Address all review comments
   - Push updates to your branch
   - Be open to suggestions
   - Ask questions if unclear

4. **After merge:**
```bash
# Clean up your branch
git checkout main
git pull upstream main
git branch -d your-branch
```

### What Gets Accepted?

✅ **Will be accepted:**
- Fixes typos, grammar, or formatting
- Improves clarity or adds helpful examples
- Updates outdated information
- Adds missing context or explanations
- Working code examples that enhance learning
- Constructive improvements to existing content

❌ **Will be rejected:**
- Content that contradicts the book's core workflow
- Untested code examples
- Style changes without substance
- Self-promotional content
- Poorly written or off-topic contributions
- Breaking changes without discussion

### Review Process

1. **Automated checks:**
   - MkDocs build succeeds
   - No broken links
   - Markdown linting passes

2. **Maintainer review:**
   - Content accuracy
   - Fits book's style and structure
   - Quality meets standards

3. **Feedback:**
   - Usually within 3-5 days
   - May request changes
   - Discussion encouraged

4. **Merge:**
   - Once approved, maintainer merges
   - Your contribution goes live!

## Video Contributions

### Recording Loom Videos

If you want to contribute video content:

1. **Planning:**
   - Script key points (don't read verbatim)
   - Prepare your environment (clean desktop, good audio)
   - Test record first

2. **Recording:**
   - Keep videos 5-10 minutes max
   - Show, don't just tell
   - One concept per video
   - Include mistakes and how you fix them (authentic learning)

3. **Editing:**
   - Trim dead air at start/end
   - Add chapters/timestamps in Loom
   - Test the embed before submitting

4. **Submitting:**
   - Share Loom link in PR description
   - Provide video description and suggested placement
   - Include embed code for maintainers

**Video guidelines:**
- 1080p minimum resolution
- Clear audio (use microphone, not laptop mic)
- Show keyboard shortcuts/commands
- Pace appropriately (not too fast)
- Add captions if possible

## Community Guidelines

### Code of Conduct

**Be respectful:**
- Treat everyone with respect and kindness
- Welcome newcomers
- Assume good intentions
- Disagree constructively

**Be helpful:**
- Answer questions patiently
- Share knowledge generously
- Provide context in issues/PRs
- Help others learn

**Be professional:**
- No harassment, discrimination, or abuse
- Keep discussions on-topic
- Respect maintainers' decisions
- Follow GitHub's Terms of Service

### Communication Channels

- **GitHub Issues:** Bug reports, feature requests
- **GitHub Discussions:** Questions, ideas, community chat
- **Pull Requests:** Code and content contributions
- **Twitter:** Share your progress and learnings

### Getting Help

**Before asking:**
1. Check existing documentation
2. Search GitHub Issues and Discussions
3. Review the FAQ (if exists)

**When asking:**
- Provide context and details
- Share what you've tried
- Include error messages or screenshots
- Be patient waiting for responses

## Recognition

Contributors are recognized in:
- GitHub contributors list
- Book acknowledgments section
- Community showcase (with permission)

Significant contributors may be listed as co-authors for specific chapters they largely wrote.

## Questions?

- **Technical issues:** Open a GitHub Issue
- **Content questions:** Start a GitHub Discussion
- **General questions:** Comment on relevant PRs or Issues

Thank you for contributing to making this book better! 🚀

---

**Maintainer:** [Your name]
**Last updated:** 2025-11-11
