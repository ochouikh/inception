# Inception

This project introduces you to building a small-scale infrastructure composed of multiple services, all orchestrated using Docker. It focuses on teaching you how to create, configure, and seamlessly connect various services while following industry best practices.

## Table of Contents
- [Installation](#installation)
- [Overview](#overview)
- [Important Restrictions](#important-estrictions)

## Installation

Clone the repository and run:

```bash
git clone https://github.com/ochouikh/inception
cd inception
```
You can edit on .env file, then run:

```bash
make
```
To remove all docker containers, images, networks and volumes, run:

```bash
make fclean
```

## Overview

For this project we need to setup a simple docker-compose network with the following containers:

- NGINX with TLSv1.2 or TLSv1.3.
- Wordpress + php-fpm (installed and configured).
- MariaDB.

With the following volumes:

- A volume that contains Wordpress database.
- A volume that contains Wordpress website files.

Each docker container must have his own `Dockerfile` and, of course, have to restart in case of crash

Here is an example diagram of the expected result:

![diagram](https://github.com/ochouikh/inception/blob/main/images/diagram.png)

I also do the bonus part of the project, that part requires us to setup 5 more containers:

- redis cache, for wordpress.
- FTP server pointing to the volume of the wordpress site.
- A static website (Some simple .html, .css).
- Adminer (a simple tool to manage mysql).
- A service of my choice, I choose `cadvisor`

## Important Restrictions

- Do not use pre-built Docker images (except for Alpine/Debian).
- Avoid commands that run infinite loops (e.g., `tail -f`, `bash`, `sleep infinity`, `while true`).
- Ensure that the containers restart in case of a crash.
