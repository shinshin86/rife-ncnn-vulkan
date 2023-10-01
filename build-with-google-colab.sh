#####################################
# Command to build rife-ncnn-vulkan on Google Colab
# Paste into Google Colab and run

### Why sh format files? ###
# This file is intended to be run on Google Colab
# But in the case of ipynb files, some editors will generate errors because they are not in JSON format, so the sh extension is used.
#####################################

%cd /content
!apt-get update && !apt-get install -y tar cmake g++ make zip

!git clone https://github.com/nihui/rife-ncnn-vulkan.git
%cd rife-ncnn-vulkan
!git submodule update --init --recursive

!wget https://sdk.lunarg.com/sdk/download/1.2.182.0/linux/vulkansdk-linux-x86_64-1.2.182.0.tar.gz -O vulkansdk-linux-x86_64-1.2.182.0.tar.gz
!tar -xf vulkansdk-linux-x86_64-1.2.182.0.tar.gz
!rm -rf 1.2.182.0/source 1.2.182.0/samples
!find 1.2.182.0 -type f | grep -v -E 'vulkan|glslang' | xargs rm

%env VULKAN_SDK=/content/rife-ncnn-vulkan/1.2.182.0/x86_64

!mkdir build
%cd build
!cmake ../src
!cmake --build . -j 2

%env PACKAGENAME=rife-ncnn-vulkan_20221029_ubuntu
!mkdir -p $PACKAGENAME

%cd /content/rife-ncnn-vulkan/build/rife-ncnn-vulkan_20221029_ubuntu
!cp /content/rife-ncnn-vulkan/build/rife-ncnn-vulkan .
!strip -g ./rife-ncnn-vulkan
!cp -r /content/rife-ncnn-vulkan/models/* .

# version
!./rife-ncnn-vulkan -h
