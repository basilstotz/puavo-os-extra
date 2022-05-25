#!/bin/sh

cd $(dirname $0)

#prepare mandatory puavo-conf vars
PFAD="/state/etc/puavo/local"

test -f "$PFAD/puavo-conf.extra" && rm "$PFAD/puavo-conf.extra"
touch "$PFAD/puavo-conf.extra"

for PKG in $(cat packages.list); do
    echo "puavo.pkg.$PKG"                >> "$PFAD/puavo-conf.extra" 
done

for PUAVOCONF in $(cat puavoconf.list); do
    echo "$PUAVOCONF"                >> "$PFAD/puavo-conf.extra" 
done

#puaco-conf-extra.service
cat <<EOF > /etc/systemd/system/puavo-conf-extra.service
[Unit]
Description=Setup Extra Puavo-Conf Vars
[Service]
Type=oneshot
ExecStart=/usr/local/sbin/puavo-conf-extra
[Install]
WantedBy=multi-user.target
EOF
systemctl enable puavo-conf-extra.service


cat <<'EOF' > /usr/local/sbin/puavo-conf-extra
#!/bin/sh
touch /state/etc/puavo/local/puavo-conf.extra
OLD=$(cat /state/etc/puavo/local/puavo-conf.extra)
EXTRA="$(puavo-conf puavo.puavoconf.extra 2>/dev/null)"
ALL="${EXTRA} ${OLD} puavo.puavoconf.extra"
NEW=""
for VAR in ${ALL}; do
   if ! echo "${NEW}" | grep -q "$(echo ${VAR}|cut -d= -f1)"; then
      NEW="${VAR}\n
   fi
done
echo "${NEW}" > /state/etc/puavo/local/puavo-conf.extra
exit 0
EOF
chmod +x /usr/local/sbin/puavo-conf-extra

#install preinit script
cat <<'EOF' > /etc/puavo-conf/scripts/setup_extra_vars
#!/bin/sh
set -eu
test -f /state/etc/puavo/local/puavo-conf.extra || exit 0
for pcl in $(cat /state/etc/puavo/local/puavo-conf.extra); do
    name=$( echo "${pcl}" | cut -d= -f1 )
    value=$( echo "${pcl}" | cut -s -d= -f2 )
    puavo-conf --set-mode add "${name}"  "${value}" 2>/dev/null || true
done
exit 0
EOF
chmod +x /etc/puavo-conf/scripts/setup_extra_vars

#patch preinit script execution
if ! grep -q  setup_extra_vars /etc/puavo-conf/scripts/.preinit; then 
   edit="s/update_puavoconf_values/setup_extra_vars\nupdate_puavoconf_values/"
   sed -i /etc/puavo-conf/scripts/.preinit             -e "$edit"
   sed -i /etc/puavo-conf/scripts/.preinit.bootserver  -e "$edit"
fi

exit 0




