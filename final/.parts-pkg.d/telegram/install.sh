#/bin/sh
cd $(dirname $0)


#download and unpack


if ! test -d Telegram;then
    wget https://github.com/telegramdesktop/tdesktop/releases/download/v3.2.5/tsetup.3.2.5.tar.xz
    tar -xf tsetup.3.2.5.tar.xz
fi


#install
test -d /opt/telegram || mkdir -p /opt/telegram/
cp Telegram/* /opt/telegram/.
cp telegram.desktop /usr/share/applications/.
cp telegram.png /usr/share/pixmaps/.

