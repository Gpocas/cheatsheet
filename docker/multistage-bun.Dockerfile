FROM oven/bun:1.2.18-slim AS build

WORKDIR /app

COPY . .

RUN bun install --frozen-lockfile --production || true && bun install --frozen-lockfile --production

ENV NODE_ENV=production

RUN bun build \
	--compile \
	--minify-whitespace \
	--minify-syntax \
	--target bun \
	--outfile server \
	./src/index.ts


FROM gcr.io/distroless/base

WORKDIR /app

COPY --from=build /app/server server

ENV NODE_ENV=production

CMD ["./server"]

EXPOSE 3000
