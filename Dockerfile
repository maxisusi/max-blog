FROM alpine:latest AS base
RUN apk add git go --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

WORKDIR /app
COPY . .

ENV BASE_URL="localhost"
RUN ["hugo", "--gc", "--minify"]

FROM base AS dev
COPY --from=base /app/public /app
RUN ["hugo", "serve", "--bind" ,"0.0.0.0", "--port", "1313"]

FROM nginx:alpine AS prod
WORKDIR /usr/share/nginx/html

# Copy the built static files from the builder stage
COPY --from=base /app/public .

# Expose port 80 for Nginx
EXPOSE 80
