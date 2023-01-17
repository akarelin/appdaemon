#!/bin/sh

CONF=/conf
CONF_SRC=/usr/src/app/conf

#install user-specific packages
apk add --no-cache $(find $CONF -name system_packages.txt | xargs cat | tr '\n' ' ')
#check recursively under CONF for additional python dependencies defined in requirements.txt
find $CONF -name requirements.txt -exec pip3 install --upgrade -r {} \;

# Lets run it!
exec appdaemon -c $CONF "$@"
