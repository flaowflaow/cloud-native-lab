# 🔍 Google cAdvisor
Analyzes resource usage and performance characteristics of running containers.

## ✨ Features
* **Real-time Metrics**: Native support for Docker container stats.
* **Prometheus Ready**: Exposes a `/metrics` endpoint on port 8080.
* **Observability**: Crucial for tracking CPU/RAM quotas in the DCA exam.

## 🚀 Usage
```bash
docker build -t drlabulle/cadvisor:custom .
# Note: cAdvisor requires specific host mounts to see other containers