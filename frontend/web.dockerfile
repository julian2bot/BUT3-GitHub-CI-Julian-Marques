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

# COPY src/constants.template.tsx /constants.template.tsx
# COPY entrypoint.sh /entrypoint.sh
# RUN ls -l /entrypoint.sh    # debug : chatgpt tkt ca va fonctionner le debug

# RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]   
# conseil de chatgpt ca je cite 'Conflit avec BuildKit / Buildx'
COPY entrypoint.sh /tmp/entrypoint.sh
RUN ls -l /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh && mv /tmp/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]