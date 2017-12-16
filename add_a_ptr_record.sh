#!/bin/bash
if [[ $# -eq 0 ]] ; then
        echo 'Must provide arguments.'
        echo './add_a_ptr_record.sh <forwardzonefile> <reversezonefile> <ipaddress> <FQDN>'
        exit 1
fi
reversezonefile=$1
forwardzonefile=$2
ip=$3
fqdn=$4
echo `echo $ip | cut -d"." -f4`"        IN      PTR     $fqdn." >> $reversezonefile
echo "$fqdn.    IN      A       $ip" >> $forwardzonefile
