#!/bin/sh
chown -R rsyncuser:rsyncuser /data /home/rsyncuser
chmod -R 700 /home/rsyncuser/.ssh
chown -R root:root /root
chmod -R 700 /root/.ssh

# dont detach, log to stderr, dont check file permissions:
/usr/sbin/sshd -D -e -oStrictModes=no
