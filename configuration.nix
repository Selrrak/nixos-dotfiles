{ config, lib, pkgs, ... }:

{
  imports =
    [       ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/Montreal";

services.getty.autologinUser = "selrak";

users.users.selrak = {
   isNormalUser = true;
   extraGroups = [ "wheel" ];
   packages = with pkgs; [
     tree
   ];
 };
programs.hyprland = {
  enable = true;
  xwayland.enable = true;
};
programs.firefox.enable = true;

 environment.systemPackages = with pkgs; [
  vim
  wget
  git
  swaybg
  kitty
  waybar
  everforest-cursors 
 ];

programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };


  services.openssh.enable = true;

fonts.packages = with pkgs; [
	nerd-fonts.jetbrains-mono
];
nix.settings.experimental-features = [ "nix-command" "flakes" ];

system.stateVersion = "26.05";

}

