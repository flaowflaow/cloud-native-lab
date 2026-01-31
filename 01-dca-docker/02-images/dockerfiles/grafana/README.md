# 🎨 Grafana Dashboard (Secure Edition)

This is the visualization engine for the Cloud-Native Lab, audited and signed by **DrLaBulle**.

## 🛡️ Security Profile
* **Base Image**: Switched from Ubuntu to **Alpine Linux** to drastically reduce vulnerabilities (CVEs).
* **Version Pinning**: Using `11.4.0-alpine` to ensure stability and up-to-date security patches.
* **Non-Root Execution**: Runs under the `grafana` user to prevent privilege escalation.

## ✨ Key Features
* **Provisioning**: Pre-configured for automatic data source and dashboard loading.
* **Healthcheck**: Real-time status monitoring via the internal API.

## 🚀 Build & Run
```bash
# Build the clean image
docker build -t drlabulle/grafana:custom .

# Launch the dashboard
docker run -d -p 3000:3000 --name grafana-lab drlabulle/grafana:custom