#!/bin/sh

#use 144G ,and not 128G, for /images on bootservers: puavo-setup-filesystem
sed -i /usr/sbin/puavo-setup-filesystems -e 's/128G/144G/'
#use 80 GByte for /images on laptops
sed -i /usr/sbin/puavo-setup-filesystems -e 's/40G/80G/'

exit
