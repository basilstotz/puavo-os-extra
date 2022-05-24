#!/bin/sh

cd $(dirname $0)

DEB="onlyoffice-desktopeditors_6.1.0-90_amd64.deb"

test -f $DEB || wget https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v6.1.0/$DEB


dpkg -i $DEB


exit
