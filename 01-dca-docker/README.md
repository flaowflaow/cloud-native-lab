# 🐳 Docker Certified Associate (DCA) - Study Lab

Welcome to my **DCA** certification preparation laboratory. This repository centralizes all theoretical concepts and practical hands-on exercises required to master the Docker ecosystem, from basic installation to complex orchestration.

## 🗺️ Learning Roadmap

This project is organized into 7 competency blocks aligned with the official Docker/Mirantis curriculum.

| Block | Title | Status | Key Description |
| :--- | :--- | :---: | :--- |
| **01** | [Installation & Config](./01-install-config/) | ✅ | Daemon setup, storage drivers, and logging. |
| **02** | [Image Management](./02-images/) | ✅ | Dockerfiles, Multi-stage builds, and Best practices. |
| **03** | [Networking](./03-networking/) | ✅ | Bridge, Host, Overlay, and network isolation. |
| **04** | [Storage](./04-storage/) | ✅ | Volumes, Bind Mounts, and persistence. |
| **05** | [Security](./05-security/) | ✅ | Secrets, Linux Capabilities, and DCT (Notary). |
| **06** | [Orchestration](./06-swarm-orchestration/) | ✅ | Swarm Mode, Services, Stacks, and Scaling. |
| **07** | [Registry](./07-registry/) | ✅ | Private Registry setup and image management. |

## 🚀 Lab Architecture
The [labs-apps](./labs-apps/) directory contains real-world applications used to validate concepts. The root [docker-compose.yml](./docker-compose.yml) deploys a full observability stack (Prometheus, Grafana, cAdvisor).

## 🛠️ Tools & Security
* **Linter**: [Hadolint](./02-images/hadolint/) for Dockerfile validation.
* **Security**: [Trivy](./02-images/trivy/) for vulnerability scanning.
* **Orchestration**: Docker Swarm (Native).

## 📚 Resources & Certification
* **Objective**: Docker Certified Associate (DCA).
* **Author**: **DrLaBulle**
* **Last Updated**: January 2026

---
*Each subdirectory contains its own detailed guide and hands-on exercises.*