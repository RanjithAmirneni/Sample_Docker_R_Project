
# An R-docker sample project that reads a csv file and write back to project folder

#This in an example R project setup for deployment on a docker container, running and connecting a docker container that runs R. 

* Set up a Dockerfile
* Data folder contains sample CSV input file file
* Config folder consists of requirements.R file 
* We can mention the all our required packages and dependencies that can be installed during the build
* Written sample R code in Scripts folder main.R file
* This code will reads and writes a csv file and prints some testing messages
* Write the output back to a mounted data folder on the host
* Look at how to set up other connections that you might use often
* Build an image
* Run a container with Rstudio
* Connect to that container and check the project code.



name: App Build

on:
  push:
    branches:
      - main
    tags:
      - v*

  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - run: echo "LOWERCASE_REPO=$(echo ${{ github.event.repository.name }} | tr [A-Z] [a-z])" >> $GITHUB_ENV
    - name: Checkout
      uses: actions/checkout@v2.2.0
    - name: Build and push Docker images
      uses: docker/build-push-action@v1
      with:
        username: ${{ secrets.LIGHT_DOCKER_USER }}
        password: ${{ secrets.LIGHT_DOCKER_TOKEN }}
        tag_with_ref: true
        tag_with_sha:  true
        add_git_labels: true
        registry: ${{ secrets.LIGHT_DOCKER_REPOSITORY_URL }}
        repository: ${{ env.LOWERCASE_REPO }}



