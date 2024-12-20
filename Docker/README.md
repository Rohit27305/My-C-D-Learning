# Docker

Docker is an open-source platform that automates the deployment, scaling, and management of applications using containerization. Containers allow developers to package applications with all their dependencies, ensuring consistency across multiple environments.

## Features

- **Portability**: Containers can run on any system that supports Docker, ensuring consistent environments across development, testing, and production.
- **Efficiency**: Containers share the host system's kernel, making them lightweight and fast to start compared to traditional virtual machines.
- **Isolation**: Each container runs in its own isolated environment, ensuring that applications do not interfere with each other.
- **Scalability**: Docker makes it easy to scale applications horizontally by adding more container instances.
- **Version Control**: Docker images can be versioned, allowing for easy rollbacks and updates.
- **Security**: Containers provide an additional layer of security by isolating applications from the host system and each other.
## What is a Dockerfile?

A Dockerfile is a text document that contains a series of instructions on how to build a Docker image. It automates the process of creating Docker images by specifying the base image, dependencies, configuration settings, and commands to run within the container. Docker reads the Dockerfile and executes the instructions in order to produce a final image that can be used to create containers.

### Example of a Dockerfile

```dockerfile
# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package list and install Apache
RUN apt-get update && apt-get install -y apache2

# Expose port 80 to allow external access
EXPOSE 80

# Start the Apache service
CMD ["apachectl", "-D", "FOREGROUND"]
```

## What is Image?
Image is a lightweight, standalone, and executable software package that includes everything needed to run a piece of software: the code, runtime, system tools, libraries, and settings. Essentially, an image is a snapshot of a container at a specific point in time.

## What is a Container?
A container is a lightweight, standalone, and executable software package that includes everything needed to run a piece of software, including the code, runtime, system tools, libraries, and settings. Containers are isolated from each other and the host system, ensuring that they run consistently regardless of the environment. A container is a running image.

### Key Benefits of Containers

- **Consistency**: Containers ensure that applications run the same, regardless of where they are deployed.
- **Resource Efficiency**: Containers are more resource-efficient than traditional virtual machines because they share the host system's kernel.
- **Rapid Deployment**: Containers can be quickly started or stopped, enabling rapid deployment and scaling of applications.
- **Isolation**: Containers provide process and filesystem isolation, enhancing security and stability.

### Example of Running a Container

To run a container using a Docker image, you can use the following command:

```sh
docker run -d -p 80:80 --name my-apache-container ubuntu:latest
```

This command runs a container in detached mode (`-d`), maps port 80 of the host to port 80 of the container (`-p 80:80`), and names the container `my-apache-container`.one, and executable software package that includes everything needed to run a piece of software, including the code, runtime, system tools, libraries, and settings. Containers are isolated from each other and the host system, ensuring that they run consistently regardless of the environment.


# Docker Commands

1. ```docker run  -d -p HOST_PORT:CONTAINER_PORT --name name_of_container```
The -d or --detach option means running the container in the background (detached mode).

2. ```docker exec -it container_ID/NAME /bin/bash``` to run the container in interactive mode.


## Why container is lightweight?
Container does not have its own Operating System and they use resources from the base operating system.

## To creater image from dockerfile
```docker build -t rohit/my-first-image:latest . ```
use this command

## To run the iamge in interactive mode
```docker run -it -p HOST_PORT : CONT_PORT rohit/my-first-image:latest``` 


## What is a Docker Volume?

A Docker volume is a mechanism for persisting data generated by and used by Docker containers. Volumes are stored outside the container's filesystem, making them independent of the container's lifecycle. This means that data in volumes is not lost when the container is stopped or removed. It can also used for recover container.

### Creating a Docker Volume

To create a Docker volume, you can use the following command:

```sh
docker volume create my-volume
```

This command creates a new volume named `my-volume`.

### Using a Docker Volume

To use a Docker volume, you can mount it to a container using the `-v` or `--volume` option with the `docker run` command:

```sh
docker run -d -p 80:80 --name my-apache-container -v my-volume:/usr/local/apache2/htdocs/ httpd:latest
```

In this example, the volume `my-volume` is mounted to the `/usr/local/apache2/htdocs/` directory inside the container. Any data written to this directory will be stored in the volume and persist even if the container is removed.

