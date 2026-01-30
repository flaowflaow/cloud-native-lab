# 💾 Docker Storage Drivers & Graph Drivers

## 📌 Overview
Storage drivers manage how Docker images and containers are stored and layered on your host's filesystem. They implement the **Layering** system and the **Copy-on-Write (CoW)** mechanism, which are core to Docker's performance.

---

## 🔍 The "Overlay2" Standard (DCA Core)
`overlay2` is the industry-standard storage driver for modern Linux distributions.

### Why Overlay2?
* **Efficiency:** It provides fast container start times and low memory usage.
* **Unified View:** It merges multiple directories (layers) into a single filesystem view.

### Other Drivers (DCA Exam Knowledge):
| Driver | Use Case | Status |
| :--- | :--- | :--- |
| **Btrfs / ZFS** | Used if the host filesystem is already formatted with these. | Advanced |
| **Device Mapper** | Former standard for RHEL/CentOS 7. | Deprecated |
| **VFS** | No Copy-on-Write support. Used for testing only. | Performance-heavy |

---

## 🏗️ Copy-on-Write (CoW) Mechanism
The CoW strategy allows Docker to share image layers across multiple containers, drastically reducing disk usage.

1. **Immutable Layers:** Images consist of read-only layers.
2. **Writable Layer:** A thin "read-write" layer is added when a container starts.
3. **The Action:** When a file in a read-only layer is modified, Docker **copies** it to the writable layer first. The original image remains unchanged.

---

## 🛠️ Hands-on Commands

### Identify the Active Storage Driver
```bash
docker info | grep "Storage Driver"
```

### Inspect Layer Usage & Disk Space
```bash
docker system df -v
```

### Check the Backing Filesystem (ext4, xfs, etc.)
```bash
docker info | grep "Backing Filesystem"
```