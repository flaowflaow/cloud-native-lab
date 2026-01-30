# 🖼️ Block 02: Image Management & Custom Builds

## 📌 Objectives
This module focuses on the **Creation**, **Optimization**, and **Security** of Docker images. Instead of using generic official images, we build custom "Hardened" versions to meet production standards.

## 🔍 Key Concepts (DCA Exam)
* **Instruction Efficiency**: Minimizing layers and using `.dockerignore`.
* **Multi-stage Builds**: Separating build dependencies from runtime artifacts.
* **Image Security**: Running as non-root users and implementing `HEALTHCHECK`.
* **Base Images**: Leveraging **Alpine Linux** for a reduced attack surface.

## 🔍 Custom Built Components
Currently, the following images are being customized:
* **PostgreSQL 16**: Includes health checks and automated initialization.
* **Prometheus**: Pre-configured with Docker Engine scrape jobs.

---
*Maintainer: **DrLaBulle***
