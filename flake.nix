{
  description = "Flake for managing my host configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs_stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #noctalia = {
    #  url = "github:noctalia-dev/noctalia-shell";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = { self, nixpkgs, nixpkgs_stable, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      t14 = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { inherit nixpkgs_stable inputs; };
        
	    modules = [
          ./hosts/t14/configuration.nix
	      inputs.home-manager.nixosModules.default
          #./modules/noctalia.nix
        ];
      };

      xps = nixpkgs.lib.nixosSystem {
        inherit system;

	    specialArgs = { inherit nixpkgs_stable inputs; };

	    modules = [
	      ./hosts/xps/configuration.nix
	      inputs.home-manager.nixosModules.default
	    ];
      };
    };
  };
}
