#!/bin/bash

echo "server {"
echo "  server_name $1"

mappings.pl | sort

echo "}"
