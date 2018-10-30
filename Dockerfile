FROM resin/rpi-raspbian:stretch

MAINTAINER Tloxipeuhca <tloxipeuhca@gmail.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y iputils-ping tar wget rsync
RUN mkdir -p /home/download
WORKDIR /home/download
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.6.4_linux_armhf.tar.gz
RUN tar xvzf $(ls . | grep ".tar.gz$" | head -1)
RUN rsync -arv $(ls . | grep "^influxdb" | head -1)/* /

#Clean up
RUN rm $(ls . | grep ".tar.gz$" | head -1)
RUN rm -fR $(ls . | grep "^influxdb" | head -1)
RUN apt-get clean
RUN apt-get autoclean

# Expose port.
EXPOSE 8096

CMD ["/usr/bin/influxd"]
