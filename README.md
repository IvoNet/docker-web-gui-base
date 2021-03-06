# web-gui-base

A docker base image for running desktop (graphical) applications as a website.


# Quick try

Using this image as a standalone image would serve no purpose but gives you some eyes :-)
You can try it out:

```bash
docker run -d --name eyes -p 8080:32000 ivonet/web-gui-base
```

and goto [http://localhost:8080](http://localhost:8080) to test it out.

```text
USERNAME: guest
PASSWORD: secret
```

# Usage

So for serious usage of this image you should create your own image based on this one to add the desktop
application of your choice.

* Create a directory structure like this:

```text
root
├── etc
│   ├── cont-init.d
│   │   ├── 100-init.sh
│   │   ├── 110-user-config.sh
│   │   └── 199-cleanup.sh
│   └── services.d
│       ├── your_service_here
│       │   └── run
│       └── another_service_here
│           └── run
└── startapp.sh
```

In the `cont-init.d` folder you can create scripts that will be executed during startup 
before the `service.d` services are started. 
start numbering from 100 onwards to 999 to make sure of the ordering as they will be executed in order.
the numbers below 100 are for the base image.

Every service you want to start after the cont-init.d gets its own folder in the `services.d` folder
and a `run` bash script

the shebang should be `#!/usr/bin/with-contenv bash` for all bash scripts if you want to enable variables
between scripts (`cont-init.d` and `services.d`)

If you want to know more about this read this [s6-overlay](https://github.com/just-containers/s6-overlay)

* Create your own `Dockerfile`

```dockerfile
FROM ivonet/web-gui-base:latest

COPY root/ /
# do your stuff here to add and configure your desktop application
```

create a `startapp.sh` script in your project/root looking something like this:

```bash
#!/usr/bin/env bash
# to make sure the application restarts when closed in the browser
while true;
do
  # Your startup command(s) should come here
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
| VNC_DEPTH                | specify the pixel depth in bits of the vnc desktop to be created. Options are 8, 15, 16 and 24. [doc](https://tigervnc.org/doc/Xvnc.html) | `24` |
| VNC_DPI                  | the dots per inc for the vnc desktop | `96` |
| USER_ID                  | the userid for the nobody user  | `99` |
| GROUP_ID                 | the groupid for the nobody user | `100`|
| DISPLAY                  | the display number used by openbox. This value probably does not need to be changed ever unless you get the following error message during startup `Openbox-Message: Failed to open the display from the DISPLAY environment variable.` then you might want to change it to `:0` or some such | `:1` |
| SERVER_PORT              | the port on which tomcat (guacamole-client) will run. Note that if you overrule this you also overrule the exposed internal port. | `32000` |

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
killall pulseaudio 2>/dev/null
```

## Sample commands

The following commands are only here to give you an idea on how it all might work but all of these
will only show you the eyes as you should use this image as a base not as the main thing

Start in deamon mode with minimal options:

```bash
docker run -d                         \
  --name gui                          \
  -p 32000:32000                      \
  ivonet/web-gui-base
```

Start in interactive mode with lots of options:
```bash
docker run                            \
  -it                                 \
  --rm                                \
  --name gui                          \
  -p 32000:32000                      \
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

# Release Notes

v1.4
- removed audio config as many desktop applications don't need it and it is easy to add later

v1.3
- leaving gnupg and dirmng as dependencies as I need them often (removed from cleanup)
- Fix a security warning for VNC
- added dbus-x11 
- Clean and reinstall alsa-base / pulseaudio (workaround - test in prod...)
- make nobody files owned by nobody :-)

v1.2
- made the tomcat server port configurable as it ran by default on a wel known port
- changed default server port to 32000
- small documentation changes
- added these release notes

v1.1
- made the default colour depth 24
- pulse audio fixes 
- audio documentation
- added demo dockerfile

v1.0
- First working version 

