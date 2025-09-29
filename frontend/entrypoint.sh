#!/bin/sh

# Remplacer __ENV__ par la variable d’environnement passée par docker-compose
sed "s/__ENV__/${ENV}/g" /constants.template.tsx > /public/constants.tsx

