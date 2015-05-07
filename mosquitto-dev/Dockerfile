FROM sanji/base-dev:wheezy

MAINTAINER Zack YL Shih <zackyl.shih@moxa.com>

ADD ./ /home
RUN apt-get update && \
    apt-get install -y libc-ares2 && \
    dpkg -i /home/amd64/libmosquitto1_1.3.5-0mosquitto1_amd64.deb && \
    dpkg -i /home/libmosquitto-dev_1.3.5-0mosquitto1_all.deb && \
    apt-get install -y wget && \
    apt-get install -y libjansson-dev && \
    rm -rf /var/lib/apt/lists/*
