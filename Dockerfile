FROM alpine:latest AS base
RUN apk add git
RUN apk add go
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

WORKDIR /app
COPY . .
CMD hugo --gc --minify
ENV BASE_URL="blog.maxbalej.com"

FROM base AS dev
EXPOSE 1313
COPY --from=base /app /app
CMD ["hugo", "serve", "--bind" ,"0.0.0.0", "--port", "1313"]

FROM base AS prod
EXPOSE 1313
COPY --from=base /app /app
CMD hugo serve --bind 0.0.0.0 --port 1313 --baseURL ${BASE_URL}
