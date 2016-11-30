FROM armv7/armhf-ubuntu:16.10
MAINTAINER Ryan Schlesinger <ryan@ryanschlesinger.com>

RUN apt-get update && apt-get install -y \
      locales \
      sudo \
      whois \
      cups \
    && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN useradd \
  --groups=sudo,lp,lpadmin \
  --create-home \
  --home-dir=/home/print \
  --shell=/bin/bash \
  --password=$(mkpasswd print) \
  print \
  && sed -i '/%sudo[[:space:]]/ s/ALL[[:space:]]*$/NOPASSWD:ALL/' /etc/sudoers

COPY cupsd.conf /etc/cups/cupsd.conf
EXPOSE 631
ENTRYPOINT ["/usr/sbin/cupsd", "-f"]
