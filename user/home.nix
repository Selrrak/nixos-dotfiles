{ ... }:

{
	home.username = "selrak";

	home.homeDirectory = "/home/selrak";

	home.stateVersion = "26.05";

  imports = [
    ./modules/dots.nix
    ./modules/packages.nix
    ./modules/neovim.nix
    ./modules/shells.nix
    ./modules/theming.nix
    ./modules/git.nix
    ./modules/notifications.nix
    ./modules/idling.nix
  ];

}

