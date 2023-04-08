#!/bin/bash
docker pull sfurtaw/docker-website:latest
docker stop docker-website
docker rm docker-website
docker run --name docker-website -d -p 80:80 sfurtaw/docker-website:latest