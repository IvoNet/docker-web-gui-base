#!/usr/bin/env bash
#!/usr/bin/env bash
export IDE_HOME=/opt/idea
export IDE_BIN_HOME=/opt/idea/bin
export VM_OPTIONS_FILE=$IDE_BIN_HOME/idea.vmoptions
while true;
do
  cd /project
  . /opt/idea/bin/idea.sh
done
