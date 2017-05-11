# APIChallenge

This project demonstrates the skill to implement REST APIs and work with Python. This project includes the following:

* Implementation of REST APIs.
* Python script to work with CMU dictionary to return the rhyming words of the given word.
* Python script to develop a classification data model for determining the reckless speed of driving based on a DataSet.
* Further the project has been integrated with Swagger to access the API docs.


## Getting started
* Create a working directory named for eg: Priyanka_Code
* Clone the project in the working directory<Priyanka_Code>from git. You may also download the zip folder and unzip it.
* Download the files from Python_Scripts from the Project and save it under any path for eg: path1

## Prerequisites 

Below are the required softwares
    1. Java8
    2. Apache Tomcat 8
    3. Python 2.7 or higher
    4. pronouncing model to work with CMU dictionary
    5. Git
    6. Maven
        
### Installing on Ubuntu
    ```
    1. To install Java8
        sudo apt-add-repository ppa:webupd8team/java
        sudo apt-get update
        sudo apt-get install oracle-java8-
        set JAVA_HOME to be Java8 
            JAVA_HOME=/usr/lib/jvm/java-8-oracle 
            source /etc/environment
    ```
    ``` 
    2. To install Apache Tomcat
       Go the working directory<Priyanka_Code> and run
        wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.0.43/bin/apache-tomcat-8.0.43.tar.gz
        tar -xvzf apache-tomcat-8.0.43.tar.gz
        rm -rf apache-tomcat-8.0.43.tar.gz
        mv apache-tomcat-8.0.43 tomcat
        chmod -R 755 tomcat/*
        
        Start the tomcat service by going to tomcat/bin/startup.sh and the Apache Tomcat welcome page coming on http://localhost:8080
    ```
    ```
    3. Default python2.7 is present in Ubuntu at /usr/bin/python
    ```
    ```
    4. pip install pronouncing 
    ```
    ```
    5. sudo apt-get install git 
    ```
    ```
    6. sudo apt-get install maven
    ```
    
##Setting up the project environment
Move the settings.properties file to the home/user path
Update the settings.properties file with the following details:
    * Python exe path
    * The location of the python script pronounce.py as saved at path1
    * The location of the python script classification.py as saved at path1
    * The location of the Data file as saved at path1

## Deploying the project
Follow the below steps to get the project up and running on your local environment
 
* Move the swagger folder from the project to the tomcat/webapps folder
* Run "mvn clean" and "mvn install" going in the project folder
* Move the .war file created under Project<ApiChallenge>/target folder to /tomcat/webapps
* Restart the tomcat server by running the scripts: tomcat/bin/shutdown.sh and /tomcat/bin/startup.sh
All the above steps have been put together in the script named install_project.sh

##To access the API DOC
http://localhost:8080/swagger

## URLs to the APIs
To test the connection: http://localhost:8080/ApiChallenge/restAPIs/testConnection
To get a random word returned from a set of words given as input: http://localhost:8080/ApiChallenge/restAPIs/getRandomWord/words?words=word1%20word2
To test the classification of data Model to check if the driving speed is reckless: http://localhost:8080/ApiChallenge/restAPIs/isReckless/23.87
To get the rhyming words for the word given as input: http://localhost:8080/ApiChallenge/restAPIs/getRhymingWords/hello
