# slowproxy
A simple nginx + tc container

## Build the image
DOCKER_BUILDKIT=1 docker build --no-cache -f Dockerfile --target final -t slowproxy .

## Run the container
docker compose up
