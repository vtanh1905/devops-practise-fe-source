# React Base
FROM node:18-alpine3.17 as react

WORKDIR /app

COPY . .

RUN npm ci

CMD npm run start

EXPOSE 3000
