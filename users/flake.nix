{
  description = "Home manager flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "aarch64-linux";

      pkgs = import nixpkgs {
        inherit system;
	config = { allowUnfree = true; };
      };

    in
    {
      homeConfigurations = {
        nixos = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [
            ./modules/home.nix
            ./modules/git.nix
	    ./modules/fish.nix
	    ./modules/packages.nix
	    ./modules/starship.nix
	  ];
        };
      };
    };
}
