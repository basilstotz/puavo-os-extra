#!/bin/sh


cd $(dirname $0)

APP="Joplin-1.7.11.AppImage"

#doenaload
if ! test -f $APP; then
   wget https://github.com/laurent22/joplin/releases/download/v1.7.11/$APP
fi

#install

test -d /opt/joplin/ || mkdir -p /opt/joplin
cp $APP /opt/joplin/Joplin.AppImage
chmod +x /opt/joplin/Joplin.AppImage

cp ./joplin.png /usr/share/pixmaps/.

cat <<EOF > /usr/local/bin/joplin
#!/bin/sh
/opt/joplin/Joplin.AppImage
exit
EOF
chmod +x /usr/local/bin/joplin

cat <<EOF >/usr/share/applications/joplin.desktop
[Desktop Entry]
Name=Joplin - Notes
Comment=Notizen verwalten (Evernote)
Exec=joplin
Icon=/usr/share/pixmaps/joplin.png
Terminal=false
X-MultipleArgs=false
Type=Application
Categories=Office;
EOF
