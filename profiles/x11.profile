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
description: x11
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
name: x11
used_by: []
