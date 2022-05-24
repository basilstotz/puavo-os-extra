#!/bin/sh

cd $(dirname $0)

# make-auto-menu.sh need a proramm started at teh very beginning of the
# installation:

# $ ls /usr/share/applications/ > /tmp/applications.list

# here this is done with bin.d/make-auto-menu-init.sh


/usr/local/sbin/puavo-menu-moreapps > /etc/puavomenu/menudata/80-menu-moreapps.json

cp newapps.png /usr/share/pixmaps/.

