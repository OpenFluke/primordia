#!/bin/bash

for i in $(seq 1 100); do
  host_udp=$((10000 + (i-1)*3))
  host_tcp=$((10001 + (i-1)*3))
  host_workers=$((10002 + (i-1)*3))

  podman run -d \
    --name bio$i \
    -p $host_udp:15000/udp \
    -p $host_tcp:16000/tcp \
    -p $host_workers:14000/tcp \
    biofoundry
done