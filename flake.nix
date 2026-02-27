{
  description = "Base System";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, nix-darwin, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
	 ./nixos-configuration.nix
 	 ./shared.nix
      ];
    };

    darwinConfigurations.Kevins-MacBook-Air-2 = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
	 ./darwin-configuration.nix
	 ./shared.nix
      ];
    };
  };
}
