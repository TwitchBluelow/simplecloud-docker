# simplecloud-docker

This image provides the possibility to run simplecloud in docker. The image runs a screen inside the container to make it possible to interact with the cloud event when attached over a separate shell.

## Pull the image
```bash
docker pull simplecloud-docker
```

## Running the container
```bash
docker run -d -it --name simplecloud simplecloud
```

## Environment Variables
- STARTUP
    - Possible values: **Manager | Wrapper**
    - This starts the Manager or Wrapper application automatically

## Setting up the Cloud-System
```bash
docker attach simplecloud
```

This way you can interact with the built-in shell.

### Please note!
It is highly recommended to use a volume to store persistent data of the cloud configurations.