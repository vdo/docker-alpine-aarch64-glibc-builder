## WHAT
Docker container to build an Alpine glibc package for the aarch65

## BUILD
Build the container
`docker build -t docker-alpine-rpi-glibc-builder .`

## USE
Start the container and mount your local directory
`docker run -v $PWD:/home/volume -it --rm docker-alpine-rpi-glibc-builder /bin/ash`

Copy the .apk files out of the container (and pubkey)
`cp /home/builder/packages/builder/aarch64/* /home/volume`
`cp /home/builder/.abuild/* /home/volume`
