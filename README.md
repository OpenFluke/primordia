# Primordia

Distributed Multiverse Simulator  
Every pod is its own universe.  
Each universe spawns 0-30 random planets.  
No communication between pods.  
Pure chaos sandbox for AI training.

This isn't perfect solution but meets needs for testing for now

download and make game into biofoundry.zip

setting permissions

```
chmod +x start_biofoundry.sh stop_biofoundry.sh
```

need to build and make sure you have podman installed

```
podman build -t biofoundry .
```

start all pods

```
./start_biofoundry.sh
```

to check

```
podman logs bio1
```

to stop all pods

```
./stop_biofoundry.sh
```
