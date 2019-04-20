# docker web-gui





## Sample commands

```bash
docker run -it --rm --name gui -p 8080:8080 ivonet/web-gui-base
docker run -it --rm --name gui -p 8080:8080 -v $(pwd):/project -e DISPLAY=:1 ivonet/web-gui-base
docker run -it --rm --name gui -p 8080:8080 -v $(pwd):/project -e DISPLAY=:1 -e HEIGHT=1440 -e WIDTH=3440 -e GUACAMOLE_ADMIN_USERNAME=admin -e GUACAMOLE_ADMIN_PASSWORD=secret -e GUACAMOLE_USER_NAME=ivonet -e GUACAMOLE_USER_PASSWORD=secret -eivonet/web-gui-base
docker run -it --rm --name gui -p 8080:8080 -v $(pwd):/project -e DISPLAY=:1 -e HEIGHT=1440 -e WIDTH=3440 -e GUACAMOLE_ADMIN_USERNAME=admin -e GUACAMOLE_ADMIN_PASSWORD=secret -e GUACAMOLE_USER_NAME=ivonet -e GUACAMOLE_USER_PASSWORD=secret -e APPLICATION_NAME=IntelliJ ivonet/web-gui-base

```
