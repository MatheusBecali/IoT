#!/usr/bin/python

#####################
# Internet das coisas - IoT - PPGI
# Alunos: Matheus Becali Rocha & Juan Xabier Esteban de Aqutino Calles
#####################

"""
Baseado em
https://hackmd.io/@ramonfontes/iot-dojot

Modificado para receber como parametro o tempo entre mensagens.
"""

import os
import random
import logging
import string

from time import sleep
from sys import argv

logging.basicConfig(level="INFO")

if len(argv) < 4:
    print("Args: broker_host topic attribute time_between_pubs_ms")
    print("Exemplo: localhost teste temperature 1000")
    exit(0)

i = 25
node = argv[1]
topic = argv[2]
attribute = argv[3]
intermsg = argv[4]
payloadsize = argv[5]

attr = '{\"%s\":' % (attribute)
character = '}'
sleep(1)
while True:
    data = ''.join(random.choice(string.ascii_lowercase) for _ in range(int(payloadsize)))
    i = data
    cmd = "mosquitto_pub -h {} -t {} -m \'{}{}{}\'"
    cmd = cmd.format(node, topic, attr, data, character)
    logging.info(cmd)
    os.system(cmd)
    sleep(int(intermsg)/1000)
