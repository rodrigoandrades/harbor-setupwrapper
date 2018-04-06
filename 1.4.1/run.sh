#!/bin/bash
set +e

#sudo docker rm -f $(docker ps -aq)
sudo docker volume prune -f
sudo docker build -t randrades/harbor-setupwrapper:1.4.0 .
#sudo docker-compose up