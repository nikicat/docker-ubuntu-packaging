FROM yandex/ubuntu:14.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qyy build-essential devscripts debhelper command-not-found python3-setuptools python-all python-setuptools python3-all gnupg-agent dupload dput

ADD .selected_editor /root/
ADD .dupload.conf /root/

ENV SSH_AUTH_SOCK /ssh-agent
ENV DEBFULLNAME Nikolay Bryskin
ENV DEBEMAIL devel.niks@gmail.com
ENV USER nbryskin
ENV LESSOPEN | /usr/bin/lesspipe %s
ENV LESSCLOSE /usr/bin/lesspipe %s %s

RUN git config --global user.email "devel.niks@gmail.com"
RUN git config --global user.name "Nikolay Bryskin"

VOLUME ['/pkg', '/root/.gnupg', '/ssh-agent']
WORKDIR /pkg
