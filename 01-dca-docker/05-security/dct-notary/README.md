# ✍️ Docker Content Trust (DCT) & Notary

Docker Content Trust (DCT) provides a mechanism to verify the **integrity** and the **publisher** of all data received from a registry. It ensures that the image you pull is exactly the same as the one the publisher pushed, without any unauthorized modifications.

## 📌 How it Works
DCT integrates **Notary**, an open-source server that manages digital signatures using a set of keys. When DCT is enabled, Docker will only pull images that have a valid signature.

* **Integrity**: Proven by cryptographic signatures.
* **Freshness**: Prevents "replay attacks" using timestamps.

## 🚀 Enabling DCT

To enforce signature verification, you must set the `DOCKER_CONTENT_TRUST` environment variable.

### 🐧 On Linux/macOS (Bash)
```bash
# Enable for the current session
export DOCKER_CONTENT_TRUST=1

# Disable
export DOCKER_CONTENT_TRUST=0
```
### 🪟 On Windows (PowerShell)
```powershell

# Enable for the current session
$env:DOCKER_CONTENT_TRUST=1

# Disable
$env:DOCKER_CONTENT_TRUST=0
```
### 🛠️ Key Commands
| Action	| Command |
| :--- | :--- |
| View Signatures | docker trust inspect --pretty <image_name> |
| Sign an image	| docker push <image_name> (with DCT=1) |
| Add a Signer	| docker trust signer add --key <key.pub> <name> <image> |
| Revoke Trust	| docker trust revoke <image_name> |

### 🔑 Key Types (DCA Focus)

When you enable DCT for the first time, Docker generates:

Root Key: The master key for all signatures (Store it offline!).

Tagging Key: Used to sign actual image tags.

### 📋 DCA Exam Facts

    Port: Notary server usually listens on port 4443.

    Scope: DCT is disabled by default.

    Registry: Docker Hub supports it natively, but for private registries, you must deploy your own Notary server.

Maintainer: DrLaBulle