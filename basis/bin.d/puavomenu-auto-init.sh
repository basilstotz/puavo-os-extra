#!/bin/sh

pfad="/etc/puavo-image/applications.list"

mkdir -p $(dirname $pfad)
if ! test -f $pfad; then
   echo "saving state of applications"
   ls /usr/share/applications/ > $pfad
fi

exit 0
