FROM node:latest AS build

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

FROM ghcr.io/static-web-server/static-web-server:2

COPY --from=build /app/dist /public

# EXPOSE 80

# CMD ["/app"]

COPY constants.template.tsx /constants.template.tsx
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]   