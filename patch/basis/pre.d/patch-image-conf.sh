#!/bin/sh

CHROOT=$1
CURRENT=$2

LIST="puavo.support.new_bugreport_url puavo.support.image_changelog_url puavo.boot.plymouth.theme puavo.greeter.logo puavo.desktop.vendor.logo puavo.desktop.keyboard.layout puavo.time.timezone puavo.desktop.keyboard.variant puavo.l10n.locale puavo.xsessions.alternative_languages"

                

patch_image_conf(){
echo "{"
for K in $LIST;do
    if test "$K" = "puavo.xsessions.alternative_languages";then
	echo "\"$K\": \"de fr fi en sv\","
    else
        echo "\"$K\": \"$(puavo-conf $K)\","
    fi
done
while IFS= read -r line;do
    #echo "--->$line"                                                                                                                                         
    FOUND=1
    for L in $LIST;do
        if echo $line|grep $L -q;then
           FOUND=0
        fi
    done
    if test $FOUND = 1;then
	if echo $line|grep -qv "{";then echo $line;fi
    fi
done
}


if ! test -e $CHROOT/etc/puavo-conf/image.json.ori;then
    cp $CHROOT/etc/puavo-conf/image.json $CHROOT/etc/puavo-conf/image.json.ori
fi
patch_image_conf < $CHROOT/etc/puavo-conf/image.json.ori > $CHROOT/etc/puavo-conf/image.json

