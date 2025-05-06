#!/bin/bash

set -e
CONTAINER_NAME="myGeant4"
IMAGE_NAME="geant4-with-vim:11.2.1"

# Build Docker image if not already present
if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
  echo "Building Geant4 Docker image with vim..."
  docker build -t $IMAGE_NAME .
fi

# Check if container already exists
if [[ "$(docker ps -aq -f name=^${CONTAINER_NAME}$)" ]]; then
  echo "Starting existing container: $CONTAINER_NAME"
  docker start -ai $CONTAINER_NAME
else
  echo "Creating and running new container: $CONTAINER_NAME"
  xhost +local:root
  docker run -it \
    --name $CONTAINER_NAME \
    --env DISPLAY=$DISPLAY \
    --env QT_X11_NO_MITSHM=1 \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume geant4data:/home/geant4user \
    $IMAGE_NAME \
    bash
fi
