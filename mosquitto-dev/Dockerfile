FROM sanji/base-dev:stable

MAINTAINER Zack YL Shih <zackyl.shih@moxa.com>

RUN apt-get update && \
    apt-get install -y wget && \
    wget -O - http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | \
        apt-key add - && \
    wget -O /etc/apt/sources.list.d/mosquitto-repo.list \
        http://repo.mosquitto.org/debian/mosquitto-repo.list && \
    apt-get update && \
    apt-get install -y \
        libjansson-dev \
        libmosquitto-dev &&\
    rm -rf /var/lib/apt/lists/*
