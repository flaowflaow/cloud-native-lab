# 🔐 Docker Secrets & Configs

This module explores the secure management of sensitive data and application configurations within a Docker environment, specifically for **Docker Swarm** (where these features are natively encrypted).

## 1️⃣ Docker Secrets
Secrets are used to store sensitive information such as passwords, SSH keys, or SSL certificates.
* **Security**: They are encrypted during transit and at rest in the Swarm Raft log.
* **Storage**: In-memory only (never written to the container's writable layer).
* **Path**: Inside the container at `/run/secrets/<secret_name>`.

### 🚀 Hands-on: Create a Secret
```bash
# Method 1: Create from a file
echo "my_db_password" > db_pass.txt
docker secret create db_password ./db_pass.txt

# Method 2: Create via STDIN (more secure, no file left on disk)
echo "super_secret_api_key" | docker secret create api_key -
```

## 2️⃣ Docker Configs

Configs allow you to store non-sensitive information, such as nginx.conf or prometheus.yml, outside the image.

Difference: Unlike secrets, configs are not encrypted.

Path: Default is /, but usually mounted where the app expects it.

### 🚀 Hands-on: Create a Config
```bash
docker config create nginx_config ./nginx.conf
```

### 🛠️ Usage in Docker Compose (Stack)

When deploying a stack, you reference secrets and configs at the root level and then grant access to specific services.
```
version: "3.8"
services:
  db:
    image: postgres:16-alpine
    secrets:
      - db_password
    environment:
      POSTGRES_PASSWORD_FILE: /run/secrets/db_password

  web:
    image: nginx:alpine
    configs:
      - source: my_nginx_config
        target: /etc/nginx/nginx.conf

secrets:
  db_password:
    external: true  # Defined outside this file

configs:
  my_nginx_config:
    file: ./site.conf
```
### 📋 Comparison for DCA
| Feature | Docker Secret | Docker Config |
| :--- | :--- | :--- |
| Sensitivity | High (Passwords/Keys) | Low (Configs/Settings) |
| Encryption | Yes (At rest & Transit) | No |
| Swarm Only | Yes* | Yes* |
| In-Memory | Yes | Yes |

*Note: Docker Compose simulates them in non-swarm mode by mounting files, but without the security benefits of the Raft log encryption.*

*Maintainer: **DrLaBulle***