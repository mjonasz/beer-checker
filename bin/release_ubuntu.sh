#!/bin/sh -vx
sudo systemctl start docker
docker-compose build
docker-compose up
docker-compose down
sudo chown -R $USER:$USER _build