{config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
	home.username = "selrak";
	home.homeDirectory = "/home/selrak";
	programs.git = { 
    enable = true;
    settings = {
      user = {
      name = "Selrrak";
      email = "chbou602@ulaval.ca";
      };
    };
  };


	home.stateVersion = "26.05";
	programs.bash = {
		enable = true;
		shellAliases = {
      f = "nvim .";
      gti = "git";
      config = "cd ~/nixos-dotfiles/";
      freeze = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos";
      hypr = "start-hyprland";
		};
    initExtra = ''
    export PATH="$HOME/.local/bin:$PATH"
    nitch
    '';
	};
  home.sessionVariables = {
  EDITOR = "nvim";
  };
  xdg.configFile."nvim" = {
    source = create_symlink "${dotfiles}/nvim/";
    recursive = true;
  };
  xdg.configFile."kitty" = {
    source = create_symlink "${dotfiles}/kitty/";
    recursive = true;
  };
  xdg.configFile."waybar" = {
    source = create_symlink "${dotfiles}/waybar/";
    recursive = true;
  };
 xdg.configFile."hypr" = {
    source = create_symlink "${dotfiles}/hypr/";
    recursive = true;
  };
 xdg.configFile."ranger" = {
    source = create_symlink "${dotfiles}/ranger/";
    recursive = true;
 };
 xdg.configFile."wlogout" = {
    source = create_symlink "${dotfiles}/wlogout/";
    recursive = true;
 };
  home.file.".local/bin/screenshot" = {
    source = ./scripts/snip.sh;
    executable = true;
  };
 home.file.".local/bin/canticle" = {
    source = ./scripts/canticle;
    executable = true;
  };
 home.file.".local/bin/dev-run" = {
    source = ./scripts/dev-run;
    executable = true;
  };
	home.packages = with pkgs; [
    #basedpyright
    #ruff
    ranger
    bluetui
    calcurse
    btop
    hyprpaper
    hyprlock
    nitch
    impala
		neovim
		ripgrep
		nil
		nixpkgs-fmt
		nodejs
		gcc
    swaybg
    grim
    slurp
    vesktop
    wiremix
    wmenu
    wl-clipboard
    wlogout
    tmux
    teams-for-linux
    libreoffice
    zathura
   #nsxiv
	];
}

