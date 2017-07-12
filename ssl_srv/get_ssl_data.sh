#!/bin/bash
##############################################################
#  Script     : SSL
#  Author     : Animesh Sutradhar
#  Date       : 20/03/2017
#  Last Edited: 02/04/2017, Animesh Sutradhar
#  Description: To get SSL certificate data
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
HOSTS="host1 host2 host3"

SCRIPT="/apps/scripts/ssl_cli/read_ssl.sh"
for HOSTNAME in ${HOSTS} ; do
    ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done

rsync -avz /apps/scripts/ssl/data/ /var/www/html/ssl_data/ >> /apps/scripts/ssl/rsync.log
echo "Done"
echo "Please go to /apps/scripts/ssl/data/ this location to check all the nodes data."
2> /apps/scripts/ssl/error.log
