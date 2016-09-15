FROM ubuntu:latest

RUN sed -i 's/archive/ru.archive/g' /etc/apt/sources.list \
 && apt-get update                                        \
 && apt-get install -y git make gcc autoconf libtool      \
        pkg-config libxml2-dev dejagnu python-dev swig    \
	zlib1g-dev texinfo                                \
 && apt-get clean                                         \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN git clone git://git.sv.gnu.org/libredwg.git
