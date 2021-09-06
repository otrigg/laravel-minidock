#!/bin/bash
export CURRENT_UID=$(id -u):$(id -g)
docker-compose up --build --force-recreate -d