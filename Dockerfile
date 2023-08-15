# React Base
FROM node:18-alpine3.17 as react

WORKDIR /app

COPY . .

RUN npm ci

RUN npm run build

# Nginx Base
FROM nginx:alpine

COPY --from=react /app/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=react /app/build .

ENV REACT_APP_SERVER_URL=http://localhost

ENTRYPOINT ["nginx", "-g", "daemon off;"]