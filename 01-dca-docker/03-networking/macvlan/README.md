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
⚠️ Warning: Communication between the Docker host and its own Macvlan containers is forbidden by the Linux kernel for security reasons.

Maintainer: DrLaBulle