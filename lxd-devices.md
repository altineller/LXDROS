lxc config device add rosrider vc disk source=/opt/vc path=/opt/vc
lxc config device add rosrider ttyacm0 unix-char source=/dev/ttyACM0 path=/dev/ttyACM0 mode=0666 required=false
lxc config device add rosrider js0 unix-char source=/dev/input/js0 path=/dev/input/js0 mode=0666 required=false
#
lxc config device add rosider vchiq    unix-char mode=0666 source=/dev/vchiq    path=/dev/vchiq
lxc config device add rosider vcio     unix-char mode=0666 source=/dev/vcio     path=/dev/vcio
lxc config device add rosider vc-mem   unix-char mode=0666 source=/dev/vc-mem   path=/dev/vc-mem
lxc config device add rosider vcsm-cma unix-char mode=0666 source=/dev/vcsm-cma path=/dev/vcsm-cma
#
lxc config device add rosrider video0   unix-char mode=0666 source=/dev/video0   path=/dev/video0
lxc config device add rosrider media0   unix-char mode=0666 source=/dev/media0   path=/dev/media0
#
