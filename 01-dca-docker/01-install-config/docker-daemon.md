# ⚙️ Docker Daemon Configuration

## 📌 Introduction

The Docker daemon (`dockerd`) is the core service responsible for managing containers, images, networks, and volumes.

This document explains **how to configure Docker using `daemon.json`**, a key topic for the **Docker Certified Associate (DCA)** exam.

---

## 🎯 Objectives

- Understand the Docker daemon configuration file
- Configure logging, storage, and security options
- Reload and validate daemon configuration
- Troubleshoot common daemon issues

---

## 📍 1. Docker Daemon Configuration File

The main configuration file is:

```bash
/etc/docker/daemon.json
```

If it does not exist, it must be created manually.

---

## 📝 2. Basic daemon.json Example

```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  },
  "storage-driver": "overlay2",
  "iptables": true
}
```

Create or edit the file:

```bash
sudo nano /etc/docker/daemon.json
```

---

## 🔄 3. Reload Docker Configuration

After any change:

```bash
sudo systemctl daemon-reexec
sudo systemctl restart docker
```

Verify Docker is running:

```bash
systemctl status docker
```

---

## 📊 4. Logging Configuration

Default logging driver:

```bash
json-file
```

Recommended log rotation (important for DCA):

```json
"log-opts": {
  "max-size": "10m",
  "max-file": "3"
}
```

Check current logging driver:

```bash
docker info | grep "Logging Driver"
```

---

## 💾 5. Storage Driver

Check current storage driver:

```bash
docker info | grep "Storage Driver"
```

Recommended:

```json
"storage-driver": "overlay2"
```

`overlay2` is:
- default
- efficient
- DCA-approved

---

## 🔐 6. Security Best Practices

### Disable Docker Remote API (default)

Never expose Docker daemon without TLS.

❌ Bad:

```bash
-H tcp://0.0.0.0:2375
```

### Use user namespaces (advanced)

```json
"userns-remap": "default"
```

> Optional for the lab, but good to know for the exam.

---

## 🔍 7. Validate Configuration

```bash
docker info
docker system info
```

Check for errors in logs:

```bash
journalctl -u docker --since "10 minutes ago"
```

---

## 🧠 DCA Exam Notes

You should be able to:
- Locate and edit `daemon.json`
- Configure logging and storage
- Restart Docker safely
- Identify daemon misconfigurations

---

## ❌ Common Mistakes

- Invalid JSON syntax (Docker will not start)
- Forgetting to restart Docker
- Mixing CLI flags and `daemon.json` settings

---

## 🧪 Lab Idea (Optional)

1. Configure log rotation  
2. Run a noisy container  
3. Verify logs do not exceed size limits

---

## 📚 References

- Docker daemon documentation
