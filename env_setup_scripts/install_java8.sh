#!/bin/sh
#########################################################
# Script Name : install_java8.sh
# Version     : 1.0
# Author      : Priyanka Samanta
# Date        : 11th May 2017
#########################################################

#--------------------------------------
# Install java 8
#--------------------------------------

sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer 
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export JRE_HOME=/usr/lib/jvm/java-8-oracle/
