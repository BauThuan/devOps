
ARG VERSION=latest

FROM node:$VERSION

ARG DIR=/app

WORKDIR $DIR

COPY ./package.json .

