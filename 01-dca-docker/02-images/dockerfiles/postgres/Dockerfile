# syntax=docker/dockerfile:1
FROM postgres:16-alpine

LABEL maintainer="DrLaBulle"
LABEL description="PostgreSQL 16 durci avec Healthcheck"

# Copie des scripts d'initialisation (SQL/Shell)
# Ils seront ex?cut?s automatiquement au premier d?marrage
COPY ./init-scripts/ /docker-entrypoint-initdb.d/

# Healthcheck : Vital pour l'orchestration (Compose/Swarm/K8s)
HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD pg_isready -U ${POSTGRES_USER:-postgres}

USER postgres
