{ pkgs, ... }:

{
  home.packages = with pkgs; [
    atool
    unzip
    hyprpolkitagent
    gamescope
    appimage-run
    texliveFull
    waybar
    kitty
    ranger
    bluetui
    calcurse
    btop
    hyprpaper
    hyprlock
    nitch
    impala
    gcc
    swaybg
    grim
    slurp
    vesktop
    wiremix
    wmenu
    fuzzel
    wl-clipboard
    wlogout
    tmux
    teams-for-linux
    libreoffice
    zathura
    imv
  ];
}

