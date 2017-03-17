#/bin/bash

ACTIVEDOCKER=""
DOCKERHASH=""

docker ps -a > temp.txt

if grep -q web1 temp.txt
then
  ACTIVEDOCKER="web1"
  DOCKERHASH='cat temp.txt | awk '/web1/ {print $1}''
else
  ACTIVEDOCKER="web2"
  DOCKERHASH='cat temp.txt | awk '/web2/ {print $1}''


fi




echo $ACTIVEDOCKER
echo $DOCKERHASH
