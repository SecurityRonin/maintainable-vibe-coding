# Magic Prompts Cheat Sheet

Quick reference for invoking Claude Code Superpowers skills to build maintainable apps fast.

## How to Use This Cheat Sheet

1. **Copy the prompt template** for your current phase
2. **Fill in your project details** (replace placeholders)
3. **Paste into Claude Code** and let the skill guide you
4. **Trust the process** - skills know their workflows

**Key principle:** Skills automate best practices. Don't micromanage them.

---

## Planning Phase

### Brainstorming: Design Architecture

**When to use:** At the start of any new feature or project, before writing code.

**Prompt template:**
```
"Let's brainstorm [PROJECT NAME] - [ONE SENTENCE DESCRIPTION].

PROBLEM: [What problem does this solve?]

REQUIREMENTS:
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

TECH STACK:
- [Framework/language]
- [Backend/database]
- [Key dependencies]

PRINCIPLES TO FOLLOW:
- YAGNI: Only MVP features, no feature creep
- KISS: Simplest working solution
- SINE: Elegant simplicity worth the effort
- DMMT: Make wrong things impossible, right things effortless

What's the simplest data model that solves this problem? Let's design the architecture, data model, and user flows following these principles."
```

**What it does:** Guides you through Understanding → Exploration → Design phases with Socratic questioning. Ensures you design thoroughly before coding.

**You'll get:** Design document at `docs/plans/YYYY-MM-DD-[project]-design.md` with complete architecture.

**Time:** 20-40 minutes

**Common pitfalls:**
- ❌ Rushing through questions - answer thoughtfully
- ❌ Adding features beyond MVP - stick to YAGNI
- ❌ Skipping this step - leads to spaghetti code later

---

### Writing Plans: Break Down Implementation

**When to use:** After architecture design is approved, before implementation.

**Prompt template:**
```
"Create a detailed implementation plan for [PROJECT NAME] using your writing-plans skill.

Break the design into bite-sized tasks (2-5 minutes each) with:
- Exact file paths to create/modify
- Complete code examples (not abstractions)
- TDD approach: test first, then implementation
- Verification steps with expected output
- Git commits after each logical unit

FEATURES TO IMPLEMENT (in order):
1. [Feature 1]
2. [Feature 2]
3. [Feature 3]
[...]

Follow TDD throughout: write failing test → minimal code → refactor."
```

**What it does:** Creates detailed task breakdown assuming zero context about your codebase. Each task includes exact code and verification steps.

**You'll get:** Implementation plan at `docs/plans/YYYY-MM-DD-[project]-implementation.md` with numbered tasks.

**Time:** 15-30 minutes

**Common pitfalls:**
- ❌ Vague features - be specific about what to implement
- ❌ Skipping plan - makes implementation chaotic
- ❌ Not following the plan - defeats the purpose

---

## Implementation Phase

### Subagent-Driven Development: Execute Plan with Quality Gates

**When to use:** After you have a detailed implementation plan, ready to build.

**Prompt template:**
```
"Use your subagent-driven-development skill to execute the [PROJECT NAME] implementation plan at docs/plans/YYYY-MM-DD-[project]-implementation.md

IMPLEMENTATION STANDARDS:
- Follow TDD strictly: write failing test first → minimal code → refactor
- Apply DRY: extract reusable patterns as you discover them
- Single responsibility: each component has one clear purpose
- Type safety: leverage TypeScript/types for compile-time guarantees
- [Any project-specific standards]

QUALITY REQUIREMENTS:
- Every feature must have tests that failed first
- No production code without failing test first
- Clear error messages and boundaries
- Loading states for all async operations
- [Any project-specific requirements]

Execute the plan with automatic quality gates between tasks."
```

**What it does:** Spawns subagent for each task, automatically runs code review after each task, gates progress on Critical issues, enforces TDD throughout, runs final comprehensive review.

**You'll get:** Fully implemented app with tests, quality-gated at each step.

