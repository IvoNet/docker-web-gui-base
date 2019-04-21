FROM ivonet/web-gui-base:latest

RUN apt-get update \
 && apt-get install -y --no-install-recommends\
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    vlc \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY startapp.sh /startapp.sh

ENV APPNAME=vlc                       \
    GUACAMOLE_ADMIN_USERNAME=vlcadmin \
    GUACAMOLE_ADMIN_PASSWORD=vlcadmin \
    GUACAMOLE_USER_NAME=vlc           \
    GUACAMOLE_USER_PASSWORD=secret
