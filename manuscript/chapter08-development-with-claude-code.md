# Chapter 8: Phase 4 - Development with Claude Code

You have v0 designs. You have Supabase backend. You have GitHub ready. Now it's time to code.

This chapter teaches AI-assisted development: fast AND maintainable.

## What is Claude Code + Superpowers?

**Claude Code** is Anthropic's CLI tool for development with Claude AI.

Command-line tool with deep codebase integration:
- Reads your entire project
- Modifies multiple files
- Runs tests
- Reviews code
- Creates plans

**Superpowers** is a skill system that enforces quality workflows.

**Without Superpowers:**
```
You: "Build authentication"
Claude: *generates 500 lines*
You: "Does it work?"
Claude: "Probably?"
```

**With Superpowers:**
```
You: "Use brainstorming skill for authentication"
→ Guides architecture questions
→ Proposes approaches with trade-offs
→ You choose
→ Generates design document

You: "Use writing-plans skill"
→ Breaks design into bite-sized tasks
→ Includes TDD for each task
→ Creates implementation plan

You: "Use subagent-driven-development"
→ Spawns subagent per task
→ Enforces TDD (test first!)
→ Runs code review after each task
→ Blocks on critical issues
→ Delivers quality-gated implementation
```

**Difference:** "Hopefully works" → "Proven to work"

## The Three Core Skills

### Skill 1: Brainstorming (30 min)

**Purpose:** Design architecture before coding.

**Process:**
1. Asks clarifying questions
2. Proposes 2-3 approaches
3. Explains trade-offs
4. You choose
5. Generates design document

**Output:** `docs/plans/YYYY-MM-DD-readstack-design.md`

**For ReadStack:** Decides on data model, component architecture, security approach.

### Skill 2: Writing-Plans (20 min)

**Purpose:** Break design into executable tasks.

**Process:**
1. Reads design document
2. Creates bite-sized tasks (2-5 min each)
3. Adds TDD approach to each
4. Includes exact code examples
5. Orders tasks logically

**Output:** `docs/plans/YYYY-MM-DD-readstack-implementation.md`

**For ReadStack:** 15 tasks, each with test-first approach and verification steps.

### Skill 3: Subagent-Driven-Development (60 min)

**Purpose:** Execute plan with quality gates.

**Process:**
1. Reads implementation plan
2. Spawns separate subagent for each task
3. Each subagent follows TDD:
   - Write failing test
   - Write code to pass
   - Refactor
4. Automatic code review after each task
5. Critical issues block progress
6. Final comprehensive review

**Output:** Complete, tested, reviewed implementation.

**For ReadStack:** 15 tasks executed, each with tests passing and code reviewed.

## Quality Gates

**Quality gate = automatic checkpoint that blocks bad code**

**After each task, checks for:**

**Critical (blocks progress):**
- Security vulnerabilities
- Code doesn't compile
- Tests failing
- Data loss possible

**Important (noted):**
- Performance problems
- Missing error handling

**Minor (optional):**
- Naming improvements
- Documentation

**For ReadStack:** Critical issues fixed automatically. Important/Minor noted but don't block.

## TDD Enforcement

**Rule:** No production code without failing test first.

**TDD Cycle:**

**1. Red (Write failing test):**
```typescript
it('should create user account', async () => {
  const result = await signup('test@example.com', 'password123')
  expect(result.success).toBe(true)
})
```

Run test: ❌ Fails (signup doesn't exist)

**2. Green (Write minimal code):**
```typescript
export async function signup(email: string, password: string) {
  const { data, error } = await supabase.auth.signUp({ email, password })
  if (error) return { success: false, error }
  return { success: true, user: data.user }
}
```

Run test: ✅ Passes

**3. Refactor (Clean up):**
Add validation, extract functions, improve code.

Run test: ✅ Still passes

**Superpowers enforces:** Test fails first, code second, always.

## The Development Workflow

**Phase 1: Architecture (30 min)**
- Use brainstorming skill
- Answer questions about requirements
- Choose approach
- Get design document

**Phase 2: Planning (20 min)**
- Use writing-plans skill
- Get implementation plan with tasks
- Review and approve

**Phase 3: Implementation (60 min)**
- Use subagent-driven-development skill
- Each task: TDD + code review
- Fix critical issues
- Get complete implementation

**For ReadStack:** 30 + 20 + 60 = 110 minutes total.

**Traditional approach:** 2-3 weeks.

## You Make Decisions, AI Implements

**You're the architect:**
- Choose architectural approaches
- Make technology decisions
- Approve plans
- Override AI suggestions when needed

**AI is your assistant:**
- Implements your decisions
- Writes tests and code
- Reviews code
- Catches bugs

**Example:**
```
Subagent: "I'll use client-side state for articles"
You: "No, use Server Components and server actions"
Subagent: "Updating approach..."
```

You have final say.

## Cost

**Claude Pro:** $20/month (required for Claude Code)

**What you get:**
- Unlimited conversations
- Extended context (200k tokens)
- Superpowers skills
- Priority access

**For ReadStack:** $20 covers entire build (2h 50min).

## What You Learned

**Claude Code = AI pair programmer**
Deep codebase integration, runs tests, reviews code.

**Superpowers = Process enforcement**
Brainstorming → Planning → Quality-gated execution.

**Three skills:**
1. Brainstorming (architecture)
2. Writing-plans (tasks)
3. Subagent-driven-development (implementation)

**Quality gates prevent spaghetti code**
Automatic review catches issues early.

**TDD enforced, not optional**
Test fails first, code second, always.

**You decide, AI implements**
Architecture choices are yours.

**For ReadStack:** 110 minutes of work = 2-3 weeks traditional.

## Next Steps

Chapter 9 teaches deployment to Vercel: zero-config, automatic CI/CD.

After that, you're ready for the ReadStack tutorial (Chapters 10-16) where you'll use everything you've learned.
