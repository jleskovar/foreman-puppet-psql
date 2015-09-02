FROM phusion/baseimage
MAINTAINER jleskovar@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y install ca-certificates && \
curl -O https://apt.puppetlabs.com/puppetlabs-release-trusty.deb && \
dpkg -i puppetlabs-release-trusty.deb && \
echo "deb http://deb.theforeman.org/ trusty 1.9" > /etc/apt/sources.list.d/foreman.list && \
echo "deb http://deb.theforeman.org/ plugins 1.9" >> /etc/apt/sources.list.d/foreman.list && \
curl http://deb.theforeman.org/pubkey.gpg | apt-key add - && \
apt-get -qq update && apt-get -qq -y install foreman-installer

RUN mkdir -p /opt/foreman
COPY files /opt/foreman
RUN chmod +x /opt/foreman/start.sh

WORKDIR /opt/foreman
ENTRYPOINT ["./start.sh"]
