$SLAVE_NODE_IPS='10.0.0.206 10.0.0.13 10.0.0.224'

# Install Parallel SSH
sudo apt-get install -y pdsh

# Set up an alias for easier execution of parallel tasks
echo "alias parallel_do='pdsh -w - -R exec ssh -i .ssh/id_rsa.pem -o StrictHostKeyChecking=no %h'" >> ~/.bash_aliases
source ~/.bash_aliases

echo $SLAVE_NODE_IPS | parallel_do 'docker swarm join --token SWMTKN-1-62ncaue3329p4keevoa3ldyuim6usudqeqfl7d6fvyy4pgzyd5-6o6s61oxcfx756mqboraoh3zc 10.0.0.181:2377'