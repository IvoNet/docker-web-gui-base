# web-gui-base

A docker base image for running desktop (graphical) applications as a website.


# Quick try

Using this image as a standalone image would serve no purpose but gives you some eyes :-)
You can try it out:

```bash
docker run -d --name eyes -p 8080:8080 ivonet/web-gui-base
```

and goto [http://localhost:8080](http://localhost:8080) to test it out.

```text
USERNAME: guest
PASSWORD: secret
```

# Usage

So for serious usage of this image you should create your own image based on this one to add the desktop
application of your choice.

The way to do this is quite easy:

```dockerfile
FROM ivonet/web-gui-base:latest

ADD startapp.sh /startapp.sh

# do your stuff here to add and configure your desktop application
```

create a `startapp.sh` script in your project looking something like this:

```bash
#!/usr/bin/env bash
# Openbox default startup script
while true;
do
  # Your startup command should come here
  /usr/bin/xeyes
done
```

build your image and you should be gearing to go...


## Configurable environment variables

### Default variables

These variables should be defined by yourself at startup or in your `Dockerfile` during the build
to make the application look good and give yourself some control over the working. 

| Variable name            | Description  | Default |
| :----------------------- | :----------- | :------ |
| APPNAME                  | the name of the guacamole connection | `DESKTOP_APPLICATION` of you have your own image but did not define a name and `eyes` if you are just testing the base image |
| GUACAMOLE_ADMIN_USERNAME | the guacamole admin username if you log in with this user you can configure everything | `guacadmin` |
| GUACAMOLE_ADMIN_PASSWORD | the guacamole admin passoword | `guacadmin` |
| GUACAMOLE_USER_NAME      | a guacamole limited user with only access to the defined application | `guest` |
| GUACAMOLE_USER_PASSWORD  | the password for the limited user | `secret` |
| PULSE_SERVER             | the server to connect to if you want sound | see section below about `Using audio` |


### Advanced variables

Most of the time these variables do not need to be changed often unless you want to :-)

| Variable name            | Description  | Default |
| :----------------------- | :----------- | :------ |
| WIDTH                    | the width of the screen displayed in the browser | `1920` |
| HEIGHT                   | the height of the screen displayed in the browser | `1080` |
| VNC_DEPTH                | specify the pixel depth in bits of the vnc desktop to be created. Options are 8, 15, 16 and 24. [doc](https://tigervnc.org/doc/Xvnc.html) | `16` |
| VNC_DPI                  | the dots per inc for the vnc desktop | `96` |
| USER_ID                  | the userid for the nobody user  | `99` |
| GROUP_ID                 | the groupid for the nobody user | `100`|
| DISPLAY                  | the display number used by openbox. This value probably does not niet to be changed ever unless you get the following error message during startup `Openbox-Message: Failed to open the display from the DISPLAY environment variable.` then you might want to change it to `:0` or some such | `:1` |

## Using audio

If you have a desktop app with sound and you want to be able to hear it outside of your docker container you
need something special like pulseaudio.
The base image already has this available but you need to make it available to the host machine by
adding the following to your startup command:

```bash
-e PULSE_SERVER=docker.for.mac.localhost  -v ~/.config/pulse:/nobody/.config/pulse
```

Note: only tested on macOs
Oh and on the mac you need to install a Pulseaudio server and start it.

Install pulseaudio:
```bash
brew install pulseaudio
```

Start pulseaudio server:
```bash
pulseaudio --load=module-native-protocol-tcp --exit-idle-time=-1 --daemon 2>/dev/null
```

After these steps you should be able to hear sound created inside the docker image on your host machine.

Stop pulseaudio server on host:

```bash
pulseaudio --kill 2>/dev/null
```

## Sample commands

The following commands are only here to give you an idea on how it all might work but all of these
will only show you the eyes as you should use this image as a base not as the main thing

Start in deamon mode with minimal options:

```bash
docker run -d                         \
  --name gui                          \
  -p 8080:8080                        \
  ivonet/web-gui-base
```

Start in interactive mode with lots of options:
```bash
docker run                            \
  -it                                 \
  --rm                                \
  --name gui                          \
  -p 8080:8080                        \
  -e DISPLAY=:1                       \
  -e WIDTH=3440                       \
  -e HEIGHT=1440                      \
  -e APPNAME=eyes                     \
  -e GUACAMOLE_ADMIN_USERNAME=admin   \
  -e GUACAMOLE_ADMIN_PASSWORD=secret  \
  -e GUACAMOLE_USER_NAME=user         \
  -e GUACAMOLE_USER_PASSWORD=secret   \
  -e VNC_DEPTH=24                     \
  ivonet/web-gui-base
```
