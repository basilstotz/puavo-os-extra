if ! test "$UID" = 0; then
if grep -q 'de_CH.UTF-8' /etc/default/locale; then 
   export LANG=de_CH.UTF-8
   export LANGUAGE=de
   export LC_CTYPE="de_CH.UTF-8"
   export LC_NUMERIC=de_CH.UTF-8
   export LC_TIME=de_CH.UTF-8
   export LC_COLLATE="de_CH.UTF-8"
   export LC_MONETARY=de_CH.UTF-8
   export LC_MESSAGES="de_CH.UTF-8"
   export LC_PAPER=de_CH.UTF-8
   export LC_NAME="de_CH.UTF-8"
   export LC_ADDRESS="de_CH.UTF-8"
   export LC_TELEPHONE="de_CH.UTF-8"
   export LC_MEASUREMENT=de_CH.UTF-8
   export LC_IDENTIFICATION="de_CH.UTF-8"
   export LC_ALL=
fi
fi
