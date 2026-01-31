# syntax=docker/dockerfile:1
FROM adminer:latest

LABEL maintainer="DrLaBulle"
LABEL description="Adminer web interface for database management"

EXPOSE 8080

# Vérification du serveur web
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8080 || exit 1