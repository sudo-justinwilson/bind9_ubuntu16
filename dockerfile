FROM ubuntu:16.04
MAINTAINER Justin Wilson "sudo.justin.wilson@gmail.com"
LABEL APP="bind9_on_ubuntu16.04"
LABEL version=0.1

# DNS container on Ubuntu 16.04 LTS

# install packages:
RUN apt-get update -y \
	&& apt-get dist-upgrade -y

RUN apt-get install -y bind9 bind9utils bind9-doc

# personal configuration files should be in a tar file in the current build context named "zones.tgz":
ADD zones.tgz /etc/bind/

WORKDIR /etc/bind

# start bind server:
CMD /etc/init.d/bind9 start

