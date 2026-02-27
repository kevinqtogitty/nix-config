{ pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  # Set your system state version
  system.stateVersion = 5;

  # Your username
  users.users.kevinto = {
    name = "kevinto";
    home = "/Users/kevinto";
  };
}
