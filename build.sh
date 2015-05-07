#!/bin/bash
set -e

if [ $# -lt 1 ]
then
    echo "Usage : $0 <IMAGE> [<ARCH>]"
    exit
fi

cd $1

# debian:wheezy's arch is amd64
ARCH=${2:-amd64}
TAG=wheezy
IMAGE=${1:-'base-dev'}

if [ "$ARCH" != "amd64" ]; then
    IMAGE=$ARCH-$IMAGE
    cp Dockerfile Dockerfile.tmp
    sed -e "s|sanji/base-dev:$TAG|sanji/$ARCH-base-dev:$TAG|" \
        -e "s|sanji/mosquitto-dev:$TAG|sanji/$ARCH-mosquitto-dev:$TAG|" \
	-e "s|amd64|$ARCH|g" \
        Dockerfile.tmp > Dockerfile
fi

if [ "$ARCH" = "armhf" ]; then
    sed -i "s|debian:$TAG|mazzolino/armhf-debian:$TAG|" Dockerfile
fi

(docker build --tag=sanji/$IMAGE:$TAG .) || true

if [ "$ARCH" != "amd64" ]; then
    mv Dockerfile.tmp Dockerfile
fi
