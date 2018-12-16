# How to make a project with a Docker
1. Create a project
2. Create Dockerfile
    ```
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
    ```

3. Build docker image
    ```
    docker build -t nfabacus/simple-web-with-docker .
    ```
    * -t is for tagging the image

4. Map port with container port
    ```
    docker run -p <port on localhost with incoming request>:<port inside the container> <image id>
    ```
    Example: </br>
    ```docker run -p 8080:8080 <image id>``` </br>