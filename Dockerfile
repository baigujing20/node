FROM node:20.11.1-alpine3.19

WORKDIR /app

COPY index.js .

COPY package.json .

EXPOSE 3000

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install

CMD ["node", "index.js"]