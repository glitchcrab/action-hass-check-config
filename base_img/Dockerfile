FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
      apt-get -y --no-install-recommends install \
      autoconf \
      build-essential \
      git \
      jq \
      libxml2 \
      libxslt1.1 \
      python3 \
      python3-dev \
      python3-pip \
      python3-setuptools \
      python3-wheel \
      zlib1g-dev && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
