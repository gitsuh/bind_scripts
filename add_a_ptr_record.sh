#!/bin/bash
if [[ $# -eq 0 ]] ; then
        echo 'Must provide arguments.'
        echo './add_a_ptr_record.sh <forwardzonefile> <reversezonefile> <ipaddress> <FQDN>'
        echo './add_a_ptr_record.sh /etc/named/db.my.domain /etc/named/db.192.168.1 192.168.1.200 myserver.my.domain'
        exit 1
fi
reversezonefile=$1
forwardzonefile=$2
ip=$3
fqdn=$4
echo `echo $ip | cut -d"." -f4`"        IN      PTR     $fqdn." >> $reversezonefile
echo "$fqdn.    IN      A       $ip" >> $forwardzonefile
