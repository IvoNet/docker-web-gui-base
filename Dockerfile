ARG DEBIAN_VERSION=stable
FROM ivonet/debian:${DEBIAN_VERSION}

ARG GUACD_DIR=/usr/local/guacamole

# Runtime environment
ENV LC_ALL=C.UTF-8
ENV LD_LIBRARY_PATH=${GUACD_DIR}/lib
ENV GUACD_LOG_LEVEL=info

ARG RUNTIME_DEPENDENCIES="            \
        ca-certificates               \
        ghostscript                   \
        libfreerdp-plugins-standard   \
        fonts-liberation              \
        fonts-dejavu                  \
        xfonts-terminus"

COPY root/ /

# Bring runtime environment up to date and install runtime dependencies
RUN apt-get update                                                                   \
 && apt-get install -y --no-install-recommends $RUNTIME_DEPENDENCIES                 \
 && apt-get install -y --no-install-recommends $(cat "${GUACD_DIR}"/DEPENDENCIES)    \
 && rm -rf /var/lib/apt/lists/*                                                      \
 && chmod +x ${GUACD_DIR}/bin/*.sh                                                   \
 && ${GUACD_DIR}/bin/link-freerdp-plugins.sh ${GUACD_DIR}/lib/freerdp/guac*.so


EXPOSE 4822
