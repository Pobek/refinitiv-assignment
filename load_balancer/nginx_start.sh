#!/bin/sh
echo "Starting nginx..."
docker run -d -p 8080:80 -v "$(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf" --name nginx-load-balance nginx