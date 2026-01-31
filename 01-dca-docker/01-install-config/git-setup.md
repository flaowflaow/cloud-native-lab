# 🛠️ Git Installation & Configuration on Linux

## 📌 Introduction
This guide details the standard procedure for installing and configuring Git on a Linux distribution (Ubuntu/Debian). For the **Cloud-Native Lab**, Git is the backbone of our CI/CD workflow, allowing us to synchronize configurations between the development workstation and the runner/server.

---

## 📥 1. Installation

Update your local package index and install Git:

```bash
# Update repositories
sudo apt update

# Install Git
sudo apt install git -y

# Verify installation
git --version
```

## ⚙️ 2. Global Configuration

Set up your identity so that every commit is correctly attributed to you.

```bash
# Define your identity
git config --global user.name "DrLaBulle"
git config --global user.email "your-email@example.com"

# Set 'main' as the default branch name
git config --global init.defaultBranch main

# Verify settings
git config --list
```

## 🔑 3. SSH Authentication (Passwordless)

Using SSH keys is more secure and efficient than using HTTPS with Personal Access Tokens (PAT).

### Step 1: Generate a new SSH key

```bash
ssh-keygen -t ed25519 -C "your-email@example.com"
# Press Enter to accept the default file location
```

### Step 2: Add the key to the SSH agent

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### Step 3: Add the SSH key to GitHub

Display your public key:
    
```bash

cat ~/.ssh/id_ed25519.pub

# Copy the output (starting with ssh-ed25519).

# Go to GitHub > Settings > SSH and GPG keys > New SSH key.

# Give it a title (e.g., "Ubuntu-VM-Lab") and paste the key.

## Step 4: Test the connection

```bash

ssh -T git@github.com
# Expected output: "Hi DrLaBulle! You've successfully authenticated..."
```

## 🚀 4. Cloning the Lab

Now that authentication is set up, clone your repository using the SSH URL:
```bash

git clone git@github.com:flaowflaow/cloud-native-lab.git
cd cloud-native-lab
```
## 💡 Pro Tips for DevOps
### Line Endings Management

To avoid LF vs CRLF issues between Windows and Linux, ensure your Linux VM uses:

```bash
git config --global core.autocrlf input
```
### Useful Aliases

Speed up your workflow with these shortcuts:

```bash
git config --global alias.st status
git config --global alias.cm "commit -m"
git config --global alias.br branch
```

Last Updated: January 2026 Maintainer: DrLaBulle