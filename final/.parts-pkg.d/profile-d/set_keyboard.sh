#KBD=$(puavo-conf puavo.desktop.keyboard.layout)
#gsettings set org.gnome.desktop.input-sources sources "[('xkb', '${KBD}')]"

export LANG=de_CH.UTF-8
export LANGUAGE=de

gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'ch')]"
gsettings set org.gnome.system.locale region 'de_CH.UTF-8'


