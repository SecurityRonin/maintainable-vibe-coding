# Manuscript Structure for Maintainable Vibe Coding

This document defines the complete book structure and chapter organization.

## Book Organization

### Part 1: Introduction (4 chapters)
- **Chapter 1:** What is Maintainable Vibe Coding?
- **Chapter 2:** Why This Workflow Works
- **Chapter 3:** What You'll Build
- **Chapter 4:** Setup and Prerequisites

### Part 2: The Five-Phase Workflow (5 chapters)
- **Chapter 5:** Phase 1 - Design with v0
- **Chapter 6:** Phase 2 - Infrastructure with Supabase
- **Chapter 7:** Phase 3 - GitHub Setup and Workflow
- **Chapter 8:** Phase 4 - Local Development with Claude Code
- **Chapter 9:** Phase 5 - Deployment to Production

### Part 3: Complete Tutorial - ReadStack (7 chapters)
- **Chapter 10:** ReadStack Overview and Setup
- **Chapter 11:** Planning Architecture (30 min)
- **Chapter 12:** Creating Implementation Plan (20 min)
- **Chapter 13:** Designing UI with v0 (20 min)
- **Chapter 14:** Setting Up Supabase (20 min)
- **Chapter 15:** Implementation with Quality Gates (60 min)
- **Chapter 16:** Deployment and Testing (20 min)

### Part 4: Complete Tutorial - TeamTask (11 chapters)
- **Chapter 17:** TeamTask Overview and Architecture
- **Chapter 18:** Planning Multi-Tenancy (45 min)
- **Chapter 19:** Authentication and Teams (45 min)
- **Chapter 20:** Task Management Core (45 min)
- **Chapter 21:** Real-Time Collaboration (30 min)
- **Chapter 22:** Kanban Board with Drag-and-Drop (30 min)
- **Chapter 23:** Team Permissions (30 min)
- **Chapter 24:** E2E Testing with Playwright (30 min)
- **Chapter 25:** Advanced Features (45 min)
- **Chapter 26:** Deployment and Monitoring (20 min)
- **Chapter 27:** TeamTask Retrospective

### Part 5: Best Practices (5 chapters)
- **Chapter 28:** Project Prompt Templates
- **Chapter 29:** Superpowers Skills Deep Dive
- **Chapter 30:** Common Patterns and Solutions
- **Chapter 31:** Debugging Workflows
- **Chapter 32:** Performance Tips

### Part 6: Advanced Topics (5 chapters)
- **Chapter 33:** Custom Superpowers Skills
- **Chapter 34:** Monorepo Setup
- **Chapter 35:** Team Workflows
- **Chapter 36:** Cost Optimization
- **Chapter 37:** Scaling Your Apps

## Writing Guidelines

### Voice and Tone
- **Conversational but professional:** Like talking to a smart friend
- **Action-oriented:** Focus on what to do, not theory
- **Encouraging but honest:** Show what's possible, acknowledge challenges
- **No fluff:** Every sentence serves the reader

### Chapter Structure Template

```markdown
# Chapter X: [Title]

[1-2 paragraph introduction: What you'll do, why it matters, time required]

## [Section 1]

[Clear instruction or explanation]

[Code/command block if needed]

[Expected result]

## [Section 2]

[Continue pattern...]

## What You Learned

[3-5 bullet points summarizing key takeaways]

## Next Steps

[Bridge to next chapter]
```

### Code Examples
- **Always copy-paste ready:** No pseudo-code
- **Include expected output:** Show what success looks like
- **Explain non-obvious parts:** Brief inline comments
- **Test everything:** All code must actually work

### Commands and Prompts
- **Use code blocks:** Distinct from regular text
- **Include descriptions:** What the command does
- **Show output:** What you should see
- **Troubleshoot common errors:** Brief "If you see X, do Y"

### Screenshots and Videos
- **Screenshot every key step:** Visual confirmation for readers
- **Annotate when helpful:** Arrows, highlights, circles
- **Keep videos short:** 2-5 minutes per concept
- **Show real workflows:** Actual screen recordings, not demos

## Conversion Process: Tutorial Plan → Manuscript

### From Tutorial Plan Document
**READSTACK-TUTORIAL-PLAN.md** contains:
- Detailed teaching notes
- Pro tips and philosophy
- Screenshot locations
- Video planning notes
- Behind-the-scenes explanations

### To Manuscript Chapter
**manuscript/chapterXX.md** should have:
- Essential steps only
- Copy-paste commands
- Expected results
- Minimal explanation
- Action-focused narrative

### Example Conversion

**Tutorial Plan:**
```
**Pro tips:**
- Answer questions honestly - the skill guides you to the right design
- Don't rush - thorough planning saves implementation time
- If you're unsure, the skill will propose options and explain trade-offs
- The design document becomes your roadmap
```

