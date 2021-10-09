FROM ubuntu:20.04
LABEL author="apektas"

RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Istanbul /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install build-essential cmake libyaml-cpp-dev wget -y


RUN  cd /root && wget https://github.com/protocolbuffers/protobuf/releases/download/v3.18.0/protobuf-all-3.18.0.tar.gz && \
    tar -zxvf protobuf-all-3.18.0.tar.gz && \
    cd protobuf-3.18.0/ && ./configure && make && make check && make install && ldconfig

RUN rm -rf /root/protobuf-*
