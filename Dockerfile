# Creates a docker image for bind

FROM ubuntu:14.04
MAINTAINER Jim Lim <jim@jimjh.com>

# install bind9 and dig
RUN apt-get install -y bind9 dnsutils

# setup config
COPY etc/named.conf.local /etc/bind/named.conf.local
COPY etc/local-key /etc/bind/local-key
COPY etc/rndc.key /etc/bind/rndc.key
COPY etc/db.purple.cow /etc/bind/db.purple.cow
COPY etc/db.10 /etc/bind/db.10

# fix permissions
RUN chown -R bind:bind /etc/bind

ENTRYPOINT service bind9 restart && while service bind9 status; do sleep 3; done
