# Use the official Node.js image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the application code to the container
COPY . .

# Expose the port that the Node.js application listens on
EXPOSE 3000

# Command to start the Node.js application
CMD [ "node", "app.js" ]
