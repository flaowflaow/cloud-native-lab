# ⚙️ Advanced Engine Configuration (daemon.json)

## 📌 Introduction
This laboratory details the configuration of the Docker Engine (`dockerd`). For a future **Azure DevOps Expert**, moving beyond default settings is crucial to implementing a secure, high-performing, and observable infrastructure.

---

## 🔍 Parameter Breakdown

Each directive in our `daemon.json` file addresses a specific production requirement:

| Parameter | Technical Explanation | Why for DCA? |
| :--- | :--- | :--- |
| `native.cgroupdriver=systemd` | Aligns Docker with the OS resource manager (systemd). | Prevents system instability during high CPU/RAM usage. |
| `log-opts` | Limits logs to 3 files of 10MB each. | Prevents disk space exhaustion from container logs. |
| `live-restore: true` | Keeps containers running if the Docker daemon stops or restarts. | Guarantees **High Availability** during maintenance/updates. |
| `userland-proxy: false` | Forces `iptables` to handle routing instead of a proxy process. | Optimizes network performance and reduces attack surface. |
| `no-new-privileges` | Prevents containers from escalating privileges (via setuid). | Fundamental **Hardening** (security) measure. |
| `metrics-addr` | Exposes engine metrics on port 9323. | Data source for **Prometheus** (Observability). |
| `buildkit: true` | Enables the next-generation build engine. | Allows for faster builds and smaller, optimized images. |

---

## 🛠️ Theoretical Concepts (DCA Exam Objectives)

### 1. Isolation & Resources
The Docker daemon leverages two key Linux Kernel features that we configure here:
* **Namespaces** (Isolation): Provides the sandbox for the container (Network, PID, Mount).
* **Control Groups / Cgroups** (Resource Limitation): Managed via the `cgroupdriver` parameter to handle resource quotas.



### 2. Security & Privileges
The `no-new-privileges` option is a major focus within the **Security** domain of the DCA exam. It ensures that even if an application is compromised, the attacker cannot gain `root` privileges on the host through the container.

---

## 🚀 Deployment Procedure

1. **Validate Syntax** (to avoid service disruption):
   ```bash
   dockerd --validate-config
1. **Apply Configuration** :
   ```bash
   sudo systemctl reload docker
1. **Verify Metrics Exposure** :
   ```bash
   curl http://localhost:9323/metrics