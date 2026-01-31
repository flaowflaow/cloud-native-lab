# 📦 Block 07: Docker Registry & Image Management

In the Docker ecosystem, a Registry is a stateless, highly-scalable server-side application that stores and lets you distribute Docker images. It is the central hub for CI/CD pipelines and image distribution.

---

## 🏗️ 1. The Registry Workflow

To move an image from your local host to a registry, you must follow the **Tag-Login-Push** workflow. This ensures the Docker client knows exactly where to send the image layers.



### 🛠️ Core Commands
```bash
# 1. Tagging an image for a local registry
# Format: docker tag <current-name> <registry-addr>:<port>/<image-name>:<tag>
docker tag my-app:latest localhost:5000/my-app:v1.0

# 2. Authenticating
docker login localhost:5000

# 3. Pushing to the registry
docker push localhost:5000/my-app:v1.0

# 4. Pulling from the registry
docker pull localhost:5000/my-app:v1.0
```

---

## 🚀 2. Deploying a Private Registry

For the DCA exam, you must know how to run a basic registry container. By default, it uses port 5000 and stores images in /var/lib/registry.


### 🛠️ Local Deployment Example
```bash
docker run -d \
  -p 5000:5000 \
  --restart=always \
  --name local-registry \
  -v registry_data:/var/lib/registry \
  registry:2
  ```

[!WARNING] Insecure Registries: Docker forces HTTPS by default. If your private registry doesn't have a valid SSL certificate, you must declare it in /etc/docker/daemon.json under the "insecure-registries": ["localhost:5000"] key and restart the Docker daemon.


---

## 🛡️ 3. Security & Maintenance
### 🔑 Authentication (Native Basic Auth)

Production registries should not be open. You can secure access using a htpasswd file:

    Create a password file using htpasswd.

    Mount it into the registry container at /auth/htpasswd.

    Define REGISTRY_AUTH=htpasswd and REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd environment variables.

### 🧹 Garbage Collection

When you delete an image via the API, layers are marked for deletion but not physically removed to save CPU. To free up disk space, you must manually trigger the Garbage Collector:
```bash
docker exec local-registry bin/registry garbage-collect /etc/docker/registry/config.yml
```


---

## 📋 4. DCA Exam Focus — Registry Internals



* **Docker Hub:** The official public registry. Official images (e.g., `nginx`, `alpine`) reside in the root library namespace.
* **DTR (Docker Trusted Registry):** The enterprise-grade registry (part of Docker Enterprise/Mirantis) that supports **Image Scanning** for vulnerabilities and **Docker Content Trust (DCT)**.
* **Layer Deduplication:** Registries store images by layers. If two different images share the same layer ID, the registry only stores it once, significantly reducing storage needs.
* **Search:** Use `docker search <image>` to find public images on Docker Hub directly from the CLI.
* **Content Trust:** Setting `export DOCKER_CONTENT_TRUST=1` forces Docker to only pull images that are digitally signed by the publisher.

---
*Maintainer: **DrLaBulle***