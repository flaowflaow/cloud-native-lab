# 🔄 Swarm Updates & Rollbacks

One of the most powerful features of Docker Swarm is its ability to perform **Rolling Updates** and **Automated Rollbacks**. This ensures that your application stays online even while you are deploying a new version.

---

## 🚀 Rolling Updates

By default, when you update a service's image or configuration, Swarm does not stop all containers at once. It replaces them one by one (or in small batches).

### 🛠️ Example: Update with specific policy
```bash
docker service update \
  --image nginx:1.25.4 \
  --update-parallelism 2 \
  --update-delay 10s \
  web-server
  ```

**Key Flags:**
- `--update-parallelism`: Number of containers to update simultaneously.
- `--update-delay`: Time to wait between updating each batch.
- `--update-failure-action`: What to do if an update fails (`pause`, `continue`, or `rollback`).



---

## 🔙 Manual & Automated Rollbacks

If something goes wrong during or after an update, you need to revert to the previous stable version.

### 1️⃣ Manual Rollback
If you notice a bug after an update, you can manually trigger a rollback to the previous configuration:

```bash
docker service update --rollback web-server
```

### 2️⃣ Automated Rollback
You can configure the service to rollback automatically if the new version fails to start:

```bash
docker service create \
  --name app-v2 \
  --replicas 10 \
  --update-failure-action rollback \
  --update-max-failure-ratio 0.2 \
  my-app:latest
  ```


*Note: If more than 20% of tasks fail during the update, Swarm will automatically revert all tasks to the previous configuration.*

---

## 📊 Update States

When monitoring an update with `docker service ps <name>`, you might see these states:

| State | Description |
| :--- | :--- |
| **Updating** | The task is currently being replaced by the new version. |
| **RollbackPaused** | A rollback was triggered but stopped (manual intervention required). |
| **Completed** | The update process finished successfully across all replicas. |

---

## 📋 DCA Exam Focus — Health Checks

For Rollbacks to work effectively, Docker needs to know if the container is **"healthy,"** not just **"running."**

- Use the **HEALTHCHECK** instruction in your Dockerfile to define a health test.
- Swarm uses this health status to decide whether to proceed with the rolling update or trigger a rollback.



---
*Maintainer: **DrLaBulle***