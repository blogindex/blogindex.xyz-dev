FROM lscr.io/linuxserver/code-server:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
    apt-get update && \
    apt-get -y install \
                       direnv \
                       nodejs \
                       python3.11 \
                       python3.11-dev \
                       build-essential \
                       python-is-python3 \
                       nano \
                       hugo \
                       git && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
RUN git clone https://github.com/blogindex/blogindex.xyz.git

LABEL maintainer=BeardedTek

EXPOSE 5000
