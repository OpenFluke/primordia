#!/bin/bash

cd "$(dirname "$0")"

MAX_JOBS=100  # control how many stop/rm run in parallel (tune as needed)

parallel_jobs=0

for i in $(seq 1 100); do
  {
    podman stop bio$i 2>/dev/null
    podman rm bio$i 2>/dev/null
  } &

  ((parallel_jobs++))

  if (( parallel_jobs >= MAX_JOBS )); then
    wait
    parallel_jobs=0
  fi
done

wait  # wait for remaining background jobs to finish
