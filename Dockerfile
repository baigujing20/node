FROM node:20.11.1-alpine3.19

WORKDIR /app

COPY app.js .

COPY package.json .

EXPOSE 3000

RUN apk add --no-cache openssl curl bash gcompat iproute2 coreutils &&\
    chmod +x app.js &&\
    npm install

CMD ["node", "app.js"]
