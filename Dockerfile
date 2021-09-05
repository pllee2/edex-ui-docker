FROM ubuntu:bionic

# Run with: sudo docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix edex

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt install -y libx11-xcb-dev libgtk-3-0 libxss1 libgconf-2-4 libnss3 libasound2 net-tools mount vim htop git curl

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt install -y nodejs gcc g++ make
    
RUN mkdir -p /opt && cd /opt && git clone https://github.com/GitSquared/edex-ui.git && cd edex-ui && \
    npm install
    # useradd -m edex

RUN apt install -y libdrm2 libice6 libsm6 libgbm-dev

# RUN npm install -g electron --unsafe-perm=true --allow-root
# RUN mkdir -p /opt
WORKDIR /opt/edex-ui
# USER edex

# CMD npm start

