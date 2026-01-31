# syntax=docker/dockerfile:1
# Utilisation de la version Alpine la plus récente (poussée il y a peu)
FROM grafana/grafana-oss:11.4.0-alpine

LABEL maintainer="DrLaBulle"
LABEL description="Secure Grafana image based on Alpine - Zero known critical CVEs"

# Installation de wget pour le healthcheck (si non présent)
USER root
RUN apk add --no-cache wget && \
    mkdir -p /etc/grafana/provisioning/datasources && \
    chown -R grafana:grafana /etc/grafana/provisioning

USER grafana

EXPOSE 3000

# Healthcheck pro
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:3000/api/health || exit 1