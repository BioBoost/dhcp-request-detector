# DHCP Request Detector

Tool to detect DHCP requests in the network.

Runs in a docker container connected to the host's network.

The detected requests are parsed and published via MQTT.

## Run Docker Container

Get the docker image from DockerHub and run it

```bash
docker run -d --network=host bioboost/dhcp-detector:v1.0
```

Makes sure to connect the container to the host's network.
