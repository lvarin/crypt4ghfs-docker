FROM docker.io/library/ubuntu:24.04

RUN apt update && \
    apt install -y ca-certificates pkg-config git gcc make automake autoconf libpython3.12-dev \
                    libtool bzip2 zlib1g-dev libssl-dev libedit-dev ninja-build \
                    cmake udev libc6-dev python3-pytest libfuse3-3 libfuse3-dev pipx && \
    pipx install crypt4ghfs && \
    mkdir /root/.c4gh && mkdir /open && mkdir /data && \
    ln -s /root/.local/bin/crypt4ghfs /usr/local/sbin/

COPY --chmod=600 fs.conf /root/.c4gh/
