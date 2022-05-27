#!/bin/sh


if ! grep -q 10 /etc/issue.net; then exit 0;fi 

echo *****************************obs***************************************

# download and unpack
cd $(dirname $0)

cat <<EOF > ./v4l2loopback-ini.c
#include <stdio.h>
main()
{
  setuid(0);
  system("/opt/v4l2loopback/install.sh");
}
EOF

if ! test -f v4l2loopback-ini;then
   make v4l2loopback-ini
fi    

if ! test -d v4l2loopback;then
   git clone https://github.com/umlaeute/v4l2loopback
fi    
 
#install
test -d /opt/v4l2loopback || mkdir -p /opt/v4l2loopback
cp -r ./v4l2loopback /opt/v4l2loopback/.

cp ./v4l2loopback-ini /usr/local/bin/.
chmod a+s /usr/local/bin/v4l2loopback-ini


cd /opt/v4l2loopback

cp ./v4l2loopback/udev/60-persistent-v4l2loopback.rules  /etc/udev/rules.d/.

cat <<'EOF' > ./install.sh
#
#OPTS="devices=2 video_nr=10,20 card_label='OBS-Cam','OpenBoard-Cam' exclusive_caps=1,1"
OPTS="devices=2 video_nr=10,11 exclusive_caps=1,1"
#
if  ! lsmod|grep -q v4l2loopback; then
    cd /opt/v4l2loopback/v4l2loopback
    make && make install && make install-utils     
    depmod -a
    #modprobe -r v4l2loopback  
    modprobe v4l2loopback $OPTS
fi
EOF
chmod +x ./install.sh


exit 0



#OPTS="devices=1 video_nr=10 card_label='OBS-Cam' exclusive_caps=1"
#echo "options v4l2loopback $OPTS" > /etc/modprobe.d/v4l2loopback.conf
#echo "v4l2loopback" > /etc/modules-load.d/v4l2loopback.conf


