# CD Project Overview

In this project we're building a continuous deployment workflow that will publish releases of tagged builds from the GitHub repository.

Tools used:

* Git
* GitHub
* Docker
* DockerHub

## Generate a tag in Git/GitHub

Before making your commit:
`git tag -a <version> -m <tag description>`

Tags aren't included with a push by default - modify your push command:
`git push --tags`

## GitHub workflow

Whenever tags are pushed to upstream:

* Publish image to DockerHub versioned with tags and separate image for `latest`


