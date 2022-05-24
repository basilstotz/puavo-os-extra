if ! test $USER = "guest";then 

    loc=$(/usr/lib/puavo-ltsp-client/lookup-image-server-by-dns|cut -d":" -f1|grep -v "10.249.15.254")

    if test -f $HOME/.config/gtk-3.0/bookmarks;then 
        cat $HOME/.config/gtk-3.0/bookmarks | grep -v "smb://${USER}@.*${USER}" >  /tmp/$USER.bookmarks
    else
	test -d $HOME/.config/gtk-3.0 || mkdir -p $HOME/.config/gtk-3.0
	touch /tmp/$USER.bookmarks
    fi
    if test -n "$loc";then
       ort="smb://$USER@$loc/$USER"
       echo "$ort $USER auf PuavoBox" >> /tmp/$USER.bookmarks
    fi

    mv /tmp/$USER.bookmarks $HOME/.config/gtk-3.0/bookmarks

fi



