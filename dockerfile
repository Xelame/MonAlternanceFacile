FROM oven/bun:alpine

WORKDIR /usr/app

COPY package.json ./
COPY src ./src

RUN bun install

ENTRYPOINT [ "bun", "run", "dev" ]