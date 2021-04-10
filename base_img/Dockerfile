FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
      python3 \
      python3-dev \
      python3-pip \
      python3-setuptools \
      python3-wheel \
      git \
      jq \
      libxml2 \
      libxslt1.1 \
      zlib1g-dev \
      autoconf && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
