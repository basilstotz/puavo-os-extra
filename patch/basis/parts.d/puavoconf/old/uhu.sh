#!/bin/sh                                                                                                             
set -eu                                                                                                               
test -f /etc/puavo-conf/puavo-conf.extra || exit 0                                                                    
for pcl in $(cat /etc/puavo-conf/puavo-conf.extra); do                                                                
    name=$( echo "${pcl}" | cut -d= -f1 )                                                                             
    value=$( echo "${pcl}" | cut -s -d= -f2 )                                                                         
    puavo-conf --set-mode add "${name}"  "${value}" 2>/dev/null || true                                               
done                                                                                                                  
for pcl in $(/usr/local/sbin/puavoconf-extravars); do                                                                 
    name=$( echo "${pcl}" | cut -d= -f1 )                                                                             
    value=$( echo "${pcl}" | cut -s -d= -f2 )                                                                         
    puavo-conf --set-mode add "${name}"  "${value}" 2>/dev/null || true                                               
done                                                                                                                  
exit 0    
