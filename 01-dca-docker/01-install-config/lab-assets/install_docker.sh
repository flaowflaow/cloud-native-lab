#!/bin/bash

# ==============================================================================
# SCRIPT : Automated Docker Engine Installation
# DESCRIPTION : Install Docker CE on Ubuntu/Debian with production standards.
# MILESTONE : DCA Week 1 / Hours 4-7
# ==============================================================================

# Arrêter le script à la moindre erreur
set -e

echo "--- 🛠️ Starting Docker Installation ---"

# 1. Update existing packages
# Important for DCA: Ensure the host OS is up to date before installing the runtime.
sudo apt-get update -y

# 2. Install prerequisites
# ca-certificates & gnupg are required for secure communication with Docker repos.
sudo apt-get install -y ca-certificates curl gnupg

# 3. Add Docker’s official GPG key
# Security check: Ensuring the software we download is signed by Docker Inc.
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 4. Set up the repository
# We use $(lsb_release -cs) to dynamically get the Ubuntu version name.
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. Install Docker Engine, CLI, and Containerd
# DCA Key Note: Docker-CE is the engine, Containerd is the low-level runtime.
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 6. Apply our custom daemon.json (if available)
# Moving our architecture from default to hardened.
if [ -f "./daemon-json/daemon.json" ]; then
    echo "--- ⚙️ Applying custom daemon.json ---"
    sudo cp ./daemon-json/daemon.json /etc/docker/daemon.json
    sudo systemctl restart docker
else
    echo "--- ⚠️ Warning: daemon.json not found, skipping config ---"
fi

echo "--- ✅ Installation Complete! ---"
docker --version