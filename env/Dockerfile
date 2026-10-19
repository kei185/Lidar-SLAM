ARG DISTRO=jazzy
# https://github.com/Tiryoh/docker-ros2-desktop-vnc
FROM tiryoh/ros2-desktop-vnc:${DISTRO}

RUN apt update
RUN apt install tree clang-format -y

# cmake の新しいやつ
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ jammy main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null
RUN sudo apt update
RUN sudo apt install cmake -y

# std 23用
RUN sudo add-apt-repository ppa:ubuntu-toolchain-r/test
RUN sudo apt update
RUN sudo apt install gcc-16 g++-16 clangd-20 -y

ARG DISTRO
RUN apt install \
    ros-${DISTRO}-desktop \
    ros-${DISTRO}-slam-toolbox \
    ros-${DISTRO}-navigation2 \
    ros-${DISTRO}-nav2-bringup \
    ros-${DISTRO}-joint-state-publisher \
    ros-${DISTRO}-joint-state-publisher-gui \
    ros-${DISTRO}-xacro \
    # sdf -> urdf compiler
    ros-${DISTRO}-sdformat-urdf \
    # odom -> base transfrom
    ros-${DISTRO}-robot-localization \
    ros-${DISTRO}-ros-gz -y # gazebo simulation


RUN echo "alias clangd='clangd-20'"  >> /etc/bash.bashrc
# activate ROS for any user
RUN echo "source /opt/ros/${DISTRO}/setup.bash" >> /etc/bash.bashrc
RUN echo "alias ros='ros2'"  >> /etc/bash.bashrc
# allow root user to be authenticated as ubuntu for X11 forwarding
RUN echo "export DISPLAY=':1'"  >> /root/.bashrc
RUN echo "export XAUTHORITY=/home/ubuntu/.Xauthority" >> /root/.bashrc
# let ROS discover local nodes
ENV ROS_DOMAIN_ID=0
ENV ROS_AUTOMATIC_DISCOVERY_RANGE=SUBNET


WORKDIR /home/ubuntu/mnt
