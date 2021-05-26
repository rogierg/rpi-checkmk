FROM balenalib/raspberry-pi-debian:latest
MAINTAINER Rogier Gerritse <rogierg@electronicsamurai.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl lsb-release apt-utils || true && \
  curl -LO $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/tags/2.0.0p4 | grep browser_download_url | cut -d '"' -f 4 | grep buster_armhf.deb) && \
  dpkg -i check-mk-raw-*.buster_armhf.deb || true && \
  rm check-mk-raw-*.buster_armhf.deb && \
  DEBIAN_FRONTEND=noninteractive apt-get install -f && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  DEBIAN_FRONTEND=noninteractive apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*
EXPOSE 5000/tcp
WORKDIR /app
COPY *.sh /app/
CMD ["sh", "/app/run.sh"]