**Time:** Varies by project complexity (~10-15 min per task)

**What happens automatically:**
- ✅ Subagent implements task following TDD
- ✅ Code review runs when subagent finishes
- ✅ Critical issues block next task
- ✅ Final review after all tasks complete

**Common pitfalls:**
- ❌ Trying to skip quality gates - the skill won't let you
- ❌ Ignoring Critical issues - must fix before continuing
- ❌ Not having a plan first - skill needs a plan document

---

### Test-Driven Development: Individual Feature Implementation

**When to use:** When implementing a single feature or bugfix (not using subagents).

**Prompt template:**
```
"Implement [FEATURE NAME] following TDD strictly.

FEATURE REQUIREMENTS:
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

TDD WORKFLOW:
1. Write failing test demonstrating desired behavior
2. Run test, confirm it fails (RED)
3. Write minimal code to pass test (GREEN)
4. Refactor for clarity (REFACTOR)
5. Repeat for edge cases

STANDARDS:
- Test real code, avoid mocks when possible
- One behavioral focus per test
- Descriptive test names
- No production code without failing test first"
```

**What it does:** Enforces RED-GREEN-REFACTOR cycle. If code is written before test fails, it's deleted and restarted.

**You'll get:** Feature implemented with tests that actually validate behavior.

**Time:** Varies by feature

**The iron law:** NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST

**Common pitfalls:**
- ❌ Writing test after code - defeats the purpose
- ❌ Test passes immediately - you're testing existing behavior
- ❌ Mocking everything - test real code when possible
- ❌ "Too simple to test" rationalization - always test

---

## Quality Assurance Phase

### Requesting Code Review: Pre-Integration Review

**When to use:** Before merging to main, before deployment, or after completing significant work.

**Prompt template:**
```
"Use your requesting-code-review skill for [pre-deployment/pre-merge] review of [PROJECT NAME].

REVIEW FOCUS AREAS:
- Security: [Security concerns specific to your app]
- Performance: [Performance concerns specific to your app]
- UX: [UX concerns specific to your app]
- Code quality: DRY violations, complex functions, type safety, naming
- Best practices: [Framework] patterns, [Backend] usage, [Key practices]

Block [deployment/merge] on any Critical or Important issues found."
```

**What it does:** Dispatches code-reviewer subagent for comprehensive review of codebase.

**You'll get:** Detailed review report with issues categorized as Critical, Important, or Minor.

**Time:** 10-20 minutes

**Action required:** Fix Critical and Important issues before proceeding.

**Common pitfalls:**
- ❌ Skipping pre-deployment review - catches critical issues
- ❌ Ignoring Important issues - they compound later
- ❌ Only reviewing at the end - review early and often

---

### Systematic Debugging: Fix Bugs Methodically

**When to use:** When encountering bugs, test failures, or unexpected behavior.

**Prompt template:**
```
"I'm encountering [DESCRIBE BUG]. Let's debug this systematically.

OBSERVED BEHAVIOR:
[What's happening]

EXPECTED BEHAVIOR:
[What should happen]

CONTEXT:
- [When does it occur]
- [Steps to reproduce]
- [What you've tried]

Use systematic debugging to identify root cause before proposing fixes."
```

**What it does:** 4-phase process: isolate problem scope → reproduce consistently → identify root cause → verify fix actually works.

**You'll get:** Root cause identification and verified fix.

**Time:** Varies by bug complexity

**The approach:** Understand before fixing. Evidence over guesses.

**Common pitfalls:**
- ❌ Jumping to solutions without understanding
- ❌ Fixing symptoms instead of root cause
- ❌ Not verifying fix actually works
- ❌ Ad-hoc debugging instead of systematic

---

### Verification Before Completion: Confirm It Works

**When to use:** Before claiming any work is complete, fixed, or passing.

