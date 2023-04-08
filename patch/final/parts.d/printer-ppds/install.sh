#!/bin/sh

cd $(dirname $0)

#downlaod
echo -n "printer-ppds installing ....."

if ! test -f cups-printer-ppd.tgz; then
    wget https://amxa.ch/debian/tars/cups-printer-ppd.tgz
fi

tar -xzf cups-printer-ppd.tgz -C /


echo "done"



  


