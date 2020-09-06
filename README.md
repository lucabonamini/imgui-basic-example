# Imgui-basic-example
## Install dependencies
`sh install_dependencies.sh`

## Setup Docker environment (see https://nvidia.github.io/nvidia-docker/)
`curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -`
`distribution=$(. /etc/os-release;echo $ID$VERSION_ID)`
`curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list`
`sudo apt-get update`
`curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -`
`sudo apt-get install nvidia-docker2`
`sudo pkill -SIGHUP dockerd`

## Install rocker
`sudo apt-get install python3-rocker`

## Build Docker image
`sudo docker build -t imgui-basic-example .`

## Run Docker image 
*ROS image has Nvidia dependencies already setup. To be improved in the future*

`sudo rocker --nvidia --x11 --user --home osrf/ros:melodic-desktop-full`

## Build
`mkdir build && cd build`
`cmake ..`
`make`

## Usage

