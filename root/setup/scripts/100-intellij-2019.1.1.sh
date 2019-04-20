#!/usr/bin/with-contenv bash

echo "Installing IntelliJ..."
date
/usr/bin/curl -s -L "https://download-cf.jetbrains.com/idea/ideaIU-2019.1.1.tar.gz" | /bin/tar xz -C /opt/
date
ls -lsa /opt

mv -v /opt/idea* /opt/idea
