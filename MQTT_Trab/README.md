#Emulação de dispositivos MQTT

Códigos contendo análise do MQTT

##Conteúdo:

- `payload_test.sh` Aumenta gradativamente um caractere da mensagem enviada a cara iteração
- `publisher_test.sh` Recebe do usuário o numero de frequência de publicações e a cada iteração o número de instâncias deste programa aumenta.
- `publish_subs_test.sh` Recebe do usuário o numero de frequência de publicações e a cada iteração o número de instâncias deste programa aumenta, além de publicar em mais de um subscribe.
- `LogaProcessamentoPS.sh` Captura o uso de CPU e memória


##Uso

1. Instalar  Mosquitto e o gnuplot
```
sudo apt-get install mosquitto mosquitto-clients
sudo apt-get install gnuplot
```

2. O broker vai ser inicializado por padrão.  Para ver os logs é necessário
pará-lo e reinicializá-lo.

```
sudo /etc/init.d/mosquitto stop
sudo mosquitto –v
```

4. Abra um terminal e subscreva à este tópico.

```
mosquitto_sub -t "#" -v
```

5. Em um novo terminal execute o LogaProcessamento.sh

6. Abra outro terminal e execute:

  6.1. Para testes com bash:

    Para o test 1 params: -p):
    ```
    /bin/bash publisher_test.sh
    ```

    Para o test 2 (params: -p|h):
    ```
    /bin/bash publisher_test.sh -p <NUM_FREQ>
    ```

    Para o test 3:
    ```
    /bin/bash publish_subs_test.sh -p <NUM_FREQ>
    ```

  6.2. Para testes com python:

    Para o test 2:
    ```
    /bin/bash publisher_using_python.sh
    ```

    Para o test 3:
    ```
    /bin/bash publish_subs_using_python.sh
    ```

7. Ao final, será gerado N um mem-graph.png com o uso de CPU e memória.
