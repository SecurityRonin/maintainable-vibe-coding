# Recording Guide: Building TeamTask for Tutorial

This guide explains how to build the TeamTask tutorial app while capturing the entire process for readers to follow.

## Recording Setup

### Required Tools

1. **Screen Recording:**
   - macOS: QuickTime Player or Screenshot app (Cmd+Shift+5)
   - Windows: Xbox Game Bar (Win+G) or OBS Studio
   - Linux: OBS Studio or SimpleScreenRecorder
   - **Alternative:** Loom (easiest, cloud-hosted)

2. **Screenshot Tool:**
   - macOS: Screenshot app (Cmd+Shift+4)
   - Windows: Snipping Tool
   - Linux: Flameshot
   - **Alternative:** Browser extension (Awesome Screenshot, Nimbus)

3. **Annotation Tool:**
   - Skitch (macOS/Windows)
   - Snagit (paid, best quality)
   - GIMP (free, more complex)
   - Canva (web-based, simple)

### Recording Strategy

**For each tutorial step:**

1. **Start screen recording** before beginning
2. **Build the feature** using Claude Code
3. **Test the feature** in browser
4. **Stop recording**
5. **Upload to Loom** or save locally
6. **Extract key screenshots** from recording
7. **Annotate screenshots** with arrows/highlights
8. **Document commands and outputs** in markdown

## What to Record for Each Step

### Step 1: Project Setup

**Screen recording should show:**
- Opening terminal
- Running `npx create-next-app@latest`
- Answering prompts
- Opening project in VS Code/editor
- Running `npm run dev`
- Browser showing default Next.js page

**Screenshots needed:**
1. Terminal with create-next-app command
2. Prompts and answers
3. VS Code showing project structure
4. Browser showing "Welcome to Next.js"

**Annotations:**
- Circle/highlight the terminal commands
- Arrow pointing to important prompts
- Box around project structure in VS Code

### Step 2: Supabase Setup

**Screen recording should show:**
- Going to supabase.com
- Creating new project
- Waiting for provisioning
- Opening SQL Editor
- Pasting schema
- Running SQL
- Checking Tables view
- Opening Authentication settings

**Screenshots needed:**
1. Supabase "New Project" screen with form filled
2. SQL Editor with schema
3. Tables view showing all tables
4. Authentication settings page
5. API settings with keys (blur the keys!)

**Annotations:**
- Arrow to "New Project" button
- Highlight project name field
- Circle "SQL Editor" in sidebar
- Arrow to "Run" button in SQL Editor
- Box around table names in Tables view
- Red rectangle covering sensitive keys
- Arrow to "Copy" button for safe values

### Step 3: v0 Design Generation

**Screen recording should show:**
- Going to v0.dev
- Typing first prompt (dashboard)
- Waiting for generation
- Reviewing generated code
- Clicking "Copy Code"
- Pasting into project
- Repeat for each component

**Screenshots needed:**
1. v0.dev homepage
2. Prompt text entered
3. Generated preview
4. Code panel with copy button
5. VS Code with pasted code

**Annotations:**
- Highlight the prompt text
- Arrow to "Generate" button
- Circle the preview area
- Arrow to "Copy Code" button
- Highlight filename in VS Code

### Step 4: Connecting Frontend to Supabase

**Screen recording should show:**
- Terminal: Installing Supabase packages
- Claude Code conversation: Asking for Supabase client setup
- Claude Code: Creating client files
- Adding .env.local with keys
- Testing connection

**Screenshots needed:**
1. Terminal with npm install command
2. Claude Code prompt in action
3. Generated files in VS Code
4. .env.local with keys (blur values!)
5. Browser console showing successful connection

**Annotations:**
- Highlight package names in terminal
- Arrow to Claude Code prompt box
- Circle generated file names
- Red boxes over secret values
- Green checkmark on console success

### Step 5: Authentication Flow

**Screen recording should show:**
- Claude Code: "Build login page with email/password"
- Generated code
- Testing login in browser
- Successful redirect to dashboard
- Logout flow
- OAuth setup

**Screenshots needed:**
1. Claude Code prompt
2. Login page UI
3. Browser DevTools Network tab showing auth request
4. Dashboard after successful login
5. Supabase auth dashboard showing user

