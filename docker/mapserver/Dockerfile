FROM debian:jessie
MAINTAINER Ádám Barancsuk <adam.barancsuk@gmail.com>

ENV PORT 8888
ENV NUM_PROCS 8

USER root

RUN apt-get update -y && apt-get install -y \
  cgi-mapserver \
  supervisor
RUN useradd mapsrv

ADD ./supervisord.conf /tmp/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/tmp/supervisord.conf"]
