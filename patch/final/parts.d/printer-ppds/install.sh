#!/bin/sh
    
cd $(dirname $0)

#downlaod

if ! test -d brands;then
   wget https://amxa.ch/debian/tars/printer-brands.tar.gz
   tar -xzf printer-brands.tar.gz
fi

echo -n "printer-ppds installing ....."



for P in brands/*; do
    $P/install.sh
done


#patch for canon
if test -d /opt/cel/; then
    ln -s /opt/cel/ppd/ /usr/share/cups/model/
    mv /usr/share/cups/model/ppd /usr/share/cups/model/cel
    ln -s /opt/cel/bin/sicgsfilter /usr/lib/cups/filter/
    ln -s /opt/cel/bin/sicnc /usr/lib/cups/filter/      
fi


echo "done"



  


