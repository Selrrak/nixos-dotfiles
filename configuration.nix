{ config, lib, pkgs, ... }:

{
  imports =
    [       ./hardware-configuration.nix
            ./modules/virtualization.nix
    ];
  nixpkgs.config.allowUnfree = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };
  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
};

  networking.wireless.iwd.enable = true;

  time.timeZone = "America/Montreal";

services.getty.autologinUser = "selrak";

users.users.selrak = {
   isNormalUser = true;
   extraGroups = [ "wheel" "video" "render" ];
   packages = with pkgs; [
     tree
   ];
 };
programs.hyprland = {
  enable = true;
  xwayland.enable = true;
};
programs.firefox.enable = true;

programs.steam.enable = true;
programs.steam.remotePlay.openFirewall = true;
programs.steam.gamescopeSession.enable = true;
programs.steam.localNetworkGameTransfers.openFirewall = true;

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

 environment.systemPackages = with pkgs; [
  vim
  wget
  git
  swaybg
  kitty
  waybar
  everforest-cursors 
  hyprpolkitagent
  gamescope
 ];

programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };


services.openssh.enable = true;
services.tailscale.enable = true;

fonts.packages = with pkgs; [
	nerd-fonts.jetbrains-mono
];

security.rtkit.enable = true;

services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

services.pulseaudio.enable = false;

fileSystems."/home/selrak/storage" = {
  device = "/dev/disk/by-label/storage";
  fsType = "ext4";
  options = [ "nofail" ];
};

nix.settings.experimental-features = [ "nix-command" "flakes" ];

system.stateVersion = "26.05";

}

