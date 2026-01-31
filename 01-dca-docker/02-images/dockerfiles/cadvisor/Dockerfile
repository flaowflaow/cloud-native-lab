# syntax=docker/dockerfile:1
FROM gcr.io/cadvisor/cadvisor:v0.47.2

LABEL maintainer="DrLaBulle"
LABEL description="Container resource usage analyzer"

EXPOSE 8080

# Vérification de l'exposition des métriques
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/metrics || exit 1