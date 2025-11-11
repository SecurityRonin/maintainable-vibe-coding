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
