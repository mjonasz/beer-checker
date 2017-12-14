#!/bin/sh
sudo systemctl start docker
docker-compose build
docker-compose up
docker-compose down
