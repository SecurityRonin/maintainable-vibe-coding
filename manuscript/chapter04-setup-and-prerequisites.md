# Chapter 4: Setup and Prerequisites

You need accounts and tools before starting. This chapter walks you through everything.

**Time required:** 30-45 minutes

**Cost:** Mostly free. Claude Pro is $20/month.

**What you're setting up:**
- v0 (UI generation)
- Supabase (backend)
- Vercel (hosting)
- Claude Pro + Code CLI
- Superpowers plugin
- Node.js and Git

Let's do this.

---

## Create Your v0 Account

v0 turns text descriptions into React components. You'll use it to generate your app's UI.

### Sign Up

1. Go to [v0.dev](https://v0.dev)
2. Click "Sign up" (top right)
3. Click "Continue with GitHub"
4. Authorize v0 to access your GitHub account
5. Done

**Cost:** Free tier includes 200 credits/month. Each UI generation costs ~10 credits. That's 20 designs per month free.

![Screenshot: v0 signup page](#placeholder-v0-signup)

### Test It

Let's make sure it works:

1. Click "New" (big button in center)
2. Type: "Create a login form with email and password"
3. Click "Generate"
4. Wait 10-20 seconds
5. You should see a beautiful login form

![Screenshot: v0 first generation](#placeholder-v0-first-generation)

If you see the form, you're good. Don't export it yet - this was just a test.

---

## Create Your Supabase Account

Supabase gives you a PostgreSQL database, authentication, and real-time subscriptions. No backend code needed.

### Sign Up

1. Go to [supabase.com](https://supabase.com)
2. Click "Start your project" (top right)
3. Click "Continue with GitHub"
4. Authorize Supabase
5. Done

**Cost:** Free tier includes 2 projects with 500MB database each. More than enough for learning.

![Screenshot: Supabase signup](#placeholder-supabase-signup)

### Create a Test Project

Let's verify it works:

1. Click "New project"
2. Choose any organization (or create one)
3. Name: "test"
4. Database Password: Click "Generate a password" and copy it somewhere safe
5. Region: Choose closest to you
6. Click "Create new project"
7. Wait 2-3 minutes

You'll see a dashboard when ready.

![Screenshot: Supabase project created](#placeholder-supabase-dashboard)

You can delete this test project later. For now, it proves your account works.

---

## Create Your Vercel Account

Vercel hosts your app. Every git push automatically deploys.

### Sign Up

1. Go to [vercel.com](https://vercel.com)
2. Click "Sign Up"
3. Click "Continue with GitHub"
4. Authorize Vercel
5. Done

**Cost:** Free tier includes unlimited projects and deployments.

![Screenshot: Vercel signup](#placeholder-vercel-signup)

That's it. You won't create a project yet - you'll do that when deploying ReadStack.

---

## Get Claude Pro

You need Claude Pro to access Claude Code.

### Subscribe

1. Go to [claude.ai](https://claude.ai)
2. Sign in (or create account)
3. Click "Upgrade to Pro" (left sidebar)
4. Choose "Claude Pro" ($20/month)
5. Enter payment details
6. Subscribe

**What you get:**
- 5x more usage than free tier
- Access to Claude Code CLI
- Priority access during high traffic
- Early access to new features

![Screenshot: Claude Pro subscription](#placeholder-claude-pro)

### Verify Access

After subscribing:

1. Go to [claude.ai/code](https://claude.ai/code)
2. You should see "Download Claude Code"
3. If you see "Upgrade to Pro" instead, wait 5 minutes and refresh

You'll download the CLI in the next section.

---

## Install Claude Code CLI

Claude Code is a command-line tool for AI-assisted development. It runs on macOS and Linux. Windows users need WSL (Windows Subsystem for Linux).

### macOS Installation

**Requirements:** macOS 11 (Big Sur) or newer

Open Terminal and run:

```bash
curl -fsSL https://claude.ai/install.sh | sh
```

You'll see:
```
Downloading Claude Code...
Installing to /usr/local/bin/claude-code...
Installation complete!
```

**Verify:**
```bash
claude-code --version
```

You should see something like `claude-code 0.8.0`

![Screenshot: macOS installation](#placeholder-macos-install)

**Troubleshooting:**

If you see "command not found":
1. Close Terminal
2. Open new Terminal window
3. Try `claude-code --version` again

If still not working:
1. Run: `echo $PATH`
2. Check if `/usr/local/bin` is in the output
3. If not, add to your shell config:

**For zsh (default on modern macOS):**
```bash
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**For bash:**
```bash
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```

### Linux Installation

**Requirements:** Any modern Linux distribution

Open terminal and run:

```bash
curl -fsSL https://claude.ai/install.sh | sh
```

Installation is identical to macOS.

**Verify:**
```bash
claude-code --version
```

**Troubleshooting:**

Same as macOS. Check `~/.bashrc` or `~/.zshrc` if command not found.

### Windows Installation

**Windows users: You need WSL (Windows Subsystem for Linux).**

Claude Code doesn't run natively on Windows. WSL gives you a Linux environment inside Windows.

#### Step 1: Install WSL

Open PowerShell as Administrator (right-click Start → "Windows PowerShell (Admin)")

Run:
```powershell
wsl --install
```

You'll see:
```
Installing: Windows Subsystem for Linux
Installing: Ubuntu
```

**Restart your computer when prompted.**

After restart, Ubuntu opens automatically. You'll see:
```
Enter new UNIX username:
```

Choose a username (lowercase, no spaces): `yourname`

Then enter a password (you won't see characters as you type - that's normal).

![Screenshot: WSL installation](#placeholder-wsl-install)

#### Step 2: Update WSL

In the Ubuntu terminal:

```bash
sudo apt update
sudo apt upgrade -y
```

This takes 2-5 minutes.

#### Step 3: Install Claude Code in WSL

Now run the Linux installation:

```bash
curl -fsSL https://claude.ai/install.sh | sh
```

**Verify:**
```bash
claude-code --version
```

#### Using WSL

From now on, when instructions say "open terminal":
1. Press Windows key
2. Type "Ubuntu"
3. Press Enter

This opens your Linux terminal where Claude Code runs.

**Important:** Your Windows files are accessible at `/mnt/c/Users/YourName/`

Example:
```bash
cd /mnt/c/Users/YourName/Documents
mkdir projects
cd projects
```

![Screenshot: WSL Ubuntu terminal](#placeholder-wsl-terminal)

---

## Install Superpowers Plugin

Superpowers adds quality-gated workflows to Claude Code.

### Installation

Open terminal (or Ubuntu on Windows) and run:

```bash
claude-code
```

First time you run it:
1. You'll be asked to authenticate
2. A browser opens
3. Click "Authorize"
4. Return to terminal

You'll see the Claude Code prompt: `>`

Type:
```
/plugins install superpowers
```

Press Enter.

You'll see:
```
Installing plugin: superpowers
Fetching from https://github.com/obra/superpowers
Installing dependencies...
Plugin installed successfully
```

![Screenshot: Superpowers installation](#placeholder-superpowers-install)

**Verify:**
```
/plugins list
```

You should see:
```
Installed plugins:
- superpowers (from obra/superpowers)
```

Type `exit` to close Claude Code for now.

---

## Install Node.js

Node.js runs JavaScript on your computer. You need it for Next.js development.

### Check If You Have It

```bash
node --version
```

If you see a version like `v20.11.0` or higher, skip to the next section.

If you see "command not found", continue below.

### macOS Installation

**Method 1: Using Homebrew (Recommended)**

Install Homebrew first (if you don't have it):
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then install Node.js:
```bash
brew install node
```

**Method 2: Direct Download**

1. Go to [nodejs.org](https://nodejs.org)
2. Download "LTS" version (green button)
3. Open the .pkg file
4. Follow installer
5. Restart terminal

**Verify:**
```bash
node --version
npm --version
```

Both should show version numbers.

### Linux Installation

**Ubuntu/Debian:**
```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
```

**Fedora/RHEL:**
```bash
curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
sudo dnf install -y nodejs
```

**Verify:**
```bash
node --version
npm --version
```

### Windows (WSL) Installation

In your Ubuntu terminal:

```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
```

**Verify:**
```bash
node --version
npm --version
```

![Screenshot: Node.js version check](#placeholder-node-version)

---

## Install Git

Git tracks your code changes and syncs with GitHub.

### Check If You Have It

```bash
git --version
```

If you see a version like `git version 2.39.0` or higher, skip to the next section.

### macOS Installation

Git comes with Xcode Command Line Tools:

```bash
xcode-select --install
```

A dialog appears. Click "Install" and wait ~5 minutes.

**Verify:**
```bash
git --version
```

### Linux Installation

**Ubuntu/Debian:**
```bash
sudo apt install git -y
```

**Fedora/RHEL:**
```bash
sudo dnf install git -y
```

**Verify:**
```bash
git --version
```

### Windows (WSL) Installation

In Ubuntu terminal:

```bash
sudo apt install git -y
```

**Verify:**
```bash
git --version
```

### Configure Git

Everyone needs to do this:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Use the same email as your GitHub account.

![Screenshot: Git configuration](#placeholder-git-config)

---

## Install GitHub CLI (Optional but Recommended)

GitHub CLI makes creating repositories easier. This is optional - you can create repos through the website instead.

### macOS

```bash
brew install gh
```

### Linux

**Ubuntu/Debian:**
```bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh -y
```

**Fedora/RHEL:**
```bash
sudo dnf install gh -y
```

### Windows (WSL)

In Ubuntu terminal:

```bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh -y
```

### Authenticate

After installation:

```bash
gh auth login
```

Choose:
1. "GitHub.com"
2. "HTTPS"
3. "Login with a web browser"
4. Copy the code shown
5. Press Enter
6. Browser opens - paste the code
7. Authorize GitHub CLI

**Verify:**
```bash
gh auth status
```

You should see "Logged in to github.com"

![Screenshot: GitHub CLI authentication](#placeholder-gh-auth)

---

## Verify Everything

Let's confirm all tools work.

Run this in your terminal:

```bash
echo "=== System Check ==="
echo "Node.js: $(node --version)"
echo "npm: $(npm --version)"
echo "Git: $(git --version)"
echo "Claude Code: $(claude-code --version)"
echo "GitHub CLI: $(gh --version 2>/dev/null || echo 'Not installed (optional)')"
echo ""
echo "=== Superpowers Plugin ==="
claude-code -c "/plugins list"
```

You should see versions for everything (except GitHub CLI which is optional).

**Expected output:**
```
=== System Check ===
Node.js: v20.11.0
npm: 10.2.4
Git: git version 2.39.3
Claude Code: claude-code 0.8.0
GitHub CLI: gh version 2.40.1

=== Superpowers Plugin ===
Installed plugins:
- superpowers (from obra/superpowers)
```

![Screenshot: System verification](#placeholder-system-check)

---

## Account Verification Checklist

Before moving to the next chapter, verify you have:

**Accounts (should be logged in):**
- [ ] v0.dev account (GitHub login)
- [ ] Supabase account (GitHub login)
- [ ] Vercel account (GitHub login)
- [ ] Claude Pro subscription (can access claude.ai/code)
- [ ] GitHub account (for gh CLI if installed)

**Tools (should show versions):**
- [ ] `claude-code --version` works
- [ ] `node --version` shows v18+ or v20+
- [ ] `npm --version` works
- [ ] `git --version` works
- [ ] Superpowers plugin installed (check with `/plugins list` in Claude Code)
- [ ] Git configured with your name and email

**Optional but recommended:**
- [ ] `gh --version` works
- [ ] `gh auth status` shows logged in

If everything checks, you're ready for Chapter 10.

---

## Common Issues and Fixes

### "Command not found" after installation

**Fix:** Close terminal completely and open new one. Path changes require fresh terminal.

### Claude Code authentication fails

**Fix:** Go to [claude.ai](https://claude.ai), sign out, sign back in. Then run `claude-code` again.

### WSL is slow on Windows

**Fix:** Store your projects in Linux filesystem, not `/mnt/c/`:
```bash
cd ~
mkdir projects
cd projects
```

Don't use `C:\Users\YourName\projects` - it's slower through WSL.

### Superpowers plugin won't install

**Fix:**
```bash
claude-code
/plugins uninstall superpowers
/plugins install superpowers
```

If still failing, check your internet connection.

### npm permission errors on Linux/WSL

**Fix:** Don't use `sudo` with npm. Instead:
```bash
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

---

## What You Learned

You now have a complete development environment:
- v0 generates UI from text descriptions
- Supabase provides database and auth
- Vercel hosts your apps
- Claude Code CLI assists development with AI
- Superpowers enforces quality gates
- Node.js runs your Next.js apps
- Git tracks your code
- GitHub CLI (optional) simplifies repo creation

**Time invested:** 30-45 minutes

**Ready for:** Building ReadStack in Chapter 10

---

## Next: Building ReadStack

You've set up all the tools. Now you'll use them.

In Chapter 10, you'll build ReadStack - a personal "read later" app - in under 3 hours.

You'll learn the complete workflow:
- Planning architecture (30 min)
- Creating implementation plan (20 min)
- Designing UI with v0 (20 min)
- Setting up database (20 min)
- Implementing with quality gates (60 min)
- Deploying to production (20 min)

**Total:** ~170 minutes (2h 50min) from idea to deployed app.

The tools are ready. Let's build.
