#!/bin/bash
##############################################################
#  Script     : SSL
#  Author     : Animesh Sutradhar
#  Date       : 20/03/2017
#  Last Edited: 02/04/2017, Animesh Sutradhar
#  Description: Select your choise
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

echo  "Please select below options:"
echo  "   1) For Read data"
echo  "   2) For CSR Request"
echo  "   q) For Exit"
echo  -n ": "
read yno
case $yno in

        [1] | [1] )
                echo "Agreed"
		./get_ssl_data.sh
                ;;

        [2] | [2] )
                echo "Not agreed, you can't proceed the installation";
		./request_csr.sh
		./get_ssl_data.sh

                ;;
        q) echo "Bye!"
            ;;
esac
