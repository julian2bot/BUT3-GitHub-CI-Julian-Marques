FROM node:latest AS build

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn run build

FROM ghcr.io/static-web-server/static-web-server:2

COPY --from=build /app/dist /app

EXPOSE 80

CMD ["static-web-server", "/app"]