# 🖥️ Adminer Database Manager
A lightweight web interface to manage PostgreSQL and other databases.

## ✨ Features
* **Simplicity**: Single-container management tool.
* **Availability**: Healthcheck ensures the PHP engine is responsive on port 8080.
* **Compatibility**: Perfectly tuned for our custom PostgreSQL container.

## 🚀 Usage
```bash
docker build -t drlabulle/adminer:custom .
docker run -d -p 8080:8080 --name db-admin drlabulle/adminer:custom