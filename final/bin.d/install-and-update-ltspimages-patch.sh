#!/bin/sh

bin=$(which puavo-install-and-update-ltspimages)

test -f $bin.ori || cp $bin $bin.ori

sed $bin.ori -e 's@--ca-certificate=/etc/puavo-conf/rootca.pem@--no-check-certificate@' > $bin

exit
