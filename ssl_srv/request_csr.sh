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

USERNAME=root

echo -n "Please enter your Host name/IP Address : "
read yno
HOSTNAME=$yno
SCRIPT="/apps/scripts/ssl_cli/csr_request.sh"

ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"

#Enable below script if web interface is in use.
#rsync -avz /apps/scripts/ssl/data/ /var/www/html/ssl_data/ >> /apps/scripts/ssl/rsync.log
echo "Done"



