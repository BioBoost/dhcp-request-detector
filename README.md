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

## Running Script Locally

The script can also be run without docker. Just make sure to install it's dependencies first:

```bash
apt install -y gawk tcpdump jq mosquitto-clients
```

To configure the broker and topic one can pass these as arguments to the script:

```bash
./detector -b mybroker -t some/cool/topic
```

or as environment variables `BROKER` and `TOPIC`:

```bash
BROKER=mybroker TOPIC=some/cool/topic ./detector
```

The arguments passed to the script take precedence over the environment variables.
