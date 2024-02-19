# syntax=docker/dockerfile:1

FROM node:21-alpine AS build

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

FROM node:21-alpine

LABEL org.opencontainers.image.authors="contact@lindwen.fr"
LABEL org.opencontainers.image.title="Cors Anywhere"
LABEL org.opencontainers.image.description="NodeJS reverse proxy which adds CORS headers to the proxied request."
LABEL org.opencontainers.image.source="https://github.com/Lindwen/cors-anywhere"

WORKDIR /usr/src/app
COPY --from=build /usr/src/app .

EXPOSE 8080

CMD ["node", "server.js"]
