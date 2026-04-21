#!/bin/bash

scp code-samples/DO dan@192.168.100.11:/home/dan/

ssh dan@192.168.100.11 "
    sudo mv /home/dan/DO /usr/local/bin/ &&
    sudo chmod +x /usr/local/bin/DO &&
    sudo chown root:root /usr/local/bin/DO
"