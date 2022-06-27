#!/bin/bash

#####################
# Publisher Tests
# Internet das coisas - IoT - PPGI
# Alunos: Matheus Becali Rocha & Juan Xabier Esteban de Aqutino Calles
#####################

simTime=1; # customize it
host="localhost";
topic="teste/pubs";
attr="temp_";
msgTime=50;
payloadSize=1000;
numPublishers=1000;

for i in $(seq 1 $numPublishers);
do
    nohup python3 publisher_2e3.py "$host" $topic "$attr$i" "$msgTime" "$payloadSize" > pubs/pub_$i.log  &
    sleep "$simTime"
    i=$((i+1))
done
killall python3
