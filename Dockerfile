ARG VERSION=18.04
FROM ivonet/ubuntu:${VERSION}

ARG GUACD_DIR=/usr/local/guacamole

ENV HOME="/root"                      \
    LC_ALL="C.UTF-8"                  \
    LANG="en_US.UTF-8"                \
    LANGUAGE="en_US.UTF-8"            \
    TERM="xterm"                      \
    LD_LIBRARY_PATH=${GUACD_DIR}/lib  \
    GUACD_LOG_LEVEL=info              \
    DEBIAN_FRONTEND="noninteractive"

COPY root/ /

RUN . /setup/install.sh

EXPOSE 4822 3306 8080

VOLUME ["/var/lib/mysql"]
