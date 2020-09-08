FROM ubuntu:18.04

RUN apt-get update && apt-get install -y firefox sudo

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
RUN sudo mkdir planner_viz
RUN apt-get update && apt install -y cmake build-essential vim libprotobuf-dev protobuf-compiler 
ADD . $HOME/developer/planner_viz/
#CMD /usr/bin/firefox