**Prompt template:**
```
"Verify [FEATURE/FIX] is complete and working correctly.

RUN VERIFICATION:
- All tests pass (show output)
- [Feature-specific checks]
- No regressions in existing functionality
- Documentation updated if needed

Show me the verification output before marking this complete."
```

**What it does:** Requires running actual verification commands and confirming output before making success claims.

**You'll get:** Evidence that work is actually complete.

**Time:** 2-5 minutes

**The rule:** Evidence before assertions always.

**Common pitfalls:**
- ❌ Claiming "it works" without running tests
- ❌ Manual testing only - automated tests required
- ❌ Not checking for regressions
- ❌ Forgetting to verify edge cases

---

## Collaboration & Git Phase

### Using Git Worktrees: Isolated Development

**When to use:** When starting feature work that needs isolation from current workspace.

**Prompt template:**
```
"Use your using-git-worktrees skill to set up isolated workspace for [FEATURE NAME].

REQUIREMENTS:
- Branch name: [branch-name]
- Base from: [main/develop]
- Directory location: [preferred location or let skill decide]

Set up worktree with safety verification."
```

**What it does:** Creates isolated git worktrees with smart directory selection and safety verification.

**You'll get:** Clean workspace for feature development without affecting main working directory.

**Time:** 2-5 minutes

**Common pitfalls:**
- ❌ Not using worktrees - risks main workspace
- ❌ Forgetting to clean up old worktrees

---

### Finishing a Development Branch: Merge or PR Decision

**When to use:** When implementation is complete, all tests pass, ready to integrate.

**Prompt template:**
```
"Use your finishing-a-development-branch skill to complete work on [FEATURE NAME].

CURRENT STATE:
- Implementation complete: [yes/no]
- All tests passing: [yes/no]
- Code reviewed: [yes/no]
- Documentation updated: [yes/no]

Guide me through merge/PR decision and cleanup."
```

**What it does:** Guides completion of development work by presenting structured options for merge, PR, or cleanup.

**You'll get:** Clear next steps and proper branch completion.

**Time:** 5-10 minutes

**Common pitfalls:**
- ❌ Merging without review
- ❌ Not cleaning up branches
- ❌ Forgetting to update documentation

---

## Advanced Workflows

### Executing Plans: Batch Execution with Review Checkpoints

**When to use:** When executing plan in controlled batches with review checkpoints (alternative to subagent-driven-development).

**Prompt template:**
```
"Use your executing-plans skill to execute [PROJECT NAME] plan at docs/plans/YYYY-MM-DD-[project]-implementation.md

BATCH SIZE: [3-5 tasks per batch recommended]

CHECKPOINT REQUIREMENTS:
- Review after each batch
- Fix issues before next batch
- Report progress between batches

Execute in batches with review checkpoints."
```

**What it does:** Loads plan, reviews critically, executes tasks in batches, reports for review between batches.

**You'll get:** Controlled execution with regular review opportunities.

**Time:** Varies by project

**When to prefer this over subagent-driven-development:**
- Need manual review between batches
- Working across multiple sessions
- Want more control over execution flow

**Common pitfalls:**
- ❌ Making batches too large - harder to review
- ❌ Skipping checkpoint reviews
- ❌ Not documenting decisions between batches

---

### Dispatching Parallel Agents: Concurrent Work

**When to use:** When facing 3+ independent failures that can be investigated without shared state.

**Prompt template:**
```
"Use your dispatching-parallel-agents skill to investigate [PROBLEM].

INDEPENDENT ISSUES:
1. [Issue 1 - can be fixed independently]
2. [Issue 2 - can be fixed independently]
3. [Issue 3 - can be fixed independently]

Dispatch agents to investigate and fix concurrently."
```

**What it does:** Dispatches multiple Claude agents to investigate and fix independent problems concurrently.

**You'll get:** Faster resolution through parallel investigation.

**Time:** Similar to sequential but wall-clock time reduced

**When NOT to use:**
- Issues have shared dependencies
- Need sequential understanding
- Changes might conflict

