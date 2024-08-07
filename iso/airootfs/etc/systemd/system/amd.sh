#!/bin/bash
if [[ -f "/etc/modprobe.d/amd.conf" ]]; then
  systemctl disable amd.service
else
  echo DRI_PRIME=1 >> /etc/environment
  touch /etc/modprobe.d/amd.conf && echo options amdgpu si_support=1 >> /etc/modprobe.d/amd.conf && echo options amdgpu cik_support=1 >> /etc/modprobe.d/amd.conf
  echo options radeon si_support=0 >> /etc/modprobe.d/amd.conf && echo options radeon cik_support=0 >> /etc/modprobe.d/amd.conf
  mkinitcpio -P && grub-mkconfig -o /boot/grub/grub.cfg
fi
