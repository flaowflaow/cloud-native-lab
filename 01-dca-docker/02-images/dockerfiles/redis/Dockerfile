# syntax=docker/dockerfile:1
FROM redis:7.2-alpine

LABEL maintainer="DrLaBulle"
LABEL description="Hardened Redis image with custom configuration and healthcheck"

# Sécurisation : On expose le port standard
EXPOSE 6379

# Healthcheck : Vérifie si Redis répond aux pings
# Vital pour s'assurer que le cache est prêt avant de lancer l'app
HEALTHCHECK --interval=20s --timeout=5s --retries=3 \
  CMD redis-cli ping | grep PONG || exit 1

# Exécution avec un utilisateur non-privilégié (déjà présent dans l'image alpine)
USER redis