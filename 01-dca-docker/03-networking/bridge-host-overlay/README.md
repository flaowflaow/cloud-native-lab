# 🌐 Network Drivers: Bridge, Host, and Overlay

This laboratory explores the three primary network drivers used in Docker to manage container communication.

## 1️⃣ Bridge Network (The Default)
The `bridge` driver is used for containers running on the same Docker host. It provides a private internal network where containers can communicate via IP or DNS (if using custom bridges).

* **Command**: `docker network create --driver bridge my-bridge-net`
* **Key Fact**: Containers on the default bridge cannot resolve each other by name; you must use custom bridges for DNS resolution.

## 2️⃣ Host Network
The `host` driver removes the network isolation between the container and the Docker host. The container shares the host's IP address directly.

* **Command**: `docker run --network host nginx`
* **Benefit**: No NAT overhead, resulting in maximum performance.
* **Risk**: Port conflicts (only one container can bind to port 80).

## 3️⃣ Overlay Network
The `overlay` driver enables communication between containers running on different physical Docker hosts. This is the backbone of **Docker Swarm**.

* **Prerequisite**: Swarm mode must be active (`docker swarm init`).
* **Feature**: It creates a distributed network across all nodes in the cluster.

### 🔑 Critical Ports (MUST memorize for DCA)
To allow Overlay traffic, these ports must be open in your firewall:
- **2377/TCP**: Cluster management.
- **7946/TCP & UDP**: Node discovery (Gossip).
- **4789/UDP**: Data plane traffic (VXLAN).


### 🛠️ Hands-on
```bash
# Create an encrypted overlay network
docker network create -d overlay --opt encrypted my-multi-host-net
```

---
*Maintainer: **DrLaBulle***