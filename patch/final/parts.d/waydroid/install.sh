#!/bin/sh

cd $(dirname "$0")

DIST=$(cat /etc/issue.net |cut -d\  -f3)

case  $DIST in
    10)
       exit 0
       ;;
    11|12)
       ;;
    *)
	exit 0
       ;;
esac

DISTRO="bullseye" 
curl https://repo.waydro.id/waydroid.gpg --output /usr/share/keyrings/waydroid.gpg
echo "deb [signed-by=/usr/share/keyrings/waydroid.gpg] https://repo.waydro.id/ $DISTRO main" > /etc/apt/sources.list.d/waydroid.list
apt-get update
apt-get --yes install waydroid


echo "*****************************geary***************************************"
