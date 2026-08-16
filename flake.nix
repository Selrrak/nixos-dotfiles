{
	description = "NixOS second try";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};		
    claude-code.url = "github:sadjow/claude-code-nix";
	};

	outputs = { self, nixpkgs, home-manager, claude-code, ... }: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./hosts/desktop/configuration.nix
        { nixpkgs.overlays = [ claude-code.overlays.default ]; }
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.selrak = import ./user/home.nix;
						backupFileExtension = "backup";
					};
				}
			];
		};
	};

}
