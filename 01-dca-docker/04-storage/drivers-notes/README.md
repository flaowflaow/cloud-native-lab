# 🗂️ Docker Storage Drivers

To store data, Docker uses storage drivers that manage how images and containers are stacked. This is a core topic for the **DCA** exam.

## 🚀 The Reference: Overlay2
On modern Linux systems, `overlay2` is the preferred storage driver. It works by layering file systems:
* **Lowerdir**: Read-only layers (the Image).
* **Upperdir**: The writable layer (the Container).
* **Merged**: What you actually see inside the container.

## 📋 Other Common Drivers
| Driver | Use Case |
| :--- | :--- |
| **overlay2** | Best for performance and stability on Linux. |
| **devicemapper** | Older systems (Direct-LVM). |
| **zfs / btrfs** | Specific filesystem-level snapshots and performance features. |
| **fuse-overlayfs** | Rootless Docker environments. |

---
*Maintainer: **DrLaBulle***