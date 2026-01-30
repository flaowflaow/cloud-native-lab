# syntax=docker/dockerfile:1
FROM prom/prometheus:v2.45.0

LABEL maintainer="DrLaBulle"
LABEL description="Prometheus pr?-configur? pour le monitoring Docker"

# On injecte la config directement pour rendre l'image autonome
COPY ./config/prometheus.yml /etc/prometheus/prometheus.yml

# Exposition du port de m?triques
EXPOSE 9090

# V?rification du fonctionnement interne
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --quiet --tries=1 --spider http://localhost:9090/-/healthy || exit 1
