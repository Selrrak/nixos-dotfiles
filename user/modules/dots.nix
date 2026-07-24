{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/user/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    kitty = "kitty";
    waybar = "waybar";
    hyprland = "hypr";
    ranger = "ranger";
    tmux = "tmux";
    wlogout = "wlogout";
    zathura = "zathura";
  };
in
{
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;
}

