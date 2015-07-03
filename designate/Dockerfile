FROM ubuntu:trusty

RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive

ADD designate.conf /etc/
ADD designate_start.sh /usr/sbin/

RUN \
    apt-get install git python-pip python-virtualenv -y && \
    apt-get build-dep python-lxml -y && \
    mkdir designate && \
#    cd designate && \
#    git init && \
#    git fetch --depth 1 https://github.com/openstack/designate.git stable/juno && \
#    git checkout FETCH_HEAD && \
    git clone https://github.com/openstack/designate.git && \
    cd designate && \
    virtualenv --no-site-packages .venv
    . .venv/bin/activate && \
    git checkout remotes/origin/stable/juno
    pip install -r requirements.txt -r test-requirements.txt && \
    python setup.py install && \
    cd etc/designate && \
    ls *.sample | while read f; do cp $f $(echo $f | sed "s/.sample$//g"); done && \
    cat /etc/designate.conf > designate.conf && \
    apt-get install -y libmysqlclient-dev && \
    pip install mysql-python && \
    mkdir /var/log/designate && \
#    chmod +x /usr/sbin/designate_start.sh && \
#    cp rootwrap.conf /etc


# sed -i \
#    -e "s#DESIGNATEDBS_ENV_MYSQL_USER#${DESIGNATEDBS_ENV_MYSQL_USER}#g" \
#    -e "s#DESIGNATEDBS_ENV_MYSQL_PASSWORD#${DESIGNATEDBS_ENV_MYSQL_PASSWORD}#g" \
#    -e "s#POWERDNSDBS_ENV_MYSQL_USER#${POWERDNSDBS_ENV_MYSQL_USER}#g" \
#    -e "s#POWERDNSDBS_ENV_MYSQL_PASSWORD#${POWERDNSDBS_ENV_MYSQL_PASSWORD}#g" \
#    /etc/designate.conf

# pip install mysql-python
# designate-manage database sync
