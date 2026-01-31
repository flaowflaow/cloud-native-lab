# 🏗️ Macvlan: Direct Layer 2 Connectivity

The `macvlan` driver allows you to assign a MAC address to a container, making it appear as a physical device on your network rather than a virtual one behind a bridge.

## 📌 Use Case
Use Macvlan when you have legacy applications that need to be directly visible on the corporate network or when you need to monitor network traffic without NAT interference.

## 🚀 Hands-on Lab
To create a Macvlan network, you must specify the parent interface of your host (e.g., `eth0` or `ens33`).

```bash
# Create the Macvlan network
docker network create -d macvlan \
  --subnet=192.168.1.0/24 \
  --gateway=192.168.1.1 \
  -o parent=eth0 my-macvlan-net

# Attach a container
docker run -itd --network my-macvlan-net --name direct-node alpine
```
---

## ⚠️ Warning & Security

### 🔒 Host Isolation
By default, the **Docker host cannot communicate with its own Macvlan containers**. This is a security restriction of the Linux kernel's macvlan driver. If you need the host to talk to the containers, you must create a specific macvlan bridge on the host side.

### 🔌 Promiscuous Mode
The parent interface (e.g., `eth0`) must support **promiscuous mode** to allow multiple MAC addresses to be associated with a single physical interface. On cloud providers (AWS, GCP, Azure), Macvlan is often unsupported because their networks block unknown MAC addresses.

---

## 📋 DCA Note: The "None" Network

Don't forget the **none** driver for the exam. 
- **Usage**: `docker run --network none alpine`
- **Effect**: The container has no external network interfaces, only a **loopback (`lo`)** interface.
- **Use Case**: Highest level of isolation for batch processing or security-sensitive computations that don't need network access.



---
*Maintainer: **DrLaBulle***