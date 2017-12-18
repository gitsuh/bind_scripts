#!/bin/bash
#return unused ip address
#only supports <= /24 networks
#only supports single network in bind zone file
function findip () {
        startip="10"
        endip="254"
        iplist=($(cat $1 | awk '{ print $4 }' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'));
        numlist=$(seq $startip $endip)
        for j in ${numlist[@]}; do
                for i in ${iplist[@]};do
                myvar=$(echo ${i} | tr "." " " | awk '{ print $4}');
                if [ "$myvar" = "${j}" ]; then
                        found="1";
                        break;
                else
                        found="0";
                fi
                done;
        if [ "$found" = "0" ]; then
                myvar2=$(echo ${i} | cut -d"." -f1-3);
                echo $myvar2"."${j};
                break;
        fi;
        done;
}
echo $(findip)
