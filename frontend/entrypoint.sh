#!/bin/sh

# mkdir -p /usr/share/nginx/html
# Remplacer __ENV__ par la variable d’environnement passée par docker-compose
# sed "s/__ENV__/test/g" /constants.template.tsx > /usr/share/nginx/html/constants.tsx

sed "s/__ENV__/${ENV}/g" /app/src/config.template.json > /usr/share/nginx/html/config.json

nginx -g 'daemon off;'
