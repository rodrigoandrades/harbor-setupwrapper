#!/bin/bash
set -e

echo "### Starting Registry... ###"

cp /harbor/config/registry/* /etc/registry/

/entrypoint.sh /etc/registry/config.yml