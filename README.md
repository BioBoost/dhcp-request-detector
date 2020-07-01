# DHCP Request Detector

Tool to detect DHCP requests in the network.

Runs in a docker container connected to the host's network.

The detected requests are parsed and published via MQTT.

## Using Docker

Build the container

```bash
docker build -t detector .
```

Run the container

```bash
docker run -d --network=host detector
```

Make sure to connect the container to the host network.
