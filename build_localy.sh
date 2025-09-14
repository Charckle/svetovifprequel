USERNAME=charckle
VERSION=$(cat VERSION)
IMAGE=svetovid

docker build -f Dockerfile-alpine -t $USERNAME/$IMAGE:$VERSION-alpine .
