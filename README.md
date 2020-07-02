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

Get the docker image from DockerHub and run it

```bash
docker run -d --network=host bioboost/dhcp-detector:v1.0
```

Make sure to connect the container to the host's network.

The broker and topic can be configured via environment variables:

```bash
docker run -it -e BROKER=mybroker -e TOPIC="my/cool/topic" --network=host --rm bioboost/dhcp-detector:v1.0
```

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