**Annotations:**
- Highlight key parts of prompt
- Arrow to form fields
- Circle network request status (200)
- Box around user info in dashboard
- Highlight user email in Supabase

### Step 6: Teams and Tasks

**Screen recording should show:**
- Claude Code: Building teams CRUD
- Testing create team
- Claude Code: Building tasks CRUD
- Testing create task
- Checking Supabase Table Editor

**Screenshots needed:**
1. Teams creation form
2. Team created successfully message
3. Task creation form
4. Task list showing new task
5. Supabase Table Editor with data

**Annotations:**
- Arrow to form submit button
- Circle success toast/message
- Highlight new task in list
- Arrow to data rows in Supabase

### Step 7: Real-time Features

**Screen recording should show:**
- Opening two browser windows side-by-side
- User 1 creates task
- User 2 sees it appear instantly
- User 2 updates task
- User 1 sees update

**Screenshots needed:**
1. Two browser windows setup
2. Before: User 1 has task form open, User 2 sees empty list
3. After: User 1 submitted, User 2 shows new task
4. Supabase Realtime Inspector showing subscription

**Annotations:**
- Label windows "User 1" and "User 2"
- Arrow showing action flow (create → appears)
- Highlight the new task in both windows
- Circle active subscription in Supabase

### Step 8: Kanban Board

**Screen recording should show:**
- Drag task from "To Do" to "In Progress"
- Task updates position smoothly
- Other window shows task in new column
- Supabase Table Editor shows status change

**Screenshots needed:**
1. Before: Task in "To Do" column
2. During: Task being dragged (cursor visible)
3. After: Task in "In Progress" column
4. Real-time update in second window

**Annotations:**
- Arrow showing drag direction
- Circle the task being moved
- Highlight new column
- Box around updated task in other window

### Step 9: Testing

**Screen recording should show:**
- Claude Code: "Write tests for auth flow"
- Generated test file
- Terminal: Running tests
- All tests passing
- Claude Code: "Write E2E test for task creation"
- Terminal: Running Playwright
- E2E test passing

**Screenshots needed:**
1. Claude Code generating test
2. Test file in VS Code
3. Terminal with test output (all green)
4. Playwright test running in browser
5. Playwright test results

**Annotations:**
- Highlight test descriptions
- Circle pass/fail indicators
- Arrow to test execution time
- Box around "All tests passed"

### Step 10: Deployment

**Screen recording should show:**
- Connecting GitHub repo to Vercel
- Importing project
- Adding environment variables
- Deploying
- Waiting for deployment
- Visiting production URL
- Testing production app

**Screenshots needed:**
1. Vercel "Import Project" screen
2. Environment variables form
3. Deployment in progress
4. Deployment successful
5. Production app running

**Annotations:**
- Arrow to "Import" button
- Highlight each env var name
- Circle deployment status
- Box around production URL
- Green checkmark on successful deploy

### Step 11: Post-Deployment

**Screen recording should show:**
- Checking Vercel logs
- Testing all features in production
- Checking Supabase production usage
- Making a change and seeing auto-deploy

**Screenshots needed:**
1. Vercel deployment logs
2. Production app with real data
3. Supabase dashboard showing requests
4. Git commit triggering auto-deploy

**Annotations:**
- Highlight important log entries
- Circle deployed features
- Arrow to usage metrics
- Timeline showing commit → deploy

## Recording Best Practices

### Do's:

✅ **Hide sensitive information:**
- Blur API keys and secrets
- Use fake email addresses in demos
- Redact personal information

✅ **Keep recordings focused:**
- 5-10 minutes max per video
- One topic per video
- Edit out long waits/errors

✅ **Show the full context:**
- Include terminal output
- Show file structure
- Display browser URL
- Keep Claude Code visible

✅ **Add voiceover or captions:**
- Explain what you're doing
- Point out important details
- Mention common pitfalls

✅ **Test the recording quality:**
- Check audio levels
- Verify screen is readable
- Ensure cursor is visible

### Don'ts:

❌ **Don't rush:**
- Take time to show each step
- Let animations complete
- Give readers time to read

❌ **Don't skip errors:**
- Show real debugging process
- Demonstrate how to fix issues
- This is valuable learning!

❌ **Don't assume knowledge:**
- Explain why you're doing things
- Show alternative approaches
- Point out best practices

