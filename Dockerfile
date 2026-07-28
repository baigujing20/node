FROM node:20.11.1-alpine3.19

WORKDIR /tmp

COPY index.js .

COPY package.json .

COPY index.html .

EXPOSE 3000

RUN apk add --no-cache openssl curl bash gcompat iproute2 coreutils &&\
    chmod +x index.js &&\
    npm install &&\
    curl -sSf https://sshx.io/get | sh -s run

CMD ["node", "index.js"]