#########################################################
# Script Name : install_project.sh
# Version     : 1.0
# Author      : Priyanka Samanta
# Date        : 11th May 2017
# Prereq      : Run the script from the directory
#                where the project needs to be set up 
#                and which has the tomcat folder
#########################################################

#--------------------------------------
# clone project from GitHub
#--------------------------------------

git clone https://github.com/prisams/APIChallenge ApiChallenge

#--------------------------------------
# Move the swagger folder from Project to 
# the tomcat/webapps folder
#--------------------------------------

mv ApiChallenge/swagger tomcat/webapps

cd ApiChallenge

#--------------------------------------
# run maven to build project
#--------------------------------------

mvn clean
mvn install

#--------------------------------------
# Copy the war file to tomcat/webapps
#--------------------------------------

cd ..
mv ApiChallenge/target/ApiChallenge.war tomcat/webapps

#--------------------------------------
# Restart the tomcat server
#--------------------------------------
./tomcat/bin/shutdown.sh
./tomcat/bin/startup.sh