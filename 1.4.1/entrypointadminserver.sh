#!/bin/bash

ENV_FILE="/config-adminserver/env"
if [ -f ${ENV_FILE} ]; then
    export $(cat $ENV_FILE | xargs)
fi  

cp /data/secretkey /etc/adminserver/key

/harbor/harbor_adminserver