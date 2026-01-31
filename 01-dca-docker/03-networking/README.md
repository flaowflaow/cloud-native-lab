# 🛠️ Block 03: Docker Networking & Connectivity

This block covers the fundamental and advanced networking concepts required for the **DCA (Docker Certified Associate)** exam.

## 📋 Essential Commands Cheat Sheet

| Command | Description |
| :--- | :--- |
| `docker network ls` | List all networks (Check the **SCOPE**: local or swarm). |
| `docker network inspect <net>` | View subnet, gateway, and connected containers. |
| `docker network create -d <driver>` | Create a new network (e.g., bridge, overlay). |
| `docker network connect <net> <c>` | Hot-plug a running container into a network. |
| `docker network disconnect <net> <c>`| Remove a container from a network without stopping it. |
| `docker network prune` | Cleanup all unused networks. |

## 🧪 Experiments included:
1. **[Bridge/Host/Overlay](./bridge-host-overlay/)**: Understanding isolation and performance trade-offs.
2. **[Macvlan](./macvlan/)**: Advanced L2 networking for specific infrastructure needs.
3.  **Isolation Lab**: Using the `--internal` flag and custom bridges for security.

## 📋 DCA Exam Focus — Networking Internals

### 🛰️ Routing Mesh & Ingress
- **Ingress Network**: A special overlay network created automatically for Swarm to handle the **Routing Mesh**.
- **IPVS (IP Virtual Server)**: The kernel-level technology used for Layer 4 load balancing.

### 🔍 Container Network Model (CNM)
- Docker uses **libnetwork**, which implements the **CNM** (Container Network Model). This is different from the CNI used by Kubernetes.

---
*Maintainer: **DrLaBulle***