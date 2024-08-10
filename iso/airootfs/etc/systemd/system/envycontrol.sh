#!/bin/bash
if [[ -f "/etc/modprobe.d/nvidia.conf" ]]; then
  systemctl disable envycontrol.service
else
  envycontrol -s nvidia --dm sddm
fi
  
