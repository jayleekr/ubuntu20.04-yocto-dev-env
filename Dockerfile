# Author : Jay Lee
# Last Edit : Jan 09, 2021

# Modification History
# Jan 09, 2021 | First Release

FROM ubuntu:20.04

# For the convinience of Korean :D
RUN sed -i 's/archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list 

RUN yoctoDeps=' \
      build-essential \
      chrpath \
      diffstat \
      gawk \
      gcc-multilib \
      git \
      language-pack-en-base \
      libsdl1.2-dev \
      locales \
      socat \
      texinfo \
      unzip \
      wget \
      xterm \
      repo \
      parted \
      dosfstools \
      mtools \
    ' \
    mobilgeneDeps=' \
      sudo \
      apt-utils \
      xz-utils \
      build-essential \
      curl \
      less \
      wget \
      cmake \
      python \
      python-lxml \
      python3-pip \
      net-tools \
      iproute2 \
      iputils-ping \
      gdb \
      gdbserver \
      libjansson-dev \
      doxygen \
      graphviz \
      libpcap-dev \
      libsnmp-dev \
      cmake-curses-gui \
      cmake-gui \
      tftp-hpa  \
    ' \
    otherDeps=' \
      libboost-all-dev \
      iptables \
      debianutils \
    ' \
    && apt-get update && apt-get install -y \
      $yoctoDeps \
      $mobilgeneDeps \
      $otherDeps 
  
RUN pip3 install lxml jinja2 treelib

#create mount points and set owner

RUN mkdir /root/projects
RUN mkdir /root/downloads
RUN mkdir /root/sstate-cache

CMD [ "/bin/bash" ]
