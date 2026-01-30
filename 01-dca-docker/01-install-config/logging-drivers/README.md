# 📝 Docker Logging Drivers

## 📌 Overview
By default, Docker captures the standard output (`stdout`) and standard error (`stderr`) of all containers and writes them to files in JSON format. In a production environment, managing these logs is critical to ensure system stability and observability.

---

## 🔍 Key Concepts (DCA Exam)

### 1. The Default Driver: `json-file`
* **Mechanism:** Logs are stored as JSON files on the host machine.
* **Default Path:** `/var/lib/docker/containers/<container-id>/<container-id>-json.log`
* **Risk:** Without rotation, these files can grow indefinitely and crash the host by saturating the disk.

### 2. Log Rotation (Essential for Production)
As configured in our `daemon.json`, we implement a limit:
* `max-size`: Maximum size of a single log file (e.g., `10m`).
* `max-file`: Maximum number of rotated files to keep (e.g., `3`).

### 3. Alternative Drivers
* **`syslog`**: Routes logs to the syslog service on the host.
* **`journald`**: Routes logs to the systemd journal.
* **`fluentd` / `gelf`**: Used for centralized logging stacks (ELK, Graylog).
* **`none`**: Disables logging entirely.

---

## 🏗️ Architecture


---

## 🛠️ Hands-on Commands

### Check the Active Logging Driver
```bash
docker info | grep "Logging Driver"
```

### Run a Container with Custom Logging Limits
```bash
docker run -d --log-opt max-size=10m --log-opt max-file=3 alpine
```

### Locate Log Files on the Host
```bash
docker inspect --format='{{.LogPath}}' <container_id>
```
