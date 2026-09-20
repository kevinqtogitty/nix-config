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
          nix.enable = false;
      	  system.configurationRevision = self.rev or self.dirtyRev or null;
          programs.zsh.enable = true;
          programs.zsh.enableSyntaxHighlighting = true;
          system.stateVersion = 5;

          # FIX: This line maps your macOS user account directly to nix-darwin's environment
          nixpkgs.config.allowUnfree = true;
          system.primaryUser = "kevin.to";
          users.users."kevin.to".home = "/Users/kevin.to";

          environment.systemPackages = [
            (pkgs.writeShellScriptBin "gortex" ''
              exec /Users/kevin.to/other-repos/gortex-native-patch/gortex "$@"
            '')
          ];

          homebrew = {
            enable = true;
            taps = [
              "zzet/tap"
            ];
            casks = [
              "pycharm"
              "sequel-ace"
            ];
          };

          launchd.user.agents.gortex = {
            serviceConfig = {
              ProgramArguments = [
                "/Users/kevin.to/other-repos/gortex-native-patch/gortex"
                "daemon"
                "start"
                "--tools=readonly"
                "--http-addr"
                "127.0.0.1:7411"
              ];
              RunAtLoad = true;
              KeepAlive = true;
              ProcessType = "Background";
              StandardOutPath = "/Users/kevin.to/.gortex/cache/launchd.stdout.log";
              StandardErrorPath = "/Users/kevin.to/.gortex/cache/launchd.stderr.log";
            };
          };
       })
      ];
    };
  };
}
