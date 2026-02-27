{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    zsh
    wezterm
    tmux
    zed-editor
    github-copilot-cli
    fastfetch
    docker
    docker-compose
    base16-shell-preview
    gitmoji-cli
    stow
    starship

    # Languages
    nodejs
    python3
    ruby
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
  ];

  environment.variables = {
    EDITOR = "zed-editor";
    SUDO_EDITOR = "vim";
    ZED_ALLOW_ROOT = "true";
  };

  programs.zsh.enable = true;
}