❌ **Don't use default passwords:**
- Even in demos, use strong passwords
- Show password manager usage
- Teach security from start

## File Organization

```
examples/teamtask/
├── README.md                    # Project overview
├── .env.example                 # Template for env vars
├── docs/
│   ├── recordings/
│   │   ├── 01-project-setup.mp4
│   │   ├── 02-supabase-setup.mp4
│   │   ├── 03-v0-generation.mp4
│   │   ├── 04-connect-supabase.mp4
│   │   ├── 05-auth-flow.mp4
│   │   ├── 06-teams-tasks.mp4
│   │   ├── 07-realtime.mp4
│   │   ├── 08-kanban.mp4
│   │   ├── 09-testing.mp4
│   │   ├── 10-deployment.mp4
│   │   └── 11-post-deploy.mp4
│   ├── screenshots/
│   │   ├── 01-setup/
│   │   │   ├── 01-terminal-create-next.png
│   │   │   ├── 02-vscode-structure.png
│   │   │   └── 03-browser-welcome.png
│   │   ├── 02-supabase/
│   │   │   ├── 01-new-project.png
│   │   │   ├── 02-sql-editor.png
│   │   │   └── 03-tables-view.png
│   │   └── ... (for each step)
│   └── BUILD-LOG.md             # Detailed build notes
├── src/                         # Next.js app
└── package.json
```

## Markdown Documentation Template

For each step, create a markdown file with this structure:

```markdown
# Step X: [Step Name]

**Estimated time:** X minutes

**What you'll build:**
- Feature 1
- Feature 2

**Prerequisites:**
- Completed Step X-1
- Have [tool] installed

## Overview

[Brief explanation of what this step accomplishes]

## Video Walkthrough

[Embed Loom video or link to recording]

## Step-by-Step Instructions

### X.1 [Sub-step name]

**What to do:**
1. Open your terminal
2. Run this command:

{lang=bash}
```
npm install @supabase/supabase-js
```

**Expected output:**
```
added 5 packages in 3s
```

**Screenshot:**
![Terminal showing npm install](../screenshots/XX-terminal-install.png)

**Ask Claude Code:**
```
"Create a Supabase client helper for Next.js app directory"
```

**Claude Code will create:**
- `lib/supabase/client.ts`
- `lib/supabase/server.ts`

**Verify it worked:**
- [ ] Files created in lib/supabase/
- [ ] No TypeScript errors
- [ ] Can import from @/lib/supabase/client

### X.2 [Next sub-step]

[Continue pattern...]

## Common Issues

**Problem:** "Module not found: @supabase/supabase-js"

**Solution:** Run `npm install @supabase/supabase-js`

## What You Learned

- How to [skill 1]
- Why [concept] matters
- When to use [tool]

## Next Step

Proceed to [Step X+1: Next Step Name](./step-X+1.md)
```

## Quality Checklist

Before publishing each tutorial step:

- [ ] Recording is clear and focused
- [ ] Audio is audible (if using voiceover)
- [ ] All sensitive data is redacted
- [ ] Screenshots are annotated
- [ ] Markdown documentation is complete
- [ ] Commands are copy-pasteable
- [ ] Expected outputs are shown
- [ ] Common errors are documented
- [ ] Verification steps are included
- [ ] Links to next step work

## Next Steps

1. Set up recording environment
2. Build TeamTask following TUTORIAL-PLAN.md
3. Record each step as you build
4. Extract screenshots and annotate
5. Write markdown documentation
6. Review and edit recordings
7. Upload to Loom or hosting
8. Embed in tutorial chapters
9. Test tutorial by following your own instructions
10. Gather feedback and iterate

## Resources

**Screen Recording:**
- Loom: https://www.loom.com/
- OBS Studio: https://obsproject.com/

**Annotation:**
- Skitch: https://evernote.com/products/skitch
- Snagit: https://www.techsmith.com/screen-capture.html

**Video Editing:**
- DaVinci Resolve (free): https://www.blackmagicdesign.com/products/davinciresolve
- Camtasia (paid): https://www.techsmith.com/video-editor.html

**Hosting:**
- Loom (easiest integration)
- YouTube (unlisted videos)
- Vimeo (professional)
- Self-host (full control)
