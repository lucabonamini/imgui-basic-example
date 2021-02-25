FROM ubuntu:18.04

ENV HOME /home/developer
RUN apt update && apt install -y cmake build-essential apt-utils vim git sudo
ADD . $HOME/viz/
WORKDIR $HOME/viz/
RUN sh install_dependencies.sh
RUN mkdir build && cd build && cmake .. && make
