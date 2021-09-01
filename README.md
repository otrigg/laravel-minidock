# Laravel minidock
Installs a **minimal docker environment** on Linux systems for already existing Laravel projects:
- php-fpm
- Xdebug
- Mailhog
- MySQL
- phpMyAdmin

## Prerequisites
- Docker installed

## Installation
1. ```clone``` this repository.
2. ```chmod 0777``` on the ```storage``` folder of your project - needed for the docker user to write data.
3. ```cd``` in your cloned repository folder.
4. ```cp .env.example .env```
5. insert the absolute path of your project in the ```.env``` file.
6. execute ```build.sh```
7. Visit ```http://localhost:8000```

## Usage
Launch the commands inside this repository in order to start/stop the containers or perform other actions.
- ```build.sh``` - builds and launch the containers
- ```up.sh``` - starts the containers (once built)
- ```down.sh``` - stops the containers
- ```remove.sh``` - stops the containers and removes named volumes
- ```shell.sh``` - opens a command shell inside the container (useful for launching ```artisan``` commands)

## License
MIT License