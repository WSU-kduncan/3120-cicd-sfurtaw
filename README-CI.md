# CI/CD Readme Samuel Furtaw

## Project Overview

In this project I am walking through the setup and deployment of a containerized instance of nginx to demonstrate the use of Continuous Integration tools in a development/release stack. To containerize the image, we are using Docker, which is cross-platform. We will also be using DockerHub to make the image available in combination with GitHub Actions.

## Run the project locally

1. Enable WSL by running `wsl --install` (version 2 is enabled by default)
2. Install Docker Desktop for Windows from <https://www.docker.com/products/docker-desktop/>
3. Change to the project directory
4. Run `docker build -t <Docker Hub username>/website-docker .` to build the base image
5. Spin up an instance by running `docker run --name website-instance -d -p 10000:80 <Docker Hub username>/website-docker` (port 10000 is allowed to be bound by non-admins on Windows/Unix)
6. Visit <http://127.0.0.1:10000> in your web browser

## Create project repo in Docker Hub

1. Log into Docker Hub
2. Click 'Create repository'
3. Name the repository and click 'Create'

Make sure the name matches your local image name

## CLI Docker Hub Authentication

1. Create a PAT (personal access token) by visiting Account Settings > Security and clicking 'New Access Token'
2. Name the token and copy the value
3. Run `docker login -u <username>`
4. Paste the token

## CLI Push Image

Run `docker image push <Docker Hub username>/website-docker`

## Configure GitHub Secrets

1. Generate another PAT from Docker Hub and copy it
2. Go to repository settings > secrets and variables > actions
3. Click 'New repository secret'
4. Name it `DOCKERHUB_TOKEN` and paste the token, then save
5. Click 'New repository secret' again
6. Name it `DOCKERHUB_USERNAME` and enter your Docker Hub username, then save

## GitHub Workflow

The GitHub workflow is configured to run whenever a GitHub release is published so it does not run on every main branch update. It can also be manually invoked from the Actions menu on GitHub since the `workflow-dispatch` directive was added. Otherwise, the workflow follows the standard Docker Hub template. Three other values need to be configured: the repository to target (the `images` directive) and the username/password secret names (`DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` respectively, in the `username` and `password` directives)
