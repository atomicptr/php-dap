ARG BUN_VERSION="1"

FROM oven/bun:${BUN_VERSION}-alpine

WORKDIR /app

RUN apk add --no-cache git
RUN git clone https://github.com/xdebug/vscode-php-debug.git

WORKDIR /app/vscode-php-debug

RUN bun install

ENTRYPOINT ["bun", "/app/vscode-php-debug/src/phpDebug.ts"]
