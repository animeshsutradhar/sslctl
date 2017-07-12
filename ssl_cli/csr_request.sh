#!/bin/bash
##############################################################
#  Script     : SSL
#  Author     : Animesh Sutradhar
#  Date       : 20/03/2017
#  Last Edited: 02/04/2017, Animesh Sutradhar
#  Description: To request SSL certificate
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

cd /etc/httpd/ssl
echo -e "Enter your virtual host FQDN: "
read cert
cp -p $cert.csr /apps/scripts/ssl_cli/data/backup/$cert.csr_`date +"%d-%m-%Y"`
openssl x509 -req -days 365 -in $cert.csr -signkey $cert.key -out $cert.crt
rsync -avz $cert.crt /apps/scripts/ssl_cli/data/ >> /apps/scripts/ssl_cli/rsynch.log
echo "" >> /apps/scripts/ssl_cli/rsynch.log
echo "" >> /apps/scripts/ssl_cli/rsynch.log
date >> /apps/scripts/ssl_cli/rsynch.log
rsync -avz /apps/scripts/ssl_cli/data/ root@192.168.204.130:/apps/scripts/ssl/data/<HOST NAME> >> /apps/scripts/ssl_cli/rsynch.log 2> /apps/scripts/ssl_cli/error.log
echo "==============================================================================================" >> /apps/scripts/ssl_cli/rsynch.log
echo "Done"
