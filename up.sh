#!/bin/bash
export CURRENT_UID=$(id -u):$(id -g)
docker-compose up -d