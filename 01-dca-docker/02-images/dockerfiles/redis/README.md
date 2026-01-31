# ⚡ Optimized Redis Cache
A lightweight, secure Redis instance designed for high-speed session management.

## ✨ Features
* **Alpine-based**: Minimal attack surface and rapid pull times.
* **Resilience**: Integrated healthcheck using `redis-cli ping`.
* **Standardized Port**: Explicitly exposes `6379`.

## 🚀 Usage
```bash
docker build -t drlabulle/redis:custom .
docker run -d --name cache drlabulle/redis:custom