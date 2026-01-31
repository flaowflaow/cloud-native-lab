# 🚀 Swarm Services — Scaling & Self-Healing

In Docker Swarm, you don't run individual containers. Instead, you deploy **Services**. A service allows you to define the "desired state" of your application, and Swarm ensures that state is maintained across the cluster.

---

## 📌 Concept: Task vs Service
- **Service**: The definition of the workload (image, ports, replicas).
- **Task**: The atomic unit of Swarm. It is the actual container running as part of a service.

---

## 🛠️ Essential Service Commands

### 1️⃣ Create a Service
To deploy a service with 3 replicas (instances) across the cluster:

```bash
docker service create --name web-server --replicas 3 -p 80:80 nginx:alpine
```
### 2️⃣ Scale a Service
Need more power? Scale up or down instantly:
```bash
docker service scale web-server=5
```
### 3️⃣ Update a Service
Update an image version without downtime (Rolling Update):
```bash
docker service update --image nginx:1.25.3 web-server
```

---

## 📊 Management Table

| Command | Action |
| :--- | :--- |
| `docker service ls` | List all running services |
| `docker service ps <name>` | List the tasks (containers) of a specific service |
| `docker service inspect --pretty <name>` | View service configuration in a readable format |
| `docker service rm <name>` | Remove the service and its tasks |
| `docker service logs -f <name>` | View aggregated logs from all replicas |

---

## 📋 DCA Exam Focus — Scaling & Self-Healing

### 🛡️ Self-Healing
If a node fails or a container crashes, the Swarm Manager detects the gap between the **Actual State** and the **Desired State**. It automatically schedules new tasks (containers) on healthy nodes to reach the desired replica count again.

### 🌐 Routing Mesh
Docker Swarm uses a **Routing Mesh**. This means:
- You can access any service using the IP of **any node** in the cluster.
- The Routing Mesh automatically load-balances the incoming request to a node running the task.



### 🔄 Update Policies
You can control how updates happen:
- `--update-parallelism`: Number of containers to update at once.
- `--update-delay`: Time to wait between updating groups of containers.
- `--update-failure-action`: What to do if an update fails (e.g., `pause` or `rollback`).

---
*Maintainer: **DrLaBulle***