#!/bin/sh

cd $(dirname $0)

touch /etc/puavo-conf/puavo-conf.extra
for PKG in $(cat packages.list); do
    echo "puavo.pkg.$PKG"                >> /etc/puavo-conf/puavo-conf.extra 
done

for PUAVOCONF in $(cat puavoconf.list); do
    echo "$PUAVOCONF"                >> /etc/puavo-conf/puavo-conf.extra 
done

#install preinit script
cat <<'EOF' > /etc/puavo-conf/scripts/setup_extra_vars
#!/bin/sh
set -eu
test -f /etc/puavo-conf/puavo-conf.extra || exit 0
for pcl in $(cat /etc/puavo-conf/puavo-conf.extra); do
    puavo-conf --set-mode add "$pcl"  "" || true
done
exit 0
EOF
chmod +x /etc/puavo-conf/scripts/setup_extra_vars

#patch preinit script execution
edit="s/update_puavoconf_values/setup_extra_vars\nupdate_puavoconf_values/"

sed -i /etc/puavo-conf/scripts/.preinit             -e "$edit"
sed -i /etc/puavo-conf/scripts/.preinit.bootserver  -e "$edit"



