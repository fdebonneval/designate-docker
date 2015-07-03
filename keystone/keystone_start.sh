#!/bin/bash

if ! [ "$KEYSTONE_ADMIN_TOKEN" ]; then
    KEYSTONE_ADMIN_TOKEN=$(openssl rand -hex 15)
fi

sed -i \
    -e "s#KEYSTONEDBS_ENV_MYSQL_USER#${KEYSTONEDBS_ENV_MYSQL_USER}#g" \
    -e "s#KEYSTONEDBS_ENV_MYSQL_PASSWORD#${KEYSTONEDBS_ENV_MYSQL_PASSWORD}#g" \
    -e "s#KEYSTONE_ADMIN_TOKEN#${KEYSTONE_ADMIN_TOKEN}#g" \
    /etc/keystone.conf

keystone-manage db_sync && \
keystone-all -d -v
