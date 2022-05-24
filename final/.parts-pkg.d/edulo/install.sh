#!/bin/sh

cd $(dirname $0)

test -f ./edulo_amd64.deb || wget https://management.edulo.com/edulo_amd64.deb


dpkg -i ./edulo_amd64.deb



exit
