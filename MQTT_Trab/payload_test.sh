#!/bin/bash

#####################
# Payload Tests
# Internet das coisas - IoT - PPGI
# Alunos: Matheus Becali Rocha & Juan Xabier Esteban de Aqutino Calles
#####################

numPublishers=1;
simTime=1; # customize it
host="localhost";
topic="test/payload";
msg="a";
attr="a";

############################################################
# Help                                                     #
############################################################

Help()
{
   # Display Help
   echo "to Execute in terminal, type:"
   echo
   echo "/bin/bash/ payload_test.sh"
   echo
   echo "Syntax: scriptTemplate [-h]"
   echo "options:"
   echo "h     Print this Help."
   echo
}

############################################################
# Process the input options. Add options as needed.        #
############################################################

while getopts ":h:" option; do
   case $option in
      h) # display Help
        Help
        exit;;
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

while true;
 do
  for i in $(seq 1 $numPublishers);
   do
      mosquitto_pub -h $host -t $topic -m $msg
      msg="$msg$attr"
   done
done

sleep "$simTime"

# pubs.sh: 15: mosquitto_pub: Argument list too long
# 131071 bytes recived PUBLISH
