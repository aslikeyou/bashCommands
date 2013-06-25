#!/bin/bash

function quit {
	echo $1
	exit
}

function check_var {
	if [ "$1" = "" ]
		then
			quit $2
	fi
}

hostname=$2
check_var $hostname "Please provide domain name."

# Take inputs host name and root directory
case "$1" in
    "add" )
		hosturl=$3
		if [ -z $3 ] 
			then
			hosturl="127.0.0.1" 
		fi
		echo "$hosturl       $hostname" >> /etc/hosts
         ;;
    "remove" )
		mv -f /etc/hosts /etc/hosts.bachostnamekup 
		cat "/etc/hosts.backup" | grep -v "$hostname" | tee "/etc/hosts" 	
        ;;   
    * )
	echo "Use 'add hostname [host]' to add new hostname"
   	echo "Use 'remove hostname' to remove hostname"
	;;
esac





