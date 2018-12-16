# Specify a base image
FROM node:alpine

# Specify working directory in the container
WORKDIR /usr/app

# copy from current directory (./) to docker container (./)

# copy only package.json for dependencies, not all the files yet, because it will run everything below again for installation.
COPY ./package.json ./
# Install some dependencies
RUN npm install
# copy everything from current directory (./) to docker container (./)
COPY ./ ./

# Default command
CMD ["npm", "start"]