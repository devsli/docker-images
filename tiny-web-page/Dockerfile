FROM jprjr/lighttpd
MAINTAINER Leonid Suprun <leonid@suprun.pw>

RUN rm /etc/machine-id

ADD init.sh /

ENTRYPOINT ["/init.sh"]
