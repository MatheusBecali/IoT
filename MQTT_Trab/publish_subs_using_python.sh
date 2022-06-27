#!/bin/bash

#####################
# Publisher e Subscriber Tests
# Internet das coisas - IoT - PPGI
# Alunos: Matheus Becali Rocha & Juan Xabier Esteban de Aqutino Calles
#####################

simTime=1; # customize it
host="localhost";
topic="teste/subs";
attr="temp";
msgTime=50;
payloadSize=1000;
numPublishers=1000;

nohup python3 publisher_2e3.py "$host" "$topic" "$attr" "$msgTime" "$payloadSize" > subs/pub_sub.log  &

for i in $(seq 1 $numPublishers);
do
    nohup mosquitto_sub -h $host -t $topic > subs/sub_$i.log  &
    sleep "$simTime"
    i=$((i+1))
done
killall python3
