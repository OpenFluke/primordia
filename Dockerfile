FROM fedora:latest

WORKDIR /app

COPY biofoundry.zip /tmp/game.zip

# Install dependencies and Mono
RUN dnf install -y \
    unzip \
    file \
    glibc \
    libstdc++ \
    fontconfig \
    libicu \
    bash \
    libX11 \
    libXcursor \
    libXrandr \
    libXinerama \
    mesa-libGL \
    mono-complete \
    && unzip /tmp/game.zip -d /app \
    && chmod -R 755 /app \
    && chmod +x /app/BioFoundry.x86_64 \
    && rm /tmp/game.zip

# Command to run the game
#CMD bash -c "cd /app && ls -lah && ./BioFoundry.x86_64 --headless -UDPPort=${UDPPORT:-10000} -TCPPort=${TCPPORT:-10001} -TCPWorkers=${TCPWORKERS:-10002} || sleep infinity"
CMD bash -c "cd /app && ls -lah && ./BioFoundry.x86_64 --headless -UDPPort=15000 -TCPPort=16000 -TCPWorkers=14000 || sleep infinity"