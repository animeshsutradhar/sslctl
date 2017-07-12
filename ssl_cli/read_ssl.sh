#!/bin/bash
##############################################################
#  Script     : SSL
#  Author     : Animesh Sutradhar
#  Date       : 20/03/2017
#  Last Edited: 02/04/2017, Animesh Sutradhar
#  Description: To read SSL certificate details
##############################################################
# Purpose:
#
#
#
# Requirements:
#
#
#
#
#
#
# Method:
#
#
# Syntax:
#
#
# Notes:
#
##############################################################

######################################
####   Opening Initializations    ####
######################################
gracedays=1209600
path="/etc/httpd/ssl"
cat /dev/null > /apps/scripts/ssl_cli/data/ssl_data.txt
find "$path" -maxdepth 1 -type f -name "*.crt" -print0 | while read -d $'\0' file; do
    a="$path/$(basename $file)"
    x="$(basename $file)"

echo "##############################################################################################" >> /apps/scripts/ssl_cli/data/ssl_data.txt
echo "==============================================================================================" >> /apps/scripts/ssl_cli/data/ssl_data.txt
echo "Data for: "$x >> /apps/scripts/ssl_cli/data/ssl_data.txt
date >> /apps/scripts/ssl_cli/data/ssl_data.txt
echo "==============================================================================================" >> /apps/scripts/ssl_cli/data/ssl_data.txt
for cert in $a;
do
    data=`echo | openssl x509 -noout -dates -in $a | grep notAfter | sed -e 's#notAfter=##'`

    ssldate=$(date -d "${data}" '+%s')
    nowdate=$(date '+%s')
    
    diffr="$((ssldate - nowdate))"

    if [ $diffr -gt $gracedays ]
    then
        if [ $diffr -lt 0 ]
        then
            echo "The certificate $x has already expired." >> /apps/scripts/ssl_cli/data/ssl_data.txt
        else
           
            echo "The certificate $x will expire in $((${diffr}/3600/24)) days." >> /apps/scripts/ssl_cli/data/ssl_data.txt
        fi
    fi
done
echo "==============================================================================================" >> /apps/scripts/ssl_cli/data/ssl_data.txt
echo "##############################################################################################" >> /apps/scripts/ssl_cli/data/ssl_data.txt
done
echo "" >> /apps/scripts/ssl_cli/rsynch.log
echo "" >> /apps/scripts/ssl_cli/rsynch.log
date >> /apps/scripts/ssl_cli/rsynch.log
rsync -avz /apps/scripts/ssl_cli/data/ root@192.168.204.130:/apps/scripts/ssl/data/<HOST NAME> >> /apps/scripts/ssl_cli/rsynch.log
echo "==============================================================================================" >> /apps/scripts/ssl_cli/rsynch.log

