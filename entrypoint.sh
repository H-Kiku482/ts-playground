#!/bin/bash

USER_ID=${LOCAL_UID:-9001}
GROUP_ID=${LOCAL_GID:-9001}

echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
useradd -u $USER_ID -o -m -s /bin/bash user
groupmod -g $GROUP_ID user
chown user:user /home/user
export HOME=/home/user

apt-get update && apt-get -y install gosu

exec /usr/sbin/gosu user "$@"
