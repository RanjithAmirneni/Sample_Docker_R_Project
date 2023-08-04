
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
