#/bin/sh
cd $(dirname $0)


cp ./src/setup-gnome-touch.sh /etc/profile.d/.
rm -r /usr/share/gnome-shell/extensions/bigtouch-ux@puavo.org
cp -r ./src/bigtouch-ux@puavo.org /usr/share/gnome-shell/extensions/

