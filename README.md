# Imgui-basic-example

## Standard usage

#### Install dependencies
`sh install_dependencies.sh`

#### Build
- `mkdir build && cd build`
- `cmake ..`
- `make`

#### Run
- `./bin/imgui-basic-example`

## Docker usage

#### Setup Docker environment (see https://nvidia.github.io/nvidia-docker/)
- `curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -`
- `distribution=$(. /etc/os-release;echo $ID$VERSION_ID)`
- `curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list`
- `sudo apt update`
- `curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -`
- `sudo apt install nvidia-docker2`
- `sudo pkill -SIGHUP dockerd`

#### Install rocker
- `sudo apt install python3-rocker`

#### Build Docker image
- `docker build -t <image-name> .`

#### Run Docker image 
- `rocker --nvidia --x11 --net=host <image-name>`

#### Run
- `./bin/imgui-basic-example`


