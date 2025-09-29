#!/bin/sh

# mkdir -p /usr/share/nginx/html
# Remplacer __ENV__ par la variable d’environnement passée par docker-compose
# sed "s/__ENV__/test/g" /constants.template.tsx > /usr/share/nginx/html/constants.tsx

nginx -g 'daemon off;'
