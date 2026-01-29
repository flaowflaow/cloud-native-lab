# 🐳 Lab 01: Full-Stack Microservices & Observability (DCA Prep)

## 📌 Project Overview
This laboratory simulates a complete, containerized production infrastructure. The primary goal is to validate key competencies for the **Docker Certified Associate (DCA)** certification by orchestrating a complex stack including databases, caching, and advanced monitoring tools.

## 🏗️ Architecture Stack
The project deploys 6 critical components working in synergy:

| Component | Technology | Role & Purpose |
| :--- | :--- | :--- |
| **Database** | **PostgreSQL 16** | Persistent storage for business data. |
| **Cache** | **Redis** | Query acceleration and session management. |
| **Observability** | **Prometheus** | Metric collection and time-series storage. |
| **Visualization** | **Grafana** | Dashboard creation and visual alerting. |
| **Monitoring** | **cAdvisor** | Real-time resource analysis of all containers. |
| **Administration** | **Adminer** | Database management web interface. |



---

## 🎓 DCA & DevOps Concepts Demonstrated

* **Complex Orchestration:** Using `depends_on` with `healthchecks` to ensure logical startup sequences.
* **Isolated Networking:** Implementation of custom "Bridge" networks to isolate data flows (Backend vs. Frontend).
* **Secret Management:** Handling credentials via `.env` files to prevent pushing plain-text passwords to GitHub.
* **Storage Management:** Using **Named Volumes** to ensure data persistence across container lifecycles.
* **Resource Constraints:** Defining CPU/RAM quotas to prevent local Denial of Service (DoS).

---

## 🚀 Getting Started

1.  **Enter the lab directory:**
    ```bash
    cd 01-dca-docker
    ```

2.  **Configure the environment:**
    * Create a `.env` file based on the required variables (Passwords, Users).

3.  **Launch the infrastructure:**
    ```bash
    docker compose up -d
    ```

4.  **Access services:**
    * **Grafana:** `http://localhost:3000` (Default: admin/admin)
    * **Prometheus:** `http://localhost:9090`
    * **Adminer:** `http://localhost:8080`

---

## 🛠️ Evolution Roadmap
- [ ] Migrate the stack to **Docker Swarm**.
- [ ] Add a **Reverse Proxy (Traefik)** for SSL management.
- [ ] Automate deployment via **GitHub Actions**.

---
*Repository maintained by **dr_labulle** as part of the Azure DevOps Engineer path.*