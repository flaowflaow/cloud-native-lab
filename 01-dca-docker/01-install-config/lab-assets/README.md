# 🛠️ Lab Assets: Docker Configuration & Scripts

This directory centralizes the technical configuration files and automation scripts used to deploy the Docker Engine according to production standards and DCA (Docker Certified Associate) requirements.

---

## 📄 Files Overview

### 1. [daemon.json](./daemon.json)
This is the primary configuration file for the Docker daemon (`dockerd`). It allows you to customize the engine's behavior without using command-line flags.

**Key configurations implemented:**
* **`log-driver` & `log-opts`**: Sets the default driver to `json-file` with rotation (`max-size: 10m`). *DCA Note: Essential to prevent disk saturation from container logs.*
* **`live-restore`**: Keeps containers running even if the Docker daemon becomes unavailable (updates, crashes, or restarts).
* **`native.cgroupdriver`**: Set to `systemd` to ensure the host OS and Docker agree on resource management.
* **`no-new-privileges`**: A security hardening feature that prevents processes inside containers from gaining new privileges.
* **`metrics-addr`**: Exposes the engine's internal metrics for Prometheus on port `9323`.



### 2. [install_docker.sh](./install_docker.sh)
A robust Bash script to automate the installation process on Ubuntu systems.

**Critical automated steps:**
* **Package Updates**: Ensures the host OS is patched before installing the runtime.
* **GPG Key Management**: Securely downloads and configures Docker's official GPG key to verify package integrity.
* **Component Installation**: Installs `docker-ce` (Engine), `docker-ce-cli`, and `containerd.io` (Runtime).
* **Post-Installation**: Automatically applies your custom `daemon.json` to `/etc/docker/`.

---

## 🚀 How to use these assets

To provision a new node with this configuration:

1. **Make the script executable**:
   ```bash
   chmod +x install_docker.sh
   ```


2. **Run the installation**:
   ```bash
   ./install_docker.sh
   ```

3. **Verify the applied settings**:
   ```bash
   docker info | grep -i "Logging Driver"
   docker info | grep -i "Live Restore"
   ```


---

## 🎓 DCA Exam Focus
* **File Location**: The default configuration file is always **`/etc/docker/daemon.json`**.
* **Validation**: If the JSON contains a syntax error (e.g., a missing comma), the Docker service will fail to start.
* **Precedence**: Configuration in `daemon.json` must not conflict with flags defined in the `systemd` unit file; otherwise, the daemon will error out on launch.

---
*Maintainer: **DrLaBulle***
