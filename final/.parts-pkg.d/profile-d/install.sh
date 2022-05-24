#/bin/sh
cd $(dirname $0)

if test -n "$(ls ./profile.d|grep .sh$)";then
    cp ./profile.d/*.sh /etc/profile.d/.
fi

