#!/bin/sh
cd /setup/scripts
for script in [0-9][0-9][0-9]*.sh
do
    echo "Executing script: ${script}"
    . ./"${script}";
done
cd -
