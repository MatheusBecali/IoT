#!/bin/bash

#####################
# Publisher e Subscriber Tests
# Internet das coisas - IoT - PPGI
# Alunos: Matheus Becali Rocha & Juan Xabier Esteban de Aqutino Calles
#####################

numPublishers=100;
simTime=1; # customize it
host="localhost";
topics=();
t_default='topic/subscribe_';
msg="Publi_";
runs=80;

############################################################
# Help                                                     #
############################################################

Help()
{
   # Display Help
   echo "to Execute in terminal, type:"
   echo
   echo "/bin/bash/ publish_subs_test.sh -p <NUM_FREQ>"
   echo
   echo "Syntax: scriptTemplate [-p|h]"
   echo "options:"
   echo "p     set the frequence of publisher."
   echo "h     Print this Help."
   echo
}

############################################################
# Process the input options. Add options as needed.        #
############################################################

while getopts ":hp:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      p) # Enter a number
         freqPublishers=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

for j in $(seq 1 $runs);
 do
  #topics[$j]=$t_default$j
  #mosquitto_pub -h $host -t test/visualize -m ${topics[$j]}
  #mosquitto_sub -h $host -t ${topic[$j]}
  for i in $(seq 1 $numPublishers);
   do
    topics[$i]=$t_default$i
    mosquitto_pub -h $host -t ${topics[$i]} -m $msg$j
   done
  topics[$j]=$t_default$j
  # numPublishers=$(($numPublishers+$freqPublishers))
  numPublishers=$(( numPublishers + freqPublishers ))
done

sleep "$simTime"

# pubs.sh: 15: mosquitto_pub: Argument list too long
# 131071 bytes recived PUBLISH
