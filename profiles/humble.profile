config:
  environment.DISPLAY: :0
  nvidia.driver.capabilities: all
  nvidia.runtime: "true"
  raw.idmap: "both 1000 1000"
  user.user-data: |
    #cloud-config
    package_update: yes
    package_upgrade: yes
    packages:
      - x11-apps
      - mesa-utils
      - libnss-mdns
      - net-tools
      - bridge-utils
      - curl
      - gnupg
      - lsb-release
    runcmd:
      - [sh, '-c', 'rm -rf /var/lib/apt/lists/*']
      - [sh, '-c', 'apt install locales -y']
      - [sh, '-c', 'locale-gen en_US en_US.UTF-8']
      - [sh, '-c', 'update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8']
      #
      - "apt-key adv --fetch-keys 'https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc'"
      - "apt-add-repository 'http://packages.ros.org/ros/ubuntu' -y"
      - "apt-add-repository 'http://packages.ros.org/ros2/ubuntu' -y"
      #
      - [sh, '-c', 'apt update -y']
      - [sh, '-c', 'apt install ros-humble-desktop -y']
      #
      - [sh, '-c', 'apt install python3-pip build-essential -y']
      - [sh, '-c', 'apt install python3-colcon-ros python3-colcon-common-extensions python3-rosdep2 -y']
      - [sh, '-c', 'apt install libusb-dev -y']
      - [sh, '-c', 'apt install libgconf-2-4 libncurses5 libpython2.7 libtinfo5 -y']
      - [sh, '-c', 'sudo -u ubuntu pip3 install -U argcomplete']
      #
      - [sh, '-c', 'sudo -u ubuntu echo "export LANG=en_US.UTF-8" >> /home/ubuntu/.bashrc']
      - [sh, '-c', 'sudo -u ubuntu echo "source /opt/ros/humble/setup.bash" >> /home/ubuntu/.bashrc']
      - [sh, '-c', 'rm -rf /var/lib/apt/lists/*']
description: humble
devices:
  X0:
    bind: container
    connect: unix:@/tmp/.X11-unix/X1
    listen: unix:@/tmp/.X11-unix/X0
    security.gid: "1000"
    security.uid: "1000"
    type: proxy
  mygpu:
    type: gpu
  eth0:
    name: eth0
    network: lxdbr0
    type: nic
  eth1:
    nictype: macvlan
    parent: enp63s0
    type: nic
  root:
    path: /
    pool: default
    type: disk
name: humble
