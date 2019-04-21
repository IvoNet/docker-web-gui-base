ARG VERSION=18.04
FROM ivonet/ubuntu:${VERSION}

ENV DISPLAY=:1

COPY root/ /
RUN chmod +x /setup/install.sh && /setup/install.sh && rm -rf /setup

EXPOSE 8080


