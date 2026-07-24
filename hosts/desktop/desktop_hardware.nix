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

}
