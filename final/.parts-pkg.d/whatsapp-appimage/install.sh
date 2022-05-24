#/bin/sh
cd $(dirname $0)


#download and unpack

if ! test -f walc.AppImage;then
    wget https://github.com/cstayyab/WALC/releases/download/v0.1.11-Post/walc.AppImage
fi


#install
test -d /opt/walc || mkdir -p /opt/walc/
cp walc.AppImage /opt/walc/.
cp walc.desktop /usr/share/applications/.
cp walc.png /usr/share/pixmaps/.

