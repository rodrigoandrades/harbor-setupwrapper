#!/bin/bash

ENV_FILE="/config-db/env"
if [ -f ${ENV_FILE} ]; then
    export $(cat $ENV_FILE | xargs)
fi  

/docker-entrypoint.sh mysqld