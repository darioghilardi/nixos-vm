{
  description = "NixOS VM system flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-linux";

      pkgs = import nixpkgs {
        inherit system;
	config = { allowUnfree = true; };
      };
    in
      {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	    inherit system;
	    modules = [
	      ./configuration.nix
	    ];
      };
  };
}
