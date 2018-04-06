#!/bin/bash

echo "MYSQL ############################################"

ENV_FILE="/harbor/config/db/env"
if [ -f ${ENV_FILE} ]; then
    export $(cat $ENV_FILE | xargs)
fi  


echo "cat----------------inicio"
cat ${ENV_FILE}
echo "cat----------------fim"

/docker-entrypoint.sh mysqld