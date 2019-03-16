#!/bin/sh

echo "Tearing down app"

docker rm -f nginx-load-balance
docker rm -f refinitiv1
docker rm -f refinitiv2