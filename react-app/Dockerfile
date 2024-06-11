ARG VERSION=latest

FROM node:$VERSION as BUILDER
WORKDIR /app
COPY package*.json ./
RUN npm install --force
COPY ./public ./public
COPY ./src ./src
COPY vite.config.js .
RUN npm run build

FROM nginx:$VERSION
COPY --from=BUILDER /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
