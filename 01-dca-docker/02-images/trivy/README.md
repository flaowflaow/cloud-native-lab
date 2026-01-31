# 🛡️ Trivy - Vulnerability Scanner

## 📌 Overview
**Trivy** is our primary tool for DevSecOps. It scans container images for known vulnerabilities (CVEs) in both the OS packages and application dependencies.

## 🚀 How to Run
Scan a local image for critical threats:
```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  aquasec/trivy image <your-image-name>
```

## 📋 Security Policy
Threshold: We focus on HIGH and CRITICAL severities.
Remediation: Images with unpatched critical vulnerabilities are flagged for immediate replacement with Alpine-based or updated alternatives.