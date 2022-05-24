#!/bin/bash

cd $(dirname $0)


if test -f /var/local/puavo-img-tool/applications.list;then
    ALT=$(cat /var/local/puavo-img-tool/applications.list | xargs basename -s .desktop)
else
    echo "no inputfile"
    exit 0
fi

NEU=$(ls /usr/share/applications/*.desktop | xargs basename -s .desktop )

#echo $ALT
#echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#echo $NEU

DIFF=""
for A in $NEU ;do
   if ! [[ "$ALT" == *$A* ]]; then
	DIFF="$DIFF $A"    
   fi
done


#alles start
echo "{"

#programms start
echo "  \"programs\": {"
FIRST_P=0
for A in $DIFF;do
	 if test $FIRST_P = 0;then
	     FIRST_P=1
	 else
	     echo ","
	 fi	
         echo "        \"$A\": {"
         echo "            \"tags\": \"default\""
         echo -n "         }"
done

echo        
echo -n "   }"
#programms ende

#categorie start
FIRST_A=0
echo ","
echo "  \"menus\": {"
echo "     \"menu-newapps\": {"
echo "        \"name\":  \"Mehr Programme\","
#echo "        \"position\": 20,"
echo "        \"icon\": \"/usr/share/pixmaps/newapps.png\","
echo "        \"hidden_by_default\": false,"

#programm array start
echo "        \"programs\": ["
FIRST_P=0
for A in $DIFF;do
	 if test $FIRST_P = 0;then
	     FIRST_P=1
	 else
	     echo ","
	 fi	
         echo -n "          \"$A\""
done
echo 
echo "        ]"
# programm array ende
echo "     }"
echo "  }"
# categories ende

echo "}"
#alles ende
