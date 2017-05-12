# APIChallenge

This maven project demonstrates the skill to implement REST APIs and work with Python. This project includes the following:

* Implementation of REST APIs.
* Python script to work with CMU dictionary to return the rhyming words of the given word.
* Python script to develop a classification data model for determining the reckless speed of driving based on a DataSet.
* Further the project has been integrated with Swagger to access the API docs.

## Contents
1. env_setup_scripts : Contains the scripts to install the required softwares to run this project
2. swagger : contains files to configure Swagger UI
3. settings.properties : the required setting needed by the project in its environment. Save it at the user home.
4. Python_Scripts : Contains 3 files:
    - pronounce.py : uses 3rd party pronouncing module to get the rhyming words from CMU dictionary
    - classification.py : uses Data.csv to design a classification algorithm coded by me based on OTSU method and determine the threshold for reckless driving.
    - Data.csv : Contains 2 attributes (Speed and isReckless : 0 means no and 1 means yes). Using this dataset and the above algorithm a threshold has been calculated. And whenever the API isReckless is hit with an input speed, the data model computes the threshold and determines if the speed belongs to the category of reckless driving or safe driving. (There are plots also in the algorithm. They may uncommented and run to get a graphical view)

## Getting started
```
1. Create a working directory (say Priyanka_Code)
2. Clone the project from git in the working directory.
    * git clone https://github.com/prisams/APIChallenge ApiChallenge 
    Note : if git is not installed run sudo apt-get install git Or
    You may also download the zip folder and unzip it in the working directory.
3. chmod -R 755 ApiChallenge/*
```
## Prerequisites 

Below are the required softwares:
1. Java8
2. Apache Tomcat 8
3. Python 2.7 or higher
4. Pip
5. pronouncing model to work with CMU dictionary
6. Maven
        
### Installing the softwares on Ubuntu 16.04

To install using scripts: please run the scripts from the working directory <Priyanka_Code>
```
1. To install Java8 use the script : env_setup_scripts/install_java8.sh or perform the below in terminal
   *To set up the JAVA environment run this script as . install_java8.sh
    
    sudo apt-add-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer 
    JAVA_HOME="/usr/lib/jvm/java-8-oracle/"
    JRE_HOME="/usr/lib/jvm/java-8-oracle/"
    source /etc/environment

2. To install Apache Tomcat 8 use the script : env_setup_scripts/install_tomcat.sh or perform the below in terminal

    wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.0.43/bin/apache-tomcat-8.0.43.tar.gz
    tar -xvzf apache-tomcat-8.0.43.tar.gz
    rm -rf apache-tomcat-8.0.43.tar.gz
    mv apache-tomcat-8.0.43 tomcat
    chmod -R 755 tomcat/*
    ./tomcat/bin/starup.sh
    
    Start the tomcat service by going to tomcat/bin/startup.sh 
    and the Apache Tomcat welcome page should be available at http://localhost:8080

3. Default python2.7 is present in Ubuntu at /usr/bin/python

4. To installl pip and pronouncing module run the script : env_setup_scripts/install_pip.sh or perform the below in the terminal
    
    sudo apt-get install python-pip
    pip install pronouncing    (Note: pronouncing gets installed under the default python in the environment)

6. To install maven run the script env_setup_scripts/install_maven.sh or perform the following in the terminal
    
    sudo apt-get install maven 
```

## Setting up the project environment
1. Move the ApiChallenge/settings.properties to user home and update the file with the following details:
    * Python exe path
    * The location of the python script pronounce.py as found under ApiChallenge/Python_Scripts
    * The location of the python script classification.py as found under ApiChallenge/Python_Scripts
    * The location of the Data file as found under ApiChallenge/Python_Scripts

## Deploying the project
To deploy the project run the script env_setup_scripts/install_project.sh in the working directory <Priyanka_Code> or perform the below steps in terminal
 
* Move the swagger folder from the project to the tomcat/webapps folder
* Run "mvn clean" and "mvn install" going in the project folder
* Move the .war file created under Project<ApiChallenge>/target folder to /tomcat/webapps
* Restart the tomcat server by running the scripts: tomcat/bin/shutdown.sh and /tomcat/bin/startup.sh
All the above steps have been put together in the script named install_project.sh

## To access the API DOCs
http://localhost:8080/swagger

## URLs to the APIs
* To test the connection: http://localhost:8080/ApiChallenge/restAPIs/testConnection
* To get a random word returned from a set of words given as input: http://localhost:8080/ApiChallenge/restAPIs/getRandomWord/words?words=word1%20word2
* To test the classification of data Model to check if the driving speed is reckless: http://localhost:8080/ApiChallenge/restAPIs/isReckless/23.87
* To get the rhyming words for the word given as input: http://localhost:8080/ApiChallenge/restAPIs/getRhymingWords/hello

## To perform automated tests on the Api
Run the script ApiChallenge/testrun.sh