#!/bin/sh

cd $(dirname $0)

#prepare mandatory puavo-conf vars
PFAD="/etc/puavo-conf"

mkdir -p $PFAD

test -f "$PFAD/puavo-conf.extra" && rm "$PFAD/puavo-conf.extra"
touch "$PFAD/puavo-conf.extra"

for PKG in $(cat packages.list); do
    echo "puavo.pkg.$PKG"                >> "$PFAD/puavo-conf.extra" 
done

for PUAVOCONF in $(cat puavoconf.list); do
    echo "$PUAVOCONF"                >> "$PFAD/puavo-conf.extra" 
done

#install preinit script
cat <<'EOF' > /etc/puavo-conf/scripts/setup_extra_vars
#!/bin/sh
set -eu
test -f /etc/puavo-conf/puavo-conf.extra || exit 0
for pcl in $(cat /etc/puavo-conf/puavo-conf.extra); do
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




