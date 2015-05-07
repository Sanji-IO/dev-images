FROM sanji/base-dev:wheezy

MAINTAINER Zack YL Shih <zackyl.shih@moxa.com>

COPY scripts /scripts/

RUN apt-get update && \
    apt-get install -y python python-dev && \
    rm -rf /var/lib/apt/lists/* && \
    env python /scripts/get-pip.py && \
    pip install wheel

VOLUME ["/data"]

WORKDIR ["/data"]

CMD /scripts/build_wheels.sh
