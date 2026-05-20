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
         ../nixos-configuration.nix
         ../shared.nix
      ];
    };

    darwinConfigurations.KevinToMBP = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        # 1. Pull in your shared configuration file directly
        ../shared.nix

        # 2. Hardcode your Mac's system settings right here
        ({ pkgs, ... }: {
      	  system.configurationRevision = self.rev or self.dirtyRev or null;
          programs.zsh.enable = true;
          programs.zsh.enableSyntaxHighlighting = true;
          system.stateVersion = 5;

          # FIX: This line maps your macOS user account directly to nix-darwin's environment
          users.users."kevin.to".home = "/Users/kevin.to";
       })
      ];
    };
  };
}
