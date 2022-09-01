FROM node:16-alpine AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install

FROM node:16-alpine AS builder
WORKDIR /app
COPY . .
RUN yarn install && yarn build

CMD ["yarn", "serve"]
