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
      config = "cd ~/nixos-dotfiles/";
      freeze = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos";
		};
    initExtra = ''
    export PATH="$HOME/.local/bin:$PATH"
    nitch
    '';
	};
    
  xdg.configFile."river/init" = {
    source = ./config/river/init;
    executable = true;
  };

  xdg.configFile."kwm" = {
    source = create_symlink "${dotfiles}/kwm/";
    recursive = true;
  };

  xdg.configFile."nvim" = {
    source = create_symlink "${dotfiles}/nvim/";
    recursive = true;
  };

  xdg.configFile."foot" = {
    source = create_symlink "${dotfiles}/foot/";
    recursive = true;
  };

  home.file.".local/bin/screenshot" = {
    source = ./scripts/snip.sh;
    executable = true;
  };

	home.packages = with pkgs; [
    (pkgs.callPackage ./kwm.nix {})
    nitch
		neovim
		ripgrep
    river
		nil
		nixpkgs-fmt
		nodejs
		gcc
    swaybg
    grim
    slurp
    wmenu
    wl-clipboard
	];
}

