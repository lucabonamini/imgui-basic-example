#!/bin/sh
sudo apt-get install --yes libeigen3-dev
sudo apt-get install --yes libboost-all-dev
sudo apt-get install --yes freeglut3-dev
sudo apt-get install --yes libglfw3-dev
sudo apt-get install --yes libxinerama-dev
sudo apt-get install --yes libxcursor-dev
sudo apt-get install --yes libxi-dev

mkdir external && cd external

# GLFW
git clone -n https://github.com/glfw/glfw && cd glfw && git checkout 3.3.2 && cd ..

# IMGUI
git clone -n https://github.com/ocornut/imgui && cd imgui && git checkout fb7f6cab8c322731da336e553915e944bf386e62 && cd ..

echo [install_dependencies.sh] Leaving external/
cd ..
