FROM resin/rpi-raspbian:stretch

MAINTAINER Tloxipeuhca <tloxipeuhca@gmail.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y iputils-ping tar wget
RUN mkdir -p /home/download
WORKDIR /home/download
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.6.4_linux_armhf.tar.gz
RUN tar xvzf influxdb-1.6.4_linux_armhf.tar.gz
RUN mv influxdb-1.6.4-1/* /
#RUN apt-get install -y cmake apt-utils build-essential
#RUN apt-get install -y make gcc g++ libssl-dev git libcurl4-gnutls-dev libusb-dev python3-dev zlib1g-dev

#Clean up
RUN rm influxdb-1.6.4_linux_armhf.tar.gz
RUN rm influxdb-1.6.4-1
RUN apt-get clean
RUN apt-get autoclean
#RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose port.
EXPOSE 8096

CMD ["/usr/bin/influxd"]
