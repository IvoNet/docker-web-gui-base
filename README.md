

# test build

```bash

docker run -it --rm --name test -p 8080:8080 -p 3306:3306 -v $(pwd):/project -e DISPLAY=:1 ivonet/web-gui

docker run -it --rm --name guitrial -v $(pwd)/setup:/setup -v $(pwd):/project -e 8080:8080 -e 4822:4822 ivonet/ubuntu:18.04 /bin/bash


docker run -it --rm --name test --entrypoint /bin/bash ivonet/web-gui
docker run -it --rm --name test -p 8080:8080 ivonet/web-gui

```

## How to upgrade guacd

from root of project
```bash
git clone https://github.com/apache/guacamole-server.git guacd-BUILD
cd guacd-BUILD
docker build -t guacdBUILD .
docker run -d --rm guacdBUILD /bin/sh
docker cp guacdBUILD:/usr/local/guacamole ./root/usr/local/
docker rm -f guacdBUILD
docker rmi -f guacdBUILD rm -rf 
cd ..
rm -rf guacd-BUILD
rm -rf ./root/usr/local/guacamole/share
rm -rf ./root/usr/local/guacamole/bin
```



#grab gosu for easy step-down from root
GOSU_VERSION=1.11
set -x
wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)"
wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc"
export GNUPGHOME="$(mktemp -d)"
gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu { command -v gpgconf > /dev/null && gpgconf --kill all || :; }
rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc
chmod +x /usr/local/bin/gosu
set +x


# add gosu for easy step-down from root
ENV GOSU_VERSION 1.7
RUN set -x \
	&& apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
	&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
	&& wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
	&& gpgconf --kill all \
	&& rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu \
	&& gosu nobody true \
	&& apt-get purge -y --auto-remove ca-certificates wget
