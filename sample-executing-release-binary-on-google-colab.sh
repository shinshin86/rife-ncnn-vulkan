#####################################
# Command a sample of executing a release binary on Google Colab
# Paste into Google Colab and run

### Why sh format files? ###
# This file is intended to be run on Google Colab
# But in the case of ipynb files, some editors will generate errors because they are not in JSON format, so the sh extension is used.
#####################################
!apt-get install -y libvulkan-dev

!wget https://github.com/nihui/rife-ncnn-vulkan/releases/download/20221029/rife-ncnn-vulkan-20221029-ubuntu.zip
!unzip rife-ncnn-vulkan-20221029-ubuntu.zip

%cd /content/rife-ncnn-vulkan-20221029-ubuntu
!./rife-ncnn-vulkan -h
