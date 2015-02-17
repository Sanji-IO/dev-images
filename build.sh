#!/bin/bash
set -e

if [ $# -lt 1 ]
then
    echo "Usage : $0 <IMAGE> [<ARCH>]"
    exit
fi

cd $1

IMAGE=${1:-'base-dev'}
ARCH=${2:-amd_x64}
TAG=latest

if [ $ARCH == "armhf" ]; then
    TAG=armhf
    cp Dockerfile Dockerfile.tmp
    sed -e "s|debian:stable|mazzolino/armhf-debian|" \
        -e "s|sanji/base-dev:stable|sanji/base-dev:armhf|" \
        Dockerfile.tmp > Dockerfile
fi

(docker build --tag=sanji/$IMAGE:$TAG .) || true

if [ $ARCH == "armhf" ]; then
    mv Dockerfile.tmp Dockerfile
fi