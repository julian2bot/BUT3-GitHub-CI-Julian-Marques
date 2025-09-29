FROM node:latest AS build

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN sed "s/__ENV__/test/g" src/constants.template.tsx > src/constants.tsx

RUN npm run build

FROM nginx:alpine

# Copier le frontend compilé
COPY --from=build /app/dist /usr/share/nginx/html

# Copier le template et le script
COPY src/constants.template.tsx /constants.template.tsx
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
# CMD ["nginx", "-g", "daemon off;"]
