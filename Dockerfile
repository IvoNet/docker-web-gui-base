ARG VERSION=stable
FROM ivonet/debian:${VERSION}

ARG GUACD_DIR=/usr/local/guacamole

ENV HOME="/root"                      \
    LC_ALL="C.UTF-8"                  \
    LANG="en_US.UTF-8"                \
    LANGUAGE="en_US.UTF-8"            \
    TERM="xterm"                      \
    LD_LIBRARY_PATH=${GUACD_DIR}/lib  \
    GUACD_LOG_LEVEL=info              \
    DEBIAN_FRONTEND="noninteractive"

ARG RUNTIME_DEPENDENCIES="      \
    gpg                         \
    unzip                       \
    ca-certificates             \
    ghostscript                 \
    libfreerdp-plugins-standard \
    fonts-liberation            \
    fonts-dejavu                \
    xfonts-terminus             \
    vnc4server                  \
    x11-xserver-utils           \
    openbox                     \
    xfonts-base                 \
    xfonts-100dpi               \
    xfonts-75dpi                \
    libfuse2                    \
    openjdk-8-jre               \
    libossp-uuid-dev            \
    libpng-dev                  \
    libfreerdp-dev              \
    libcairo2-dev               \
    tomcat8                     \
    dirmngr                     \
    xrdp                        \
    "

RUN usermod -u 99 nobody                                                          \
 && usermod -g 100 nobody                                                         \
 && usermod -m -d /nobody nobody                                                  \
 && usermod -s /bin/bash nobody                                                   \
 && usermod -a -G adm,sudo nobody                                                 \
 && echo "nobody:PASSWD" | chpasswd

COPY root/ /

RUN apt-get update -qq                                                            \
 && apt-get install -y --no-install-recommends $RUNTIME_DEPENDENCIES              \
 && apt-get install -y --no-install-recommends $(cat "${GUACD_DIR}"/DEPENDENCIES) \
 && rm -rf /var/lib/apt/lists/*                                                   \
 && chmod +x ${GUACD_DIR}/bin/*.sh                                                \
 && ${GUACD_DIR}/bin/link-freerdp-plugins.sh ${GUACD_DIR}/lib/freerdp/guac*.so

EXPOSE 4822
