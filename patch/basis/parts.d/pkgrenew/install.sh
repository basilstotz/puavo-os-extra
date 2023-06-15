#!/bin/sh

cd $(dirname $0)


    cp ./sbin/* /usr/local/sbin/.
    cp ./bin/* /usr/local/bin/.

    cat <<EOF > /etc/systemd/system/puavo-pkg-renew.service
[Unit]
Description=renews puavo packages 
#After=syslog.target network.target nss-lookup.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/puavo-pkg-renew


[Install]
WantedBy=multi-user.target
EOF
    systemctl enable puavo-pkg-renew.service


