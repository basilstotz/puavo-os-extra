#!/bin/sh

cd $(dirname $0)


./docker-install/install.sh
apt install docker-compose

exit
