#!/bin/sh

#########################################################
# Script Name : testrun.sh
# Version     : 1.0
# Author      : Priyanka Samanta
# Date        : 11th May 2017
#########################################################


echo""
echo " >>>> Installing Curl <<<<"
echo""
sudo apt-get install curl

echo""
echo""
echo " >>>> RUNNING TEST NOW <<<< "
echo""

echo ""
echo "############################"
echo " API1 : Test API Connection "
echo "############################"
echo ""

echo "Command -> curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/testConnection'"
echo "Result  -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/testConnection' 2>>/dev/null`"

echo ""
echo "###############################################"
echo " API2 : Returns Random Word from List of Words"
echo "###############################################"
echo ""

echo "Command -> curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/getRandomWord/{words}?words=<Words space seperated>'"

echo ""
echo "Test1 : Pass only one words : Argument -> 'Word'"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/getRandomWord/{words}?words=Word' 2>>/dev/null`"
echo ""

echo ""
echo "Test2 : Pass multiple words : Argument -> 'Word1 Word2 Word3 Word4 Word5 Word6 Word7'"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/getRandomWord/{words}?words=Word1%20Word2%20Word3%20Word4%20Word5%20Word6%20Word7' 2>>/dev/null`"
echo ""

echo ""
echo "Test3 : Pass same words again : Argument -> 'Word1 Word2 Word3 Word4 Word5 Word6 Word7'"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/getRandomWord/{words}?words=Word1%20Word2%20Word3%20Word4%20Word5%20Word6%20Word7' 2>>/dev/null`"

echo ""
echo "############################################"
echo " API3 : Returns Rhyming Words from CMU Dict"
echo "############################################"
echo ""
echo "Command -> curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/getRhymingWords/<word>'"

echo ""
echo ">> Test1 : Valid English Word1 -> 'love'"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/getRhymingWords/love' 2>>/dev/null`"

echo ""
echo "Test2 : Valid English Word2 -> 'address'"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/getRhymingWords/address' 2>>/dev/null`"

echo ""
echo "Test3 : Invalid English Word -> 'abcd'"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/getRhymingWords/abcd' 2>>/dev/null`"

echo ""
echo ">> Test4 : Invalid English Word -> '1234'"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/getRhymingWords/1234' 2>>/dev/null`"

echo ""
echo "#############################################"
echo " API4 : Returns if Driving at Rackless Speed"
echo "#############################################"
echo ""
echo "Command -> curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/isReckless/<speed>'"

echo ""
echo "Test1 : Reckless Speed1 -> 100"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/isReckless/100' 2>>/dev/null`"

echo ""
echo "Test2 : Rackless Speed2 -> 90.5"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/isReckless/90.5' 2>>/dev/null`"

echo ""
echo "Test3 : Not Reckless Speed -> 40"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/isReckless/40' 2>>/dev/null`"

echo ""
echo "Test4 : Invalid Speed -> abc"
echo "Result -> `curl -X GET --header 'Accept: text/plain' 'http://localhost:8080/ApiChallenge/restAPIs/isReckless/abcd' 2>>/dev/null`"
echo ""
