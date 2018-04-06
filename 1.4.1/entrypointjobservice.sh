#!/bin/bash

ENV_FILE="/etc/jobservice/env"
if [ -f ${ENV_FILE} ]; then
    export $(cat $ENV_FILE | xargs)
fi  

cp /data/secretkey /etc/jobservice/key

/harbor/harbor_jobservice