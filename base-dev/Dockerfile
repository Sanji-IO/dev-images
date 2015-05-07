FROM debian:wheezy

MAINTAINER Zack YL Shih <zackyl.shih@moxa.com>

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libstdc++6:i386 \
    libgcc1:i386 \
    zlib1g:i386 \
    build-essential \
    libicu-dev \
    libssl-dev \
    debhelper \
    fakeroot \
    git \
    sudo \
    mtd-utils \
    curl && \
    rm -rf /var/lib/apt/lists/* # 20150225
