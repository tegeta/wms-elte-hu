FROM mdillon/postgis:9.6
MAINTAINER Ádám Barancsuk <adam.barancsuk@gmail.com>

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      postgresql-$PG_MAJOR-pgrouting && \
    rm -rf /var/lib/apt/lists/*
