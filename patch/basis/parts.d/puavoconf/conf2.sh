#!/bin/sh

test -n "$1" || exit 1

ROOT="/images/puavo-pkg/root/packages/$1"
#echo $ROOT

if test -d $ROOT; then
    #echo 1
    PACK=$(ls $ROOT | head -n1)
    if test -n "$PACK"; then
	#echo $ROOT/$PACK/upstream
	if test -d $ROOT/$PACK/upstream; then
	    #echo 3
	    tree $ROOT/$PACK/upstream
	fi
    fi
fi




