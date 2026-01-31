# 🛠️ Hadolint - Dockerfile Linter

## 📌 Overview
This directory contains the configuration for **Hadolint**, a tool used to ensure Dockerfiles follow best practices for security, performance, and maintainability.

## 🚀 How to Run
Run Hadolint via Docker to scan your Dockerfiles without local installation:
```bash
docker run --rm -i hadolint/hadolint < Dockerfile
```

## 🛡️ Enforced Standards
Tag Pinning: Prevents using :latest or untagged images.
Package Pinning: Encourages explicit versioning for apt and apk packages.
Layer Optimization: Minimizes image size by suggesting multi-line command consolidation.