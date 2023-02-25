FROM balenalib/raspberry-pi-debian:latest
MAINTAINER Rogier Gerritse <rogierg@electronicsamurai.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl lsb-release apt-utils || true && \
  curl -LO $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep bullseye_armhf.deb) && \
  dpkg -i check-mk-raw-*.bullseye_armhf.deb || true && \
  rm check-mk-raw-*.bullseye_armhf.deb && \
  DEBIAN_FRONTEND=noninteractive apt-get install -f --no-install-recommends && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  DEBIAN_FRONTEND=noninteractive apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*
EXPOSE 5000/tcp
WORKDIR /app
COPY *.sh /app/
ENTRYPOINT ["/bin/bash"] 
CMD ["/app/run.sh"]
