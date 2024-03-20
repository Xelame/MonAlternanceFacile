FROM oven/bun:latest

WORKDIR /app

RUN apk update && apk add --update nodejs npm

COPY package.json package.json

COPY prisma ./prisma/

RUN bun install

RUN bunx prisma generate 

COPY src ./src

ENTRYPOINT [ "bun", "run", "dev" ]