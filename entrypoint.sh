#!/bin/bash

set -e

sed -i "s|{{EXCHANGE_URL}}|$EXCHANGE_URL|;s|{{EXCHANGE_URL}}|$EXCHANGE_URL|" /app/davmail.properties
cat /app/davmail.properties

exec "$@"
