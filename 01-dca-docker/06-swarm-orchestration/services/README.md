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
Need more power? Scale up or down instantly. Docker Swarm will automatically distribute the new tasks across the available nodes in the cluster.

```bash
docker service scale web-server=5
```

### 3️⃣ Update a Service
Update an image version without downtime (Rolling Update). Swarm replaces old containers with new ones according to your update policy:

```bash
docker service update --image nginx:1.25.3 web-server
```

---

## 🔄 Service Deployment Modes

When creating a service, Docker Swarm allows you to define how tasks are distributed across the nodes using the `--mode` flag.

### 1. Replicated Mode (Default)
The swarm manager distributes a specific number of replica tasks among the nodes based on the scale you specify.
* **Command**: `docker service create --name web --replicas 3 nginx`
* **Use Case**: Standard web applications and microservices.

### 2. Global Mode
The swarm manager runs exactly one task for the service on every available node in the cluster that complies with the service's constraints.
* **Command**: `docker service create --name agent --mode global prom/node-exporter`
* **Use Case**: Monitoring agents, anti-virus scanners, or log collectors that must run on every node.


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

## 🛠️ Node Maintenance: Drain Mode

In a production environment, you often need to perform maintenance on a specific node (OS updates, hardware upgrade). Swarm allows you to evacuate a node gracefully.

### 🔄 Availability States
* **Active**: The node can receive and run new tasks (Default).
* **Pause**: The node stops receiving new tasks, but existing ones keep running.
* **Drain**: Existing tasks are shut down and rescheduled on other **Active** nodes.

### 🛠️ How to Drain a Node
To safely remove a node from the workload:
```bash
docker node update --availability drain <NODE_ID>
```

---

## 📋 DCA Exam Focus — Scaling & Self-Healing (Continued)

### ⚖️ Actual State vs. Desired State
The Swarm Manager runs a **Reconciliation Loop**. Its only job is to ensure that the cluster's **Actual State** (what is currently running) matches your **Desired State** (what you requested in `docker service create`).



### 🛰️ Routing Mesh Internal
The Routing Mesh is the magic that allows any node to receive traffic for any service. Remember these technical points for the exam:

* **IPVS (IP Virtual Server)**: The kernel-level technology used for load balancing.
* **Layer 4**: It operates at the Transport layer (TCP/UDP), not Layer 7 (HTTP).
* **Ingress Network**: The special overlay network that handles the Routing Mesh traffic.



---
*Maintainer: **DrLaBulle***