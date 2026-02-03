{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs_stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    pkgs_stable = inputs.nixpkgs_stable.legacyPackages.x86_64-linux;
  in
  {
    nixosConfigurations.t14 = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
	      unstable = nixpkgs.legacyPackages.x86_64-linux;
	      stable = inputs.nixpkgs_stable.legacyPackages.x86_64-linux;
      };
      modules = [
        ./hosts/t14/configuration.nix
	inputs.home-manager.nixosModules.default
      ];
    };
  };
}
