



## upgrade guacd

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
