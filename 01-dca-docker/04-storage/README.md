# 📦 Block 04: Data Persistence & Storage

This block focuses on how Docker handles stateful data and the underlying drivers that manage image layers.

## 🛠️ Key Commands
| Action | Command |
| :--- | :--- |
| Create a volume | `docker volume create <name>` |
| List volumes | `docker volume ls` |
| Inspect storage | `docker inspect <container_id>` |
| Remove unused volumes | `docker volume prune` |

## 🧪 Experiments included:
1. **[Drivers Notes](./drivers-notes/)**: Understanding `overlay2` and layering.
2. **[Volumes & Bind Mounts](./volumes-bindmounts/)**: Hands-on persistence strategies.

---
*Maintainer: **DrLaBulle***