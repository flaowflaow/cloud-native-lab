# 🏗️ Swarm Cluster Initialization

To start using Docker Swarm, you must first initialize a cluster. A cluster is a group of Docker engines (nodes) running in **Swarm Mode**. 

---

## 🎭 Node Roles: Managers vs. Workers

In a Swarm cluster, every node has a specific role that determines its responsibilities within the orchestration.

### 👑 Managers
- **Cluster State**: They maintain the cluster's "Single Source of Truth" using the Raft log.
- **Scheduling**: They decide which nodes will run specific containers (tasks).
- **Control Plane**: They provide the API endpoint for cluster management.
- **Note**: By default, Managers also act as Workers and can run tasks.

### 👷 Workers
- **Execution**: Their primary role is to execute the containers (tasks) assigned to them.
- **Status Reporting**: They notify the Managers about the health and status of their tasks.



---

## 🚀 Initializing the Cluster

### 1️⃣ Initialize the First Manager
The cluster starts when you promote the first node to Manager:
```bash
docker swarm init --advertise-addr <MANAGER_IP>

### 2️⃣ Adding Nodes
To add a new node to the cluster, run the join command from the new node. Note that a node joins the cluster using a specific token that defines its future role.

```bash
# To join as a Worker
docker swarm join --token <WORKER_TOKEN> <MANAGER_IP>:2377

# To join as a Manager
docker swarm join --token <MANAGER_TOKEN> <MANAGER_IP>:2377
```


---

## ⚖️ Manager Quorum & High Availability (DCA Essential)

Swarm uses the **Raft Consensus Algorithm** to ensure all managers agree on the cluster state. For the cluster to function, a **majority (Quorum)** of managers must be alive.

### 🔢 The Quorum Formula
To survive $N$ failures, you need $2N + 1$ managers.

| Managers | Fault Tolerance | Quorum Needed |
| :--- | :--- | :--- |
| 1 | 0 | 1 |
| 3 | 1 | 2 |
| 5 | 2 | 3 |
| 7 | 3 | 4 |



> [!CAUTION]
> **Why an odd number?** An odd number of managers ensures that in case of a network partition, only one side can maintain a majority, preventing a **"split-brain"** scenario. If the Quorum is lost, existing tasks keep running, but the cluster becomes **Read-Only** (no new services, no scaling).

---

## 📊 Node Management Table

| Command | Action |
| :--- | :--- |
| `docker node ls` | List all nodes and their status (Managers only) |
| `docker node promote <NODE>` | Upgrade a Worker to a Manager |
| `docker node demote <NODE>` | Downgrade a Manager to a Worker |
| `docker node inspect <NODE>` | View detailed JSON info about a node |
| `docker swarm leave --force` | Remove a node from the swarm |

---

## 📋 DCA Exam Focus — Cluster Security

- **mTLS**: Swarm uses mutual TLS to encrypt all communication between nodes.
- **Certificate Rotation**: Certificates are rotated every **90 days** by default (customizable via `docker swarm update`).
- **Autolock**: You can protect the cluster's encryption key with `docker swarm update --autolock=true`. If enabled, Managers require a key to unlock after a restart.



---
*Maintainer: **DrLaBulle***