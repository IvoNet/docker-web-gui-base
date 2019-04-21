# web-gui-base

A docker base image for running desktop (graphical) applications as a website.


# Usage

If you have a desktop application that you would like to run in a docker environment this is a
possible image for you.

Using this image as a standalone image would serve no purpose as it





## Sample commands

```bash
docker run -it --rm --name gui -p 8080:8080 ivonet/web-gui-base
docker run -it --rm --name gui -p 8080:8080 -v $(pwd):/project -e DISPLAY=:1 ivonet/web-gui-base
docker run -it --rm --name gui -p 8080:8080 -v $(pwd):/project -e DISPLAY=:1 -e HEIGHT=1440 -e WIDTH=3440 -e GUACAMOLE_ADMIN_USERNAME=admin -e GUACAMOLE_ADMIN_PASSWORD=secret -e GUACAMOLE_USER_NAME=ivonet -e GUACAMOLE_USER_PASSWORD=secret -eivonet/web-gui-base
docker run -it --rm --name gui -p 8080:8080 -v $(pwd):/project -e DISPLAY=:1 -e HEIGHT=1440 -e WIDTH=3440 -e GUACAMOLE_ADMIN_USERNAME=admin -e GUACAMOLE_ADMIN_PASSWORD=secret -e GUACAMOLE_USER_NAME=ivonet -e GUACAMOLE_USER_PASSWORD=secret -e APPNAME=IntelliJ ivonet/web-gui-base

```
