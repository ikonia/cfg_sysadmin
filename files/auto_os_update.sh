#!/bin/bash
# ------------------------------------------------------------------
# [Matthew Darcy] 
#          Title: auto_os_update
#          Description: shell script to auto update distro packages via cron
# ------------------------------------------------------------------
#
# Initial idea was to have multiple scripts per OS and let puppet facter os:family determain which script to use
# more basic idea, have one script that executes yum/dnf/apt based on OS params within script
# worst case rewrite this into functions and swap to case driven statements

USAGE="Usage: no arguments, sequential execution"

if [ $# != 0 ] ; then
    echo $USAGE
    exit 1;
fi

#
# work out the OS first
#
# still depend on facter which is heavy for this task, but easy way to work out OS family, remove facter dependency 
# when you work out a better lighter way.
#
if [ -f `which facter` ]; then
   FACTER=true	
else
   FACTER=false
   echo "cannot continue with auto_os_update cannot continue continue as facter is missing"
   logger "$0 was unable to execute at `date` due to missing facter binary"
   exit
fi

# now we know facter is there, lets trap the OS family and version
#
OS_FAM=`facter os.family | tr '[:upper:]' '[:lower:]'`
OS_VER=`facter os.major`

#do the updates
if [ "$OS_FAM" = "redhat" ] ; then
	logger "$0 started update process at `date`"
	dnf clean all
	dnf update -y
	dnf autoremove -y
	sync
	logger "$0 completed update process at `date`"
fi

if [ "$OS_FAM" = "debian" ]; then
	 logger "$0 started update process at `date`"
	 apt clean all
	 apt update -y 
	 sync
	 logger "$0 completed update process at `date`"
fi


# work out if we need to reboot
#
if [ "$OS_FAM" = "redhat" ] ; then
	needs-restarting
	if [ $? == '1' ] ; then
	        logger "$0 logging restart needed"
		sync
		shutdown -r 03:30
	fi
fi

if [ "$OS_FAM" = "debian" ]; then
	if [ -f /var/run/reboot-required ]; then
	        logger "$0 logging restart needed"
		sync
		shutdown -r 03:30
        fi	
fi