**Common pitfalls:**
- ❌ Using for dependent issues - causes conflicts
- ❌ Not verifying no shared state
- ❌ Forgetting to integrate fixes afterward

---

## Quick Reference: Skill Selection

**Starting new project:**
→ Brainstorming → Writing Plans → Subagent-Driven Development

**Implementing single feature:**
→ (Optional: Brainstorming if complex) → Test-Driven Development

**Fixing bug:**
→ Systematic Debugging → Verification Before Completion

**Before merging/deploying:**
→ Requesting Code Review → Fix issues → Verification Before Completion

**Need isolation:**
→ Using Git Worktrees

**Work complete:**
→ Finishing a Development Branch

**Multiple independent problems:**
→ Dispatching Parallel Agents

---

## Philosophy Reminders

**Trust the skills:**
- Skills know their workflows - don't micromanage
- If you say "use your [skill-name] skill," the skill handles the mechanics
- Focus on providing context and requirements, not process

**Plan first, implement second:**
- 60-70% of time should be planning
- Implementation is "just executing a good plan"
- Thorough planning prevents spaghetti code

**Quality gates are automatic:**
- Subagent-driven-development includes automatic reviews
- TDD enforces failing test first
- You don't manage quality gates - skills do

**Evidence over claims:**
- Run verification commands
- Show test output
- Prove it works before claiming completion

**YAGNI always:**
- Only implement what's needed now
- Ruthlessly remove unnecessary features
- Simplicity is hard work but worth it

---

## Common Anti-Patterns

**❌ "Let me just quickly code this without planning"**
→ Results in spaghetti code, takes longer to fix than planning would have

**❌ "I'll write tests after I get it working"**
→ Tests written after never fail, prove nothing

**❌ "This is too simple to need a skill"**
→ Skills exist because simple things become complex

**❌ "I remember what the skill does, I'll just do it myself"**
→ Skills evolve, you'll miss updates and best practices

**❌ "Quality gates are slowing me down"**
→ Quality gates catch issues early when they're cheap to fix

**❌ "Let's skip the review, we're in a hurry"**
→ Shipping bugs to production takes more time than reviewing

---

## Prompt Anatomy

Good prompts have these elements:

1. **Skill invocation:** "Use your [skill-name] skill"
2. **Context:** What you're building and why
3. **Requirements:** Specific needs and constraints
4. **Standards:** Code quality expectations
5. **Principles:** YAGNI, KISS, SINE, DMMT

**Example:**
```
"Use your brainstorming skill to design [PROJECT].  ← Skill invocation

PROBLEM: [Context about problem]                    ← Context

REQUIREMENTS:                                       ← Requirements
- [Requirement 1]

PRINCIPLES TO FOLLOW:                               ← Principles
- YAGNI: Only MVP features"
```

---

## Getting Help

**If skill doesn't activate:**
- Check you said "use your [skill-name] skill"
- Verify superpowers plugin is installed
- Try explicit slash command: `/superpowers:brainstorm`

**If unsure which skill to use:**
- Planning phase → brainstorming or writing-plans
- Implementation → subagent-driven-development or test-driven-development
- Review → requesting-code-review
- Bug fixing → systematic-debugging

**If skill isn't doing what you expect:**
- Provide more context in your prompt
- Check you're not micromanaging the workflow
- Trust the skill - it knows its process

---

## Customizing Prompts

**Adapt these templates by:**
- Replacing [PLACEHOLDERS] with your project details
- Adding project-specific requirements
- Adjusting standards for your tech stack
- Including domain-specific constraints

**Keep the core structure:**
- Always invoke the skill explicitly
- Always include context and requirements
- Always specify quality standards
- Always mention relevant principles

---

**Remember:** These aren't magic spells. They're structured ways to invoke proven workflows. The "magic" comes from systematic processes applied consistently.

**Master these prompts → Build maintainable apps fast → Ship with confidence.**
