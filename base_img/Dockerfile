FROM python:3.9-buster

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
      apt-get -y --no-install-recommends install \
      autoconf \
      build-essential \
      git \
      jq \
      libxml2 \
      libxslt1.1 \
      zlib1g-dev && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
