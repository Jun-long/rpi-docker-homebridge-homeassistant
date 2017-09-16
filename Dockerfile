#FROM node
FROM hypriot/rpi-node:slim
MAINTAINER Valentin Alexeev <valentin.alekseev@gmail.com>

RUN apt-get update

RUN apt-get install -y curl wget libavahi-compat-libdnssd-dev dbus avahi-daemon node-gyp make g++ build-essential avahi-discover libnss-mdns

RUN sed -i.bak 's/^#enable-dbus/enable-dbus/' /etc/avahi/avahi-daemon.conf

RUN npm -g install \
      homebridge \
      homebridge-homeassistant \
      homebridge-config-ui \
      homebridge-mi-air-purifier miio \
      homebridge-mi-fan && \

USER root

VOLUME /root

EXPOSE 5353 51826

ENTRYPOINT ["/bin/sh", "/root/run.sh"]
