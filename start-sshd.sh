#!/bin/sh
if [ -d /root/.ssh-ro ]; then
  mkdir -p /root/.ssh
  cp /root/.ssh-ro/* /root/.ssh/
fi

chown -R root:root /root
chmod -R 0700 /root/.ssh

chown -R rsyncuser /data
chown -R rsyncuser:rsyncuser /data /home/rsyncuser
chmod -R 700 /home/rsyncuser/.ssh

# dont detach, log to stderr, dont check file permissions:
/usr/sbin/sshd -D -e -oStrictModes=no
