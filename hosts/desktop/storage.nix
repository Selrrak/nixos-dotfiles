{ ... }:
{

fileSystems."/home/selrak/storage" = {
  device = "/dev/disk/by-label/storage";
  fsType = "ext4";
  options = [ "nofail" ];
};

}
