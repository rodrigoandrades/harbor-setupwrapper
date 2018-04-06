#!/bin/bash
set -e

echo "### Starting Log... ###"

cp /harbor/config/log/* /etc/logrotate.d/

/usr/local/bin/start.sh