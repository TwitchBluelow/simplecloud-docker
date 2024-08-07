# simplecloud-docker

This image provides the possibility to run simplecloud in docker. The image runs a screen inside the container to make it possible to interact with the cloud event when attached over a separate shell.

## Pull the image
```bash
docker pull bluel0w/simplecloud-docker
```

## Running the container
```bash
docker run -d -it --name simplecloud simplecloud
```

## Environment Variables
- STARTUP
    - Possible values: **Manager | Wrapper**
    - This starts the Manager or Wrapper application automatically
### Example
```bash
docker run -d -it --name simplecloud -e STARTUP=Manager simplecloud
```

## Docker Compose (Manager only)
### Note: An additional Wrapper is optional since Manager has an InternalWrapper

```yml
version: '3'
services:
  simplecloud:
    image: simplecloud:latest # The name of the image
    container_name: simplecloud
    volumes:
      - simplecloud_data:/app # Stores the data persistent
    ports:
      - "25565:25565"  # Change the port if your Cloud listens on a different port
      - "8585:8585" # REST-API
    environment:
      - STARTUP=Manager  # Set the required STARTUP application here
    stdin_open: true 
    tty: true

volumes:
  simplecloud_data:
```

## Docker Compose (Manager + Additional Wrapper)
### Note: An additional Wrapper is optional since Manager has an InternalWrapper
```yml
version: '3'
services:
  simplecloud-manager:
    image: bluel0w/simplecloud-docker:latest # The name of the image
    volumes:
      - simplecloud_data:/app # Stores the data persistent
    networks:
      - simplecloud_net
    ports:
      - "25565:25565"  # Change the port if your Cloud listens on a different port
      - "8585:8585" # REST-API
    environment:
      - STARTUP=Manager  # Set the required STARTUP application here
    stdin_open: true 
    tty: true
  simplecloud-wrapper:
    image: bluel0w/simplecloud-docker:latest # The name of the image
    volumes:
      - simplecloud_data:/app # Stores the data persistent
    networks:
      - simplecloud_net
    environment:
      - STARTUP=Wrapper  # Set the required STARTUP application here
    stdin_open: true 
    tty: true

volumes:
  simplecloud_data:

networks:
  simplecloud_net:
```

## Connect to SimpleCloud Command-Line
```bash
docker attach simplecloud
```

This way you can interact with the built-in shell.

### Please note!!
It is highly recommended to use a volume to store persistent data of the cloud configurations.
