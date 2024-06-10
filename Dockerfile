
ARG VERSION=latest

FROM node:$VERSION

# ARG DIR=/app

# WORKDIR $DIR

RUN useradd tester

USER tester

# COPY ./package.json .

# RUN npm install