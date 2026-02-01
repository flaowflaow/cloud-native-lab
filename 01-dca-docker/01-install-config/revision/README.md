# 📚 Ultimate DCA Study Guide: Installation & Configuration

This comprehensive guide covers the core concepts of Docker Engine, from its internal architecture to production-grade deployment and troubleshooting.

---

## 🏛️ 1. Docker Internal Architecture

To master Docker, you must understand that it is a collection of decoupled open-source tools compliant with **OCI (Open Container Initiative)** standards.

### The Component Stack
* **Docker CLI (`docker`)**: The frontend tool that sends commands to the daemon via the **Docker Remote API**.
* **Docker Daemon (`dockerd`)**: The "brain" of the engine. It manages images, networks, volumes, and security.
* **containerd**: A high-level runtime that manages the complete container lifecycle (pulling images, execution).
* **runC**: The low-level, lightweight runtime that actually interacts with the Linux Kernel to spawn containers.
* **containerd-shim**: A small process that remains active for each running container, allowing the daemon to restart without stopping the containers.



### Linux Kernel Foundations
Docker relies on two primary kernel features:
1.  **Namespaces (Isolation)**: Virtualizes system resources (PID, Network, Mount, User, IPC, UTS) so a container thinks it has its own OS.
2.  **Control Groups / cgroups (Resource Limits)**: Restricts and monitors resources like CPU, Memory, and Disk I/O.

---

## 📥 2. Production Installation & Upgrades

### Official Installation Workflow (Ubuntu)
1.  **Cleanup**: Remove legacy packages (`docker.io`, `runc`).
2.  **GPG Key**: Add Docker’s official GPG key to `/etc/apt/keyrings/` to ensure binary integrity.
3.  **Repository**: Use the **Stable** channel. Avoid "Nightly" or "Test" for production.
4.  **Packages**: Install `docker-ce` (Engine), `docker-ce-cli` (CLI), and `containerd.io` (Runtime).

### Live Upgrade Strategy
To upgrade Docker without downtime:
* Ensure `"live-restore": true` is enabled in `daemon.json`.
* This allows the **shims** to maintain container continuity while the `dockerd` process restarts during the upgrade.

---

## ⚙️ 3. Daemon Configuration (`daemon.json`)

The file `/etc/docker/daemon.json` is the central configuration point.

### Critical Parameters for the DCA Exam
| Parameter | Description | DCA Importance |
| :--- | :--- | :--- |
| **`storage-driver`** | Set to **`overlay2`** for modern Linux. | **Critical** |
| **`log-driver`** | Default is `json-file`. Switching to `syslog` or others may break `docker logs`. | **High** |
| **`live-restore`** | Allows containers to stay `Up` when the daemon is down. | **Critical** |
| **`native.cgroupdriver`** | Usually set to `systemd` to match the host OS. | **Medium** |
| **`no-new-privileges`** | Security hardening preventing privilege escalation. | **High** |
| **`insecure-registries`** | Allows pulling from registries without valid TLS certificates. | **High** |

> [!CAUTION]
> **Precedence Rule**: You cannot define the same setting in both `daemon.json` and as a startup flag in the systemd unit file. If you do, the daemon will **fail to start**.

---

## 💾 4. Storage Drivers Matrix

Docker uses a **Copy-on-Write (CoW)** strategy to manage container layers.

* **`overlay2`**: The preferred driver for all modern Linux distributions.
* **`fuse-overlayfs`**: Used primarily for **Rootless Docker**.
* **`devicemapper`**: Deprecated. Avoid for new installations.
* **`vfs`**: Used only for testing/debugging (no CoW, very slow).



---

## 🛠️ 5. Troubleshooting & Signals

### Diagnostic Commands
* **`docker info`**: The most important command to see active drivers (Storage, Logging) and security status.
* **`docker system events`**: Real-time stream of server events.
* **`journalctl -u docker`**: Systemd logs to debug startup failures.

### Debugging Signals
* **SIGHUP**: Reloads some configuration parts without a full restart.
* **SIGUSR1**: Triggers a **stack dump** in the logs (useful if the daemon is frozen).
    * `sudo kill -s SIGUSR1 $(pidof dockerd)`

---

## 🎓 Master Checklist for the Exam
* [ ] Default config location: `/etc/docker/daemon.json`.
* [ ] Default log location: `/var/lib/docker/containers/<id>/`.
* [ ] Remote API default ports: `2375` (Unencrypted), `2376` (TLS/Encrypted).
* [ ] Adding a user to the `docker` group is equivalent to giving them **root privileges**.
* [ ] Any syntax error in `daemon.json` prevents Docker from starting.

---
*Maintained by: **DrLaBulle***