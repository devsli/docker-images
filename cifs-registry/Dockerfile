FROM registry
MAINTAINER Leonid Suprun <mr.slay@gmail.com>

RUN apt-get update			\
 && apt-get install -y cifs-utils	\
 && apt-get clean			\
 && rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD mount.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
