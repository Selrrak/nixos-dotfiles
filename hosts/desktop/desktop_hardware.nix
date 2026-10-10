{ ... }:
{  
  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
};
services.xserver.videoDrivers = [ "nvidia" ];

hardware.graphics = {
  enable = true;
  enable32Bit = true;
};

hardware.nvidia = {
  modesetting.enable = true;
  open = true;
  powerManagement.enable =true;
  powerManagement.finegrained = false;
  nvidiaSettings = true;
};
hardware.i2c.enable=true;

services.udev.extraRules = ''
  KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
'';

users.groups.i2c = {};
}
