# devopsonyx
# Introduction to DevOps Engineer's Journey
Hello, everyone! 👋

I'm Augustine Ubong, a passionate DevOps engineer, and I'm excited to share my journey and projects related to the world of DevOps. Over the past year, I've been diving into various DevOps concepts and tools, and I'd like to showcase some of the projects I've been working on.

# Project 1: Developing with Docker
For my first project, I wanted to demonstrate how to develop a Node.js application using Docker containers with MongoDB and Mongo Express. Below is the directory structure of the project:

## Project Structure
demo-docker-nodejs-mongodb/
├── app.js
├── Dockerfile
├── package.json
├── package-lock.json
├── README.md
└── scripts/
    └── setup.sh

Let's break down the contents of each file and folder:

- app.js: This file contains the Node.js application code. It includes the configuration to connect to the MongoDB database as shown in the code snippet in the README.

- Dockerfile: The Dockerfile is used to define the instructions for building the Docker image of the Node.js application. It specifies the base image, sets up the working directory, installs dependencies, and copies the application code into the container.

- package.json and package-lock.json: These files are used to manage Node.js dependencies. The package.json contains the list of required packages and other metadata, while package-lock.json ensures deterministic package installations.

- README.md: It provides instructions and information about the project.

- scripts/: This folder contains any scripts required for setting up or managing the project. In this case, the setup.sh script may be used to automate some setup tasks.

## Prerequisites
Before running the demo project, make sure you have the following installed:

Docker: Install Docker
Git: Install Git

## Getting Started

1. Clone this repository to your local machine:
   git clone https://github.com/yourusername/demo-docker-nodejs-mongodb.git
   cd demo-docker-nodejs-mongodb

2. Pull Docker Images
   Make sure you have Docker installed and running on your machine. Pull the required Docker images from Docker Hub:
      docker pull mongo:latest
      docker pull mongo-express:latest

3. Create Docker Network
   To ensure communication between the MongoDB and Mongo Express containers, create a Docker network:
      docker network create mongo-network
   
5. Start MongoDB Container
   Start the MongoDB container with the necessary parameters and attach it to the `mongo-network`:
       docker run -d \
      --name mongo-db \
      --network mongo-network \
      -e MONGO_INITDB_ROOT_USERNAME=admin \
      -e MONGO_INITDB_ROOT_PASSWORD=adminpassword \
      -p 27017:27017 \
      mongo:latest
   
7. Start Mongo Express Container
      Start the Mongo Express container with the necessary parameters and attach it to the `mongo-network`:
       docker run -d \
      --name mongo-express \
      --network mongo-network \
      -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
      -e ME_CONFIG_MONGODB_ADMINPASSWORD=adminpassword \
      -e ME_CONFIG_MONGODB_SERVER=mongo-db \
      -p 8081:8081 \
      mongo-express:latest
   
9. Access Mongo Express UI
      Visit http://localhost:8081 in your web browser to access the Mongo Express UI. Use the provided credentials to log in and create a new database.

10. Configure Node.js Application
      In your Node.js application code, configure the database connection to use the MongoDB instance running in the Docker container. Provide the appropriate connection string, username, and password based on the MongoDB container configuration.
         const mongoose = require('mongoose');
      
      const mongoDBURI = 'mongodb://admin:adminpassword@localhost:27017/your-database-name';
      
      mongoose.connect(mongoDBURI, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
      })
        .then(() => console.log('Connected to MongoDB'))
        .catch((err) => console.error('MongoDB connection error:', err));

## Contributions

Contributions to this project are welcome! If you encounter any issues or have suggestions for improvements, please feel free to submit a pull request.

## Contact

If you have any questions or need assistance with this project, feel free to reach out to me:

- Email: ubongclouds@gmail.com
- LinkedIn: https://www.linkedin.com/in/augustine-devops/

Happy DevOps-ing! 😄

