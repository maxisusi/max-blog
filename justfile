dev:
  docker run --rm -it -p 1313:1313 -v $(pwd)/:/app  blog:dev

prod:
  docker run --rm -it -p 80:80 -v $(pwd)/:/app blog:prod

build:
  docker build -t blog .

build-prod:
  docker build --target prod -t blog:prod .
