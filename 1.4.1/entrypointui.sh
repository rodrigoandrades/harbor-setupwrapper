#!/bin/bash

ENV_FILE="/etc/ui/env"
if [ -f ${ENV_FILE} ]; then
    export $(cat $ENV_FILE | xargs)
fi  

cp /data/secretkey /etc/ui/key
cp -R /data/ca_download /etc/ui/ca

/harbor/harbor_ui 
