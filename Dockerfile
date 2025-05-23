FROM node:22-alpine3.21

WORKDIR /app

RUN apk add --no-cache git tini
RUN git clone https://github.com/xdebug/vscode-php-debug.git

WORKDIR /app/vscode-php-debug

RUN npm install
RUN npm run build

ENTRYPOINT ["tini", "--", "node", "out/phpDebug.js"]
