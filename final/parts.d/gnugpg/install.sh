#!/bin/sh

cd $(dirname $0)

# install pubkeys to lib
dir="/usr/local/lib/gnupg-repo/$(cat ./repository)"
mkdir -p  $dir
cp -r ./pkg $dir

# /usr/local/lib/gnupg-repo/images.amxa.ch/pkg


cat <<EOF > /etc/systemd/system/gnupg-repo.service
[Unit]
Description=Setup GnuPG of Repo

[Service]
Type=oneshot
ExecStart=cp -r $dir /root/.puavo/gnupg/

[Install]
WantedBy=multi-user.target
EOF


systemctl enable gnupg-repo.service
