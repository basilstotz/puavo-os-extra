#!/bin/sh

cd $(dirname "$0")

DIST=$(cat /etc/issue.net |cut -d\  -f3)

case  $DIST in
    10)
       apt-get -y -t buster-backports install geary
       ;;
    11)
       apt-get -y install geary
       ;;
    *)
       ;;
esac
        

echo "*****************************geary***************************************"
