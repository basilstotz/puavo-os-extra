if ! test "$UID" = 0; then
   if ! test -d $HOME/.ssh/;then
     echo | ssh-keygen -t rsa -N ""
     cp $HOME/.ssh/id_rsa.pub $HOME/.ssh/authorized_keys
   fi
fi
