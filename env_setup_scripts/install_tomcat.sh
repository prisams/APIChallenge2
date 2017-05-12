#!/bin/sh
#########################################################
# Script Name : install_tomcat.sh
# Version     : 1.0
# Author      : Priyanka Samanta
# Date        : 11th May 2017
#########################################################

#--------------------------------------
# Install tomcat8 
#--------------------------------------

wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.0.43/bin/apache-tomcat-8.0.43.tar.gz
tar -xvzf apache-tomcat-8.0.43.tar.gz
rm -rf apache-tomcat-8.0.43.tar.gz
mv apache-tomcat-8.0.43 tomcat
chmod -R 755 tomcat/*
tomcat/bin/startup.sh

echo "Tomcat 8 installed successfully. Hit the url http://localhost:8080 to confirm"
