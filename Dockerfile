FROM docker.io/library/ubuntu:24.04

RUN apt update && \
    apt install -y pkg-config gcc libpython3-dev pipx libfuse3-dev && \
    pipx install crypt4ghfs && \
    mkdir /root/.c4gh && mkdir /open && mkdir /data && \
    ln -s /root/.local/bin/crypt4ghfs /usr/local/sbin/

COPY --chmod=600 fs.conf /root/.c4gh/
