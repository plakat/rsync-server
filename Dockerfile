FROM alpine
MAINTAINER Wolfram Saringer <docker@plak.at>

RUN apk add --no-cache openssh rsync bash tzdata
RUN ssh-keygen -A

RUN \
  adduser -h /home/rsyncuser -s /bin/bash -D rsyncuser && \
  passwd -u rsyncuser && \
  passwd -d root && \
  ssh-keygen -A
RUN \
  mkdir /home/rsyncuser/.ssh && \
  chmod -R 0700 /home/rsyncuser/.ssh 
COPY authorized_keys /home/rsyncuser/.ssh/
RUN \
  chmod 0600 /home/rsyncuser/.ssh/* && \
  chown -R rsyncuser:rsyncuser /home/rsyncuser

RUN mkdir -p /data

COPY start-sshd.sh /
RUN chmod +x /start-sshd.sh

ENV TZ="Europe/Vienna" \
    LANG="C.UTF-8"

EXPOSE 22

CMD [ "/start-sshd.sh" ]
