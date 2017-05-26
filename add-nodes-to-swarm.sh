#!/bin/bash

SLAVE_NODE_IPS='LIST OF NODE IPS'

# Install Parallel SSH
sudo apt-get install -y pdsh

# Set up an alias for easier execution of parallel tasks
echo "alias parallel_do='pdsh -w - -R exec ssh -i .ssh/id_rsa.pem -o StrictHostKeyChecking=no %h'" >> ~/.bash_aliases
source ~/.bash_aliases

echo $SLAVE_NODE_IPS | parallel_do 'PASTE JOIN COMMAND'
