# 📊 Custom Prometheus Image

## 📌 Role
This custom image provides an out-of-the-box monitoring solution. It is pre-configured to automatically scrape metrics from the Docker Engine.

## ⚙️ Customizations
* **Embedded Config**: The `prometheus.yml` is baked into the image at `/etc/prometheus/`.
* **Healthcheck**: Implemented via `wget` to ensure the web UI is responsive.
* **Scrape Job**: Targets `host.docker.internal:9323` (Docker Metrics).
* **Persistence Ready**: Designed to work with external volumes for TSDB data.

## 🚀 Build Command
```bash
docker build -t drlabulle/prometheus:custom .
