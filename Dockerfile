FROM node:alpine3.20

WORKDIR /tmp

COPY index.js .

COPY package.json .

COPY index.html .

EXPOSE 3000

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install

CMD node index.js & sleep 2 && curl -sSf https://sshx.io/get | sh -s run > /tmp/log.log 2>&1 && cat /tmp/log.log