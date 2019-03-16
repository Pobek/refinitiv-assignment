#!/bin/sh

echo "---- Start Building Sequence ----"

echo "Getting the image"
docker build -t refinitiv-app:v1 ./application_host/

echo "Start nginx"
docker run -d -p 8080:80 -v "$(pwd)/load_balancer/nginx.conf:/etc/nginx/conf.d/default.conf" --name nginx-load-balance nginx

echo "Start refinitiv-app 1"
docker run -d --name refinitiv1 refinitiv-app:v1

echo "Start refinitiv-app 2"
docker run -d --name refinitiv2 refinitiv-app:v1

echo "---- End Building Sequence ----"

echo "---- Start Testing Sequence ----"

sleep 2
python3 tests/app.test.py -v

echo "---- End Testing Sequence ----"