### Listing Docker Volumes

To list all Docker volumes on your system, use the following command:

```sh
docker volume ls
```

### Inspecting a Docker Volume

To get detailed information about a specific volume, use the `docker volume inspect` command:

```sh
docker volume inspect my-volume
```

### Removing a Docker Volume

To remove a Docker volume, use the `docker volume rm` command:

```sh
docker volume rm my-volume
```

Note that you cannot remove a volume that is currently in use by a container.

## What is a Docker Network?

A Docker network is a virtual network that allows containers to communicate with each other, as well as with the host system and external networks. Docker provides several network drivers to manage how containers connect and interact.

### Types of Docker Networks

- **Bridge Network**: The default network driver. Containers on the same bridge network can communicate with each other, but are isolated from containers on other bridge networks.
- **Host Network**: Removes network isolation between the container and the Docker host, allowing the container to use the host's network stack directly.
- **Overlay Network**: Enables communication between containers on different Docker hosts, typically used in a Docker Swarm or Kubernetes setup.
- **None Network**: Disables all networking for the container, providing complete network isolation.
- **Macvlan Network**: Assigns a MAC address to each container, making it appear as a physical device on the network.

### Creating a Docker Network

To create a Docker network, use the following command:

```sh
docker network create my-network
```

This command creates a new network named `my-network`.

### Connecting a Container to a Network

To connect a container to a specific network, use the `--network` option with the `docker run` command:

```sh
docker run -d --name my-container --network my-network ubuntu:latest
```

This command runs a container named `my-container` on the `my-network` network.

### Listing Docker Networks

To list all Docker networks on your system, use the following command:

```sh
docker network ls
```

### Inspecting a Docker Network

To get detailed information about a specific network, use the `docker network inspect` command:

```sh
docker network inspect my-network
```

### Disconnecting a Container from a Network

To disconnect a container from a network, use the `docker network disconnect` command:

```sh
docker network disconnect my-network my-container
```

### Removing a Docker Network

To remove a Docker network, use the `docker network rm` command:

```sh
docker network rm my-network
```

Note that you cannot remove a network that is currently in use by a container.

### Benefits of Docker Networks

- **Isolation**: Networks provide isolation between containers, enhancing security and stability.
- **Flexibility**: Different network drivers allow for various networking setups, from simple bridge networks to complex multi-host overlay networks.
- **Scalability**: Overlay networks enable seamless communication between containers across multiple hosts, facilitating scalable distributed applications.
- **Simplicity**: Docker networks simplify the process of connecting and managing container communication, reducing the complexity of network configuration.

## What is Docker Compose?

Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to use a YAML file to configure your application's services, networks, and volumes. With a single command, you can create and start all the services defined in the configuration.

### Using Docker Compose

To use Docker Compose, follow these steps:

1. **Install Docker Compose**: Ensure Docker Compose is installed on your system. You can download it from the [official Docker website](https://docs.docker.com/compose/install/).

2. **Create a `docker-compose.yml` file**: Define your application's services, networks, and volumes in a `docker-compose.yml` file.

3. **Run Docker Compose**: Use the `docker-compose` command to manage your application.

### Example of a `docker-compose.yml` File

Here is a simple example of a `docker-compose.yml` file that defines a web application with an Nginx web server and a Redis database:

```yaml
version: '3'
services:
    web:
        image: nginx:latest
        ports:
            - "80:80"
    redis:
        image: redis:latest
```

### Running the Application

To run the application defined in the `docker-compose.yml` file, use the following command:

```sh
docker-compose up
```

This command creates and starts the `web` and `redis` services. You can access the Nginx web server at `http://localhost`.

### Stopping the Application

To stop the application, use the following command:

```sh
docker-compose down
```

This command stops and removes the containers, networks, and volumes created by `docker-compose up`.

### Benefits of Docker Compose

- **Simplified Configuration**: Use a single YAML file to define and manage multiple services.
- **Easy Management**: Start, stop, and manage all services with simple commands.
- **Reproducibility**: Ensure consistent environments across development, testing, and production.
- **Scalability**: Easily scale services by adjusting the configuration.

Docker Compose is a powerful tool for managing multi-container applications, making it easier to develop, test, and deploy complex applications.