#!/bin/bash

#####################
# Publisher Tests
# Internet das coisas - IoT - PPGI
# Alunos: Matheus Becali Rocha & Juan Xabier Esteban de Aqutino Calles
#####################

numPublishers=1;
simTime=1; # customize it
host="localhost";
topic="test/publisher";
msgTime=100;
msg="Publi_";
runs=100;

############################################################
# Help                                                     #
############################################################

Help()
{
   # Display Help
   echo "to Execute in terminal, type:"
   echo
   echo "/bin/bash/ publish_test.sh -p <NUM_FREQ>"
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
  for i in $(seq 1 $numPublishers);
   do
    mosquitto_pub -h $host -t $topic -m $msg$j
    # sleep 0.1
   done
  # numPublishers=$(($numPublishers+$freqPublishers))
  numPublishers=$(( numPublishers + freqPublishers ))
done

sleep "$simTime"
