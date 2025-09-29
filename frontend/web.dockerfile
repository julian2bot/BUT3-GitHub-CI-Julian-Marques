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
