#!/bin/sh

cd $(dirname $0)


# puavomenu fallback
cp ./91-tab-main.json /etc/puavomenu/menudata/90-tab-main.json
cp ./91-tab-subjects.json /etc/puavomenu/menudata/90-tab-subjects.json

cp ./newapps.png /usr/share/pixmaps/.
cp ./moreapps.png /usr/share/pixmaps/.

cp ./bin/puavomenu-reload /usr/local/bin/.
cp ./bin/puavomenu-moreapps /usr/local/sbin/.


#!/bin/sh

PFAD=/etc/puavomenu/menudata/50-default.json

test -f $PFAD || exit 0

echo  patching 50-default.json
sed -i $PFAD -e "s@/usr/share/puavo-art/puavomenu-icons/programming.svg@/usr/share/icons/Faenza/categories/48/gnome-devel.png@g"
sed -i $PFAD -e "s@/usr/share/puavo-art/puavomenu-icons/office.svg@/usr/share/icons/Faenza/categories/48/applications-office.png@g"
sed -i $PFAD -e  "s@/usr/share/puavo-art/puavomenu-icons/internet.svg@/usr/share/icons/Faenza/categories/48/applications-internet.png@g"
sed -i $PFAD -e "s@/usr/share/puavo-art/puavomenu-icons/graphics.svg@/usr/share/icons/Faenza/categories/48/applications-painting.png@g"
sed -i $PFAD -e "s@/usr/share/puavo-art/puavomenu-icons/games.svg@/usr/share/icons/Faenza/categories/48/applications-cardgames.png@g"
sed -i $PFAD -e "s@/usr/share/puavo-art/puavomenu-icons/education.svg@/usr/share/icons/Faenza/categories/48/applications-games.png@g"
sed -i $PFAD -e "s@/usr/share/puavo-art/puavomenu-icons/audiovideo.svg@/usr/share/icons/Faenza/categories/48/applications-multimedia.png@g"
sed -i $PFAD -e "s@/usr/share/puavo-art/puavomenu-icons/accessories.svg@/usr/share/icons/Faenza/categories/48/applications-accessories.png@g"

exit 0
