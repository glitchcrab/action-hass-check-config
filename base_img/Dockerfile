FROM python:3.9-buster

ENV VENVDIR="/hass-venv"

SHELL ["/bin/bash", "-c"]

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
    rm -rf /var/lib/apt/lists/* && \
    python3.9 -m venv ${VENVDIR} && \
    source ${VENVDIR}/bin/activate && \
    ${VENVDIR}/bin/python -m pip install --upgrade pip
