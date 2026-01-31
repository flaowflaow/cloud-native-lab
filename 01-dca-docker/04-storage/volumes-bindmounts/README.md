# 💾 Volumes vs Bind Mounts vs Tmpfs

Data inside a container is ephemeral by default. To persist it, we use one of these three strategies.

## 1️⃣ Named Volumes (Recommended)
Managed entirely by Docker. They are stored in a part of the host filesystem (`/var/lib/docker/volumes/` on Linux).
* **Pros**: Easy to back up, portable between containers, high performance.
* **Usage**: `docker run -v my_data:/app/data alpine`

## 2️⃣ Bind Mounts
A direct link to a specific path on your host machine.
* **Pros**: Great for development (edit code on host, see changes in container).
* **Cons**: Relies on the host's folder structure (less portable).
* **Usage**: `docker run -v $(pwd)/html:/usr/share/nginx/html nginx`

## 3️⃣ Tmpfs Mounts
Stored only in the host's **memory** (RAM). Data is lost when the container stops.
* **Use Case**: Secrets, sensitive keys, or temporary high-speed processing.

---
*Maintainer: **DrLaBulle***