#!/bin/bash

IMAGE_NAME="$1"
if [ -z "$IMAGE_NAME" ]
then
    IMAGE_NAME="joemat/docker-ffdiaporama"
fi

mkdir -p "$HOME/ffdiaporama"
xhost +localhost

sudo docker run --rm -it \
     --net host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY \
    --device /dev/snd \
    --name ffdiaporama \
    -v "$HOME/ffdiaporama:/home/ffdiaporama" \
    "$IMAGE_NAME"
