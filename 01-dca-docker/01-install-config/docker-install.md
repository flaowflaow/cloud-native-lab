# 🐳 Docker Engine – Installation on Linux (Ubuntu/Debian)

## 📌 Introduction

This document describes the **official and recommended procedure** for installing Docker Engine on a Linux system (Ubuntu/Debian).

This setup is aligned with **Docker Certified Associate (DCA)** exam requirements and production best practices.

---

## 🎯 Objectives

- Install Docker Engine from the official Docker repository
- Enable and verify the Docker service
- Allow non-root users to run Docker commands
- Validate the installation with test containers

---

## 📋 Prerequisites

- Ubuntu / Debian-based distribution
- sudo privileges
- Internet access

---

## 🧹 1. Remove Old Versions (if any)

```bash
sudo apt remove docker docker-engine docker.io containerd runc -y
```

---

## 📥 2. Install Required Packages

```bash
sudo apt update
sudo apt install -y 
    ca-certificates 
    curl 
    gnupg 
    lsb-release
```

---

## 🔑 3. Add Docker’s Official GPG Key

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | 
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

---

## 📦 4. Set Up the Docker Repository

```bash
echo 
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] 
  https://download.docker.com/linux/ubuntu 
  $(lsb_release -cs) stable" | 
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Update package index:

```bash
sudo apt update
```

---

## 🐳 5. Install Docker Engine

```bash
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

---

## ▶️ 6. Enable and Start Docker

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

Check status:

```bash
systemctl status docker
```

---

## 👤 7. Run Docker as a Non-Root User

Add your user to the `docker` group:

```bash
sudo usermod -aG docker $USER
```

Apply group changes (log out/in or):

```bash
newgrp docker
```

---

## ✅ 8. Verify Installation

```bash
docker version
docker info
```

Run a test container:

```bash
docker run hello-world
```

Expected result: Docker pulls the image and prints a confirmation message.

---

## 🧠 DCA Exam Notes

- You **must know** how to install Docker from the official repository
- Understand the role of:
  - `docker.service`
  - `containerd`
- Know why Docker should not be run as root in production

---

## ❌ Common Mistakes

- Installing Docker from default OS repositories (outdated versions)
- Forgetting to add the user to the `docker` group
- Not enabling the Docker service on boot

---

## 📚 References

- Docker official documentation
