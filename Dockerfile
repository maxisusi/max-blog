FROM alpine:latest

EXPOSE 1313

RUN apk add git
RUN apk add go

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

WORKDIR /app
COPY . .

RUN hugo --gc --minify --baseURL blog.maxbalej.com

CMD ["hugo", "serve", "--bind" ,"0.0.0.0", "--port", "1313"]


