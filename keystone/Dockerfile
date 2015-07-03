FROM ubuntu:trusty

RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive

ADD keystone.conf /etc/
ADD logging.conf /etc/
ADD keystone-paste.ini /etc/
ADD keystone_start.sh /usr/sbin/

RUN \
    apt-get install git python-pip python-dev python-mysqldb -y && \
    pip install pbr && \
    mkdir keystone && \
    cd keystone && \
    git init && \
    git fetch --depth 1 https://github.com/openstack/keystone.git stable/juno && \
    git checkout FETCH_HEAD && \
    python2.7 setup.py install && \
    chmod +x /usr/sbin/keystone_start.sh

EXPOSE 35357
EXPOSE 5000
