# CI/CD Readme Samuel Furtaw

## Project Overview

In this project I am walking through the setup and deployment of a containerized instance of nginx to demonstrate the use of Continuous Integration tools in a development/release stack. To containerize the image, we are using Docker, which is cross-platform. We will also be using DockerHub to make the image available in combination with GitHub Actions.

## Run the project locally

1. Enable WSL by running `wsl --install` (version 2 is enabled by default)
2. Install Docker Desktop for Windows from <https://www.docker.com/products/docker-desktop/>
3. Change to the project directory
4. Run `docker build -t website-docker .` to build the base image
5. Spin up an instance by running `docker run --name website-instance -d -p 10000:80 website-docker` (port 10000 is allowed to be bound by non-admins on Windows/Unix)
6. Visit <http://127.0.0.1:10000> in your web browser
