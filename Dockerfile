FROM balenalib/raspberry-pi-debian:latest
MAINTAINER Rogier Gerritse <rogierg@electronicsamurai.com>

RUN apt-get update && \ 
  DEBIAN_FRONTEND=noninteractive apt-get install -y curl lsb-release apt-utils || true
RUN curl -LO $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/tags/2.0.0p3 | grep browser_download_url | cut -d '"' -f 4 | grep buster_armhf.deb) && \
  dpkg -i check-mk-raw-*.buster_armhf.deb || true && \
  rm check-mk-raw-*.buster_armhf.deb && \
  DEBIAN_FRONTEND=noninteractive apt-get install -f && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  DEBIAN_FRONTEND=noninteractive apt-get clean -y
EXPOSE 5000/tcp
WORKDIR /app
#RUN omd create mon
#RUN groupadd -g 6000 mon && \
#  useradd -g 6000 -u 6000 -ms /bin/bash -d /omd/sites/mon mon && \
#  usermod -aG mon www-data && \
#  usermod -aG omd mon
COPY *.sh /app/
#RUN /app/init.sh
CMD ["sh", "/app/run.sh"]
