# we need glibc for borgbackup
FROM frolvlad/alpine-glibc

RUN apk add --no-cache wget sed bash tzdata openssh sqlite

# install borg
RUN wget -O /bin/borg https://github.com/borgbackup/borg/releases/download/1.1.14/borg-linux64
RUN chmod 755 /bin/borg

RUN mkdir /backup

COPY backup.sh /backup.sh
COPY startup.sh /startup.sh

COPY crontab /etc/cron/crontab

ENV BORG_RSH ssh -i /ssh/key
ENV BORG_RSH ssh -i /ssh/key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
CMD ["/startup.sh"]