FROM ubuntu:jammy
LABEL org.opencontainers.image.authors="Rogier Gerritse <rogierg@electronicsamurai.com>,Jimmy Bristow <jbristow@home-lab.tech>"

ENV TZ="America/Chicago"
ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
  apt-get install -y --no-install-recommends curl lsb-release || true && \
  curl -O $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep jammy_arm64.deb) \
  dpkg -i check-mk-raw-*.jammy_arm64.deb || true && \
  rm check-mk-raw-*.jammy_arm64.deb && \
  apt-get install -y -f --no-install-recommends && \
  apt-get autoremove -y && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*
EXPOSE 5000/tcp
WORKDIR /app
COPY *.sh /app/
CMD ["sh", "/app/run.sh"]
