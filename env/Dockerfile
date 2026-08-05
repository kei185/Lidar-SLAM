ARG DISTRO=jazzy
# https://github.com/Tiryoh/docker-ros2-desktop-vnc
FROM tiryoh/ros2-desktop-vnc:${DISTRO}

ARG DISTRO
RUN apt update
RUN apt install tree clang-format clangd -y
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


# activate ROS for any user
RUN echo "source /opt/ros/${DISTRO}/setup.bash" >> /etc/bash.bashrc
RUN echo "alias ros='ros2'"  >> /etc/bash.bashrc
# allow root user to be authenticated as ubuntu for X11 forwarding
RUN echo "export DISPLAY=':1'"  >> /root/.bashrc
RUN echo "export XAUTHORITY=/home/ubuntu/.Xauthority" >> /root/.bashrc
# let ROS discover local nodes
ENV ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST

WORKDIR /home/ubuntu/mnt
