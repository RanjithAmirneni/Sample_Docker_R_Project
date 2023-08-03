# Use the official R base image
FROM r-base:latest

# create an R user with name as rstudio
ENV USER ranjith

#set the working directory
WORKDIR /home/$USER
## Install extra R packages using requirements.R
## Specify requirements as R install commands e.g.
## 
## install.packages("<myfavouritepacakge>") or
## devtools::install("<package_name>")

## Copy requirements.R to container directory /tmp
COPY ./Config/requirements.R /tmp/requirements.R 
## install required libs on container
RUN Rscript /tmp/requirements.R

## Copy your working folders along with files over to container directory /home/USER/Scripts
## The $USER defaults to `rstudio` but you can change this at runtime
COPY ./Scripts /home/$USER/Scripts
COPY ./Data /home/$USER/Data

CMD ["Rscript", "Scripts/main.R"]