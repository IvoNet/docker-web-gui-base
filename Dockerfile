ARG VERSION=18.04
FROM ivonet/ubuntu:${VERSION}

ENV DEBIAN_FRONTEND="noninteractive"  \
    LC_ALL="C.UTF-8"                  \
    LANG="en_US.UTF-8"                \
    LANGUAGE="en_US.UTF-8"            \
    TERM="xterm"                      \
    DISPLAY=:1

EXPOSE 4822 8080
COPY root/ /
RUN chmod +x /setup/install.sh && /setup/install.sh && rm -rf /setup


