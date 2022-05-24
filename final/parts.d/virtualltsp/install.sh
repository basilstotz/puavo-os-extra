#!/bin/sh

cd $(dirname $0)

cp ./tree/etc/avahi/avahi-daemon.conf /etc/avahi/avahi-daemon.conf

cp ./tree/usr/local/sbin/puavo-virtualltsp-client /usr/local/sbin/puavo-virtualltsp-client
cp ./tree/etc/systemd/system/puavo-virtualltsp-client.service /etc/systemd/system/puavo-virtualltsp-client.service

cp ./tree/usr/local/bin/puavo-find-puavobox /usr/local/bin/puavo-find-puavobox 

systemctl enable puavo-virtualltsp-client.service

exit 0
