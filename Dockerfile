#From means the base image that we want to use for our Docker image. In this case, we are using the official Ubuntu image with the tag 24.04. This means that our Docker image will be built on top of the Ubuntu 24.04 base image, which provides a minimal Linux environment for our application to run in.
FROM ubuntu:24.04

#Now we need to install Node.js and npm in our Docker image. We can do this by running the following commands in our Dockerfile. The apt-get update command updates the package lists for the apt package manager, and the apt-get install -y nodejs npm command installs Node.js and npm without prompting for confirmation (the -y flag automatically answers "yes" to any prompts). This will allow us to run our Node.js application inside the Docker container.
RUN apt-get update && \
    apt-get install -y nodejs npm

#we create and set working directory for our application. The WORKDIR instruction sets the working directory for any subsequent instructions in the Dockerfile. In this case, we are setting the working directory to /app. This means that any commands we run after this instruction will be executed in the /app directory inside the Docker container. This is where we will copy our application files and run our Node.js application.
WORKDIR /app

# COPY everything from your project to /app
COPY . .



CMD ["node", "app.js"]