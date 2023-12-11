# DHCP Request Detector

Tool to detect DHCP requests in the network.

Runs in a docker container connected to the host's network.

The detected requests are parsed and published via MQTT.

Example of published message:

```json
{
  "time": "Thu Jul 2 15:36:28 UTC 2020",
  "mac": "22:11:00:cc:bb:aa",
  "ip": "172.16.0.1",
  "hostname": "unknown"
}
```

## Run Docker Container

### Build

Build the docker image using:

```bash
docker build -t dhcp-detector .
```

Running the image as a container:

```bash
docker run -it -e MQTT_BROKER=mybroker -e MQTT_TOPIC="my/cool/topic" --network=host --rm dhcp-detector
```

### From DockerHub

Get the docker image from DockerHub and run it

```bash
docker run -d --restart unless-stopped --network=host bioboost/dhcp-detector:v2.1
```

Make sure to connect the container to the host's network.

The broker and topic can be configured via environment variables:

```bash
docker run -it -e MQTT_BROKER=mybroker -e MQTT_TOPIC="my/cool/topic" -e MQTT_USERNAME=username -e MQTT_PASSWORD=password --network=host --rm bioboost/dhcp-detector:v2.1
```

## Running Script Locally

The script can also be run without docker. Just make sure to install it's dependencies first:

```bash
apt install -y gawk tcpdump jq mosquitto-clients
```

To configure the broker and topic one can pass these as arguments to the script:

```bash
./detector -b mybroker -t some/cool/topic -u username -p password
```

or as environment variables `MQTT_BROKER`, `MQTT_TOPIC`, `MQTT_USERNAME` & `MQTT_PASSWORD`:

```bash
MQTT_BROKER=mybroker MQTT_TOPIC=some/cool/topic MQTT_USERNAME=username MQTT_PASSWORD=password ./detector
```

The arguments passed to the script take precedence over the environment variables.
