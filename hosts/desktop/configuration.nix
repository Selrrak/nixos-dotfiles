{ config, lib, pkgs, ... }:

{
imports =
    [ 
    ./hardware-configuration.nix
    ./desktop_hardware.nix
    ./storage.nix

    ../../system/modules/virtualization.nix
    ../../system/modules/boot.nix
    ../../system/modules/networking.nix
    ../../system/modules/users.nix
    ../../system/modules/hyprland.nix
    ../../system/modules/gaming.nix
    ../../system/modules/audio.nix
    ];
nixpkgs.config.allowUnfree = true;



time.timeZone = "America/Montreal";


programs.firefox.enable = true;

 environment.systemPackages = with pkgs; [
  vim
  wget
  git
 rsync
 ];

programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };



fonts.packages = with pkgs; [
	nerd-fonts.jetbrains-mono
];



services.dbus.enable = true;



nix.settings.experimental-features = [ "nix-command" "flakes" ];

system.stateVersion = "26.05";

}

