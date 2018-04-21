#!/bin/sh
if [ -d /root/.ssh-ro ]; then
  mkdir -p /root/.ssh
  cp /root/.ssh-ro/* /root/.ssh/
fi
chmod -R 0700 /root/.ssh
chown -R rsyncuser /data
/usr/sbin/sshd -D -e -oStrictModes=no
