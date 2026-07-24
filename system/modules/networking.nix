{ ... }:
{
  networking.hostName = "nixos";

  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  networking.wireless.iwd.enable = true;

  services.openssh.enable = true;
  services.tailscale.enable = true;
}

