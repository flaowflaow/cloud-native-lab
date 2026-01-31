# 🛡️ Linux Capabilities in Docker

By default, Docker containers run as the `root` user, but they don't have **all** the powers of the host's root. Docker use **Linux Capabilities** to break down "root privileges" into small, granular permissions.

## 📌 Why use Capabilities?
Instead of running a container with the dangerous `--privileged` flag (which gives full access to the host), you should only add the specific power the container needs.

## 🛠️ Main Commands

| Action | Flag | Example |
| :--- | :--- | :--- |
| **Drop all powers** | `--cap-drop ALL` | Best practice for hardening |
| **Add a power** | `--cap-add <NAME>` | Grant only what is needed |

### 🚀 Hands-on: Testing Restrictions
Even as root, a standard container cannot change the system time:
```bash
docker run --rm alpine date -s "12:00:00"
```

# Output: date: can't set date: Operation not permitted

To allow it, we add the SYS_TIME capability:
Bash

docker run --rm --cap-add SYS_TIME alpine date -s "12:00:00"
# This will work (but careful, it changes the HOST time!)

### 📋 Common Capabilities for DCA

| Capability | What it allows |
| :--- | :--- |
| NET_ADMIN |	Configure network interfaces, IP tables, etc. |
| CHOWN |	Change file permissions/ownership. |
| SYS_ADMIN |	Range of system admin tasks (Too powerful, avoid if possible). |
| SETUID / SETGID |	Change user or group IDs. |

### 🛡️ Best Practice: The "Drop All" Strategy

In production, the most secure way to run a container is to drop all capabilities and only add back the ones required for the app to run.

Example in Docker Compose:
```
services:
  web:
    image: nginx:alpine
    cap_drop:
      - ALL
    cap_add:
      - NET_BIND_SERVICE # Allows binding to port 80/443
```
*Maintainer: **DrLaBulle***