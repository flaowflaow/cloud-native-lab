# 📚 Swarm Stacks — Multi-service Orchestration

A **Stack** is a collection of services that make up an application in a specific environment. It allows you to define and manage an entire application stack (DB, API, Frontend) using a single declarative file.

---

## 📌 Stack vs Compose
While they use the same YAML format, there are key differences:
- **Docker Compose**: Focuses on a single host (development).
- **Docker Stack**: Focuses on a cluster (production/Swarm). It ignores build instructions and focuses on replicas, update configs, and placement constraints.

---

## 🛠️ Essential Stack Commands

### 1️⃣ Deploy a Stack
To deploy or update a stack from a compose file:
```bash
docker stack deploy -c docker-compose.yml my_app_stack
```
2️⃣ List Stacks

To see all stacks currently running on the swarm:
```bash
docker stack ls
```
3️⃣ List Services in a Stack

To see the status of all services belonging to a specific stack:
```bash
docker stack services my_app_stack
```
4️⃣ Remove a Stack

To tear down all services, networks, and configurations defined in the stack:
```bash
docker stack rm my_app_stack
```

## 📊 Comparison Table

| Feature | Docker Compose | Docker Stack |
| :--- | :--- | :--- |
| **Command** | `docker-compose up` | `docker stack deploy` |
| **Scope** | Single Host | Entire Swarm Cluster |
| **Scaling** | Manual / `--scale` | Declarative `replicas` in YAML |
| **Resilience** | Limited | Native High Availability |



---

## 📋 DCA Exam Focus — Deployment Configuration

### 📍 Placement Constraints
You can control which nodes run your containers using labels or roles. This is vital for ensuring database tasks run on nodes with SSDs or specific security profiles:

```yaml
deploy:
  placement:
    constraints:
      - node.role == worker
      - node.labels.disk == ssd
```

### 📈 Resource Reservations

Prevent a stack from exhausting node resources by defining hard limits and soft reservations:

```yaml
deploy:
  resources:
    limits:
      cpus: '0.50'
      memory: 512M
    reservations:
      cpus: '0.25'
      memory: 128M
```

### 🌐 Network Isolation

When using Stacks, Docker automatically utilizes Overlay Networks. This creates a distributed network across all swarm nodes, allowing containers on different physical hosts to communicate securely through a virtual tunnel (VXLAN).


---
*Maintainer: **DrLaBulle***