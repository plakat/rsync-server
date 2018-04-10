#!/bin/sh
docker build -t plakat/rsync-server .
docker push plakat/rsync-server
