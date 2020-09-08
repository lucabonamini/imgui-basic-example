#FROM nvidia/opengl:1.0-glvnd-devel-ubuntu18.04 as glvnd
#FROM nvidia/opengl:1.0-glvnd-devel-ubuntu18.04 
FROM ubuntu:18.04

RUN apt-get update && apt-get install -y firefox sudo libglvnd0 libgl1 libglx0 libegl1 libgles2 cmake build-essential vim libprotobuf-dev protobuf-compiler apt-utils git && rm -rf /var/lib/apt/lists/*

COPY --from=glvnd /usr/share/glvnd/egl_vendor.d/10_nvidia.json /usr/share/glvnd/egl_vendor.d/10_nvidia.json
ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphic

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
RUN sudo mkdir $HOME/viz
RUN sudo apt-get install -y cmake build-essential vim libprotobuf-dev protobuf-compiler apt-utils git
ADD . $HOME/viz/
RUN cd $HOME/viz && sudo sh install_dependencies.sh
RUN cd $HOME/viz && sudo mkdir build && cd build && sudo cmake .. && sudo make
#CMD /usr/bin/firefox
