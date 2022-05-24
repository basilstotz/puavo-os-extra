if ! test "$UID" = 0; then
   if test "$(puavo-conf puavo.xsessions.default)" = "puavo-desktop-bigtouch"; then
#       gsettings set org.gnome.shell disable-user-extensions true
       gsettings set org.gnome.mutter dynamic-workspaces true
   else
       if test "$(puavo-conf puavo.xsessions.default)" = "puavo-desktop"; then
#	    gsettings set org.gnome.shell disable-user-extensions false
            gsettings set org.gnome.mutter dynamic-workspaces false
       fi
   fi
   export MOZ_USE_XINPUT2=1
fi
