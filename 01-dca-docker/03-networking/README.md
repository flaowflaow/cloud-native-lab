# 🛠️ Block 03: Docker Networking & Connectivity

This block covers the fundamental and advanced networking concepts required for the **DCA (Docker Certified Associate)** exam.

## 📋 Essential Commands Cheat Sheet

| Command | Description |
| :--- | :--- |
| `docker network ls` | List all networks available on the host. |
| `docker network inspect <net_name>` | View detailed configuration (IPAM, Subnet, Gateway). |
| `docker network create -d <driver> <name>` | Create a new network with a specific driver. |
| `docker network connect <net> <container>` | Hot-plug a running container into a network. |
| `docker network prune` | Cleanup all unused networks. |

## 🧪 Experiments included:
1. **[Bridge/Host/Overlay](./bridge-host-overlay/)**: Understanding isolation and performance trade-offs.
2. **[Macvlan](./macvlan/)**: Advanced L2 networking for specific infrastructure needs.

---
*Maintainer: **DrLaBulle***