# 🐘 Hardened PostgreSQL 16
Customized PostgreSQL image based on Alpine Linux for the Cloud-Native Lab.

## ✨ Features
* **Healthcheck**: Uses `pg_isready` to ensure the database is fully initialized before dependent services start.
* **Auto-Init**: Any `.sql` or `.sh` script placed in `./init-scripts/` is executed on the first run.
* **Security**: Non-root execution using the default `postgres` user.

## 🚀 Usage
```bash
docker build -t drlabulle/postgres:custom .
docker run -d --name db -e POSTGRES_PASSWORD=securepass drlabulle/postgres:custom

Maintainer: DrLaBulle