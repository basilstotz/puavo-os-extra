#!/bin/sh

cd $(dirname "$0")

curl -s https://install.zerotier.com | bash


    cat <<EOF > /etc/systemd/system/zerotier-join.service
[Unit]
Description=join zerotier network 
After=syslog.target network.target nss-lookup.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/zerotier-join


[Install]
WantedBy=multi-user.target
EOF

    systemctl enable zerotier-join.service

    cat <<'EOF' > /usr/local/bin/zerotier-join
#!/bin/sh

NETWORK=$(puavo-conf puavo.zerotier.network)

if test -n "$NETWORK"; then
   zerotier-cli join "$NETWORK"
fi
EOF

    chmod +x /usr/local/bin/zerotier-join
    
echo "*****************************zerotiers***************************************"
