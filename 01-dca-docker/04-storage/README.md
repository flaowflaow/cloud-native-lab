# 💾 Block 04: Storage & Data Persistence

In Docker, the writable layer of a container is ephemeral. To persist data, Docker uses three main mechanisms. For the DCA exam, you must understand the "how" and the "where".

---

## 🏗️ 1. Mount Types Comparison

| Feature | **Volumes** | **Bind Mounts** | **tmpfs** |
| :--- | :--- | :--- | :--- |
| **Storage Location** | Managed by Docker (`/var/lib/docker/volumes/`) | Anywhere on the Host system | Host system memory (RAM) |
| **Portability** | High (Managed by Docker CLI) | Low (Tied to host file tree) | None (Lost on restart) |
| **Best For...** | Production, database files, sharing data | Dev (source code), config files | Sensitive data, high performance |
| **Pre-population** | If empty, copies container content | Overwrites/Hides container content | N/A |



---

## 🛠️ 2. Essential Syntax: `-v` vs `--mount`

While `-v` is shorter, **the DCA exam prefers `--mount`** because it is more explicit and required for Docker Swarm services.

### 📦 Volume (Managed)
```bash
# Explicit syntax (DCA Preferred)
docker run -d \
  --name db-container \
  --mount type=volume,source=my_data,target=/var/lib/mysql \
  mysql:latest
```

### 🔗 Bind Mount (Host-dependent)
Bind mounts map a specific path on your host to the container. They are highly dependent on the host's file system structure.

```bash
# Explicit syntax (DCA recommended)
docker run -d \
  --name web-server \
  --mount type=bind,source=/home/user/app,target=/usr/share/nginx/html,readonly \
  nginx:alpine
```
---

## ⚙️ 3. Storage Drivers & Overlay2 (Under the Hood)



### 🧩 Overlay2 Structure
The `overlay2` driver is the industry standard. It merges different directories to create a single file system view:

* **Lowerdir**: The Read-Only layers from the Docker Image.
* **Upperdir**: The Writable layer specific to the container.
* **Merged**: The unified view where the container sees all layers combined.

### 🔄 Copy-on-Write (CoW) Strategy
This is a critical exam concept for understanding performance and efficiency.

**CoW Principle**: If a container needs to modify a file that exists in an image layer (**Lowerdir**), Docker first **copies** that file up to the container's writable layer (**Upperdir**). The container then modifies the copy. This ensures the original image remains untouched and can be shared by other containers.


---

## 📋 4. DCA Exam Focus — Tips & Tricks

* **The Path**: On Linux, volumes are stored by default in `/var/lib/docker/volumes/`.
* **The "Shadowing" Effect**: If you mount a **bind mount** into a non-empty container directory, the container's files are **hidden** by the host's content. **Volumes** do the opposite: they can be pre-populated by the container's content if the volume is initially empty.
* **NFS/Third-party**: Only **Volumes** support external storage drivers (NFS, S3, Azure Files).
* **Cleanup**: 
    * `docker volume prune`: Deletes all unattached volumes.
    * `docker system df`: Displays space usage by images, containers, and volumes.

---
*Maintainer: **DrLaBulle***