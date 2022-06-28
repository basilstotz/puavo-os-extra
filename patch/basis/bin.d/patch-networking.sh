#!/bin/sh

FILE="/etc/network/if-up.d/disable_flow_control"
test -f $FILE && rm -f $FILE

exit 0