**Manuscript:**
```
Answer Claude's questions honestly. Take your time - 30 minutes of planning
saves hours of debugging later.

You'll get a design document. This is your roadmap.
```

## Chapter Status Tracking

### Part 1: Introduction
- [ ] Chapter 1: What is Maintainable Vibe Coding?
- [ ] Chapter 2: Why This Workflow Works
- [ ] Chapter 3: What You'll Build
- [ ] Chapter 4: Setup and Prerequisites

### Part 2: Five-Phase Workflow
- [ ] Chapter 5: Phase 1 - Design with v0
- [ ] Chapter 6: Phase 2 - Infrastructure with Supabase
- [ ] Chapter 7: Phase 3 - GitHub Setup
- [ ] Chapter 8: Phase 4 - Claude Code Development
- [ ] Chapter 9: Phase 5 - Deployment

### Part 3: ReadStack Tutorial
- [x] Chapter 10-16: Complete ReadStack tutorial (sample created)
- [ ] Need to split sample into individual chapters
- [ ] Need to add screenshots
- [ ] Need to record videos

### Part 4: TeamTask Tutorial
- [ ] Chapter 17-27: All TeamTask chapters
- [ ] Convert TUTORIAL-PLAN.md to manuscript chapters
- [ ] Add screenshots
- [ ] Record videos

### Part 5: Best Practices
- [x] Chapter 29: Superpowers Skills (MAGIC-PROMPTS-CHEATSHEET.md created)
- [ ] Chapter 28: Project Prompt Templates
- [ ] Chapter 30: Common Patterns
- [ ] Chapter 31: Debugging Workflows
- [ ] Chapter 32: Performance Tips

### Part 6: Advanced Topics
- [ ] Chapter 33-37: All advanced chapters

## File Naming Convention

### Manuscript Files
```
manuscript/
  chapter01-what-is-maintainable-vibe-coding.md
  chapter02-why-this-workflow-works.md
  chapter03-what-youll-build.md
  ...
  chapter10-readstack-overview.md
  chapter11-readstack-planning.md
  ...
```

### Supporting Files
```
resources/
  images/
    chapter10/
      step1-v0-signup.png
      step2-claude-install.png
      ...
    chapter11/
      brainstorming-prompt.png
      design-questions.png
      ...
  videos/
    chapter10-setup-walkthrough.mp4
    chapter11-architecture-planning.mp4
    ...
```

## Leanpub Configuration

### Book.txt (defines chapter order)
```
frontmatter.md
chapter01-what-is-maintainable-vibe-coding.md
chapter02-why-this-workflow-works.md
...
chapter37-scaling-your-apps.md
backmatter.md
```

### Sample.txt (free preview - first 2 chapters)
```
frontmatter.md
chapter01-what-is-maintainable-vibe-coding.md
chapter02-why-this-workflow-works.md
```

### Subset.txt (optional - alternate versions)
```
# Not used for this book
```

## Next Steps

### Immediate (This Week)
1. ✅ Create sample ReadStack chapter
2. ✅ Create Magic Prompts Cheat Sheet
3. ✅ Document manuscript structure
4. [ ] Create Chapter 4: Setup and Prerequisites (standalone)
5. [ ] Split sample ReadStack into Chapters 10-16

### Short-term (Next 2 Weeks)
1. [ ] Write Part 1: Introduction (Chapters 1-3)
2. [ ] Write Part 2: Five-Phase Workflow (Chapters 5-9)
3. [ ] Refine ReadStack tutorial chapters
4. [ ] Begin TeamTask tutorial conversion

### Medium-term (Next Month)
1. [ ] Complete TeamTask tutorial (Chapters 17-27)
2. [ ] Write Best Practices (Chapters 28-32)
3. [ ] Capture all screenshots
4. [ ] Record all videos

### Long-term (Next 2 Months)
1. [ ] Write Advanced Topics (Chapters 33-37)
2. [ ] Technical review
3. [ ] Beta reader feedback
4. [ ] Final polish and publish

## Writing Velocity Target

- **Goal:** 1-2 chapters per day
- **Each chapter:** 1,500-3,000 words
- **Total book:** ~60,000-80,000 words
- **Timeline:** 6-8 weeks draft, 2-4 weeks revision

## Quality Standards

### Every Chapter Must Have
- [ ] Clear learning objective
- [ ] Step-by-step instructions
- [ ] Copy-paste ready code
- [ ] Expected outputs shown
- [ ] Common pitfalls addressed
- [ ] "What You Learned" summary
- [ ] Bridge to next chapter

### Technical Accuracy
- [ ] All code tested and working
- [ ] All commands verified
- [ ] All URLs valid
- [ ] All screenshots current
- [ ] All videos accurate

### Reader Experience
- [ ] No unexplained jargon
- [ ] Progressive complexity
- [ ] Frequent wins (every 10-15 min)
- [ ] Troubleshooting help
- [ ] Encouragement throughout

---

**This structure serves as the roadmap for completing the book.**
