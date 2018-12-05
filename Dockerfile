FROM aarch64/alpine

# Create our user and setup Alpine for building APKs
RUN apk --no-cache add alpine-sdk coreutils && \
    adduser -G abuild -g "Alpine Package Builder" -s /bin/ash -D builder && \
    echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir /packages && \
    chown builder:abuild /packages
        
USER builder
WORKDIR /home/builder

RUN abuild-keygen -a -i -n

RUN git clone --single-branch https://github.com/vdo/alpine-pkg-glibc.git upstream && \
    mkdir packages && \
    chown -R 1000 upstream packages && \
    cd upstream && \
    abuild -r

