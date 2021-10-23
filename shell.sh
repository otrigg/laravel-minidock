#!/bin/bash
export CURRENT_UID=$(id -u):$(id -g)
export $(xargs <.env)
export MAIN_CONTAINER="${APP_NAME}_app"
docker exec -it $MAIN_CONTAINER /bin/sh