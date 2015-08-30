FROM ubuntu:14.04
MAINTAINER jleskovar@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y install wget && apt-get -qq -y install ca-certificates && \
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb && \
dpkg -i puppetlabs-release-trusty.deb && \
echo "deb http://deb.theforeman.org/ trusty 1.9" > /etc/apt/sources.list.d/foreman.list && \
echo "deb http://deb.theforeman.org/ plugins 1.9" >> /etc/apt/sources.list.d/foreman.list && \
wget -q http://deb.theforeman.org/pubkey.gpg -O- | apt-key add - && \
apt-get -qq update && apt-get -qq -y install foreman-installer

RUN foreman-installer --foreman-admin-password=changeme
