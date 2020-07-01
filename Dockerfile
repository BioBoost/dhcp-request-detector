# Image this one is based on
FROM ubuntu:20.04

RUN apt update -y && \
  apt install -y gawk tcpdump jq mosquitto-clients

# Setup a working dir
WORKDIR /app

# Copy all files
COPY . .

# The final command that starts the script
CMD ["./scripts/detector"]