

# test build

```bash
docker run -it --rm --name guitrial -v $(pwd)/setup:/setup -v $(pwd):/project -e 8080:8080 -e 4822:4822 ivonet/ubuntu:18.04 /bin/bash
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



