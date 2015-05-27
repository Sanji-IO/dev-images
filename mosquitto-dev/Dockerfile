FROM sanji/base-dev:wheezy

MAINTAINER Zack YL Shih <zackyl.shih@moxa.com>

ADD ./ /home
RUN apt-get update && apt-get install -y wget && \
    wget -O - http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | \
    apt-key add - && \
    wget -O /etc/apt/sources.list.d/mosquitto-repo.list \
        http://repo.mosquitto.org/debian/mosquitto-wheezy.list && \
    wget http://repo.mosquitto.org/debian/pool/main/m/mosquitto/libmosquitto-dev_1.4.2-0mosquitto1~nows_all.deb && \
    apt-get update && \
    apt-get install -y libjansson-dev libmosquitto1 && \
    dpkg -i libmosquitto-dev_1.4.2-0mosquitto1~nows_all.deb && \
    rm -rf /var/lib/apt/lists/*
