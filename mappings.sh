#!/bin/bash

server_name="$1"

echo "server {"
echo "  server_name $server_name;"

./mappings.pl $server_name | sort

echo "}"
