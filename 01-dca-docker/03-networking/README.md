# 🌐 Networking & Persistence Strategy

This block focuses on the "glue" that connects our services while maintaining a strict security posture through network isolation and data persistence.

## 🏗️ Network Architecture
We use a **Three-Tier Isolation** strategy to minimize the attack surface:

| Network | Type | Purpose |
| :--- | :--- | :--- |
| `net-back` | **Internal** | Isolated layer for Database (Postgres) and Cache (Redis). No internet access. |
| `net-admin` | Bridge | Management layer for Adminer to access the backend. |
| `net-monitor`| Bridge | Metrics collection layer for Prometheus, cAdvisor, and Grafana. |



## 💾 Data Persistence
To ensure no data loss occurs when containers are recreated, we use **Named Volumes**:
* `postgres_data`: Persists the SQL database state.
* `prometheus_data`: Stores historical time-series metrics.

## 🚀 Orchestration
The entire stack is managed via `docker-compose.yml`. This ensures that:
1. Networks are created before services start.
2. Services are attached to the correct isolated segments.
3. Volumes are mapped to the correct mount points.

### Deployment Command
```bash
docker compose up -d
```

### 🔍 Verification Commands
```bash
# Check network isolation
docker network inspect net-back

# List active volumes
docker volume ls
```

Maintainer: DrLaBulle