#!/bin/sh
chown -R rsyncuser /data
/usr/sbin/sshd -D -e -oStrictModes=no
