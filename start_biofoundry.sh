#!/bin/bash

for i in $(seq 1 100); do
  base_udp=$((10000 + (i-1)*3))
  base_tcp=$((10001 + (i-1)*3))
  base_workers=$((10002 + (i-1)*3))

  podman run -d \
    --name bio$i \
    -p $base_udp:$base_udp/udp \
    -p $base_tcp:$base_tcp/tcp \
    -p $base_workers:$base_workers/tcp \
    -e UDPPORT=$base_udp \
    -e TCPPORT=$base_tcp \
    -e TCPWORKERS=$base_workers \
    biofoundry
done
