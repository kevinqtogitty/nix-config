{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    bat
    git
    zsh
    wezterm
    tmux
    zed-editor
    github-copilot-cli
    nerdfetch
    docker
    docker-compose
    base16-shell-preview
    gitmoji-cli
    stow
    starship
    cowsay

    # Plugins
    nodePackages.typescript-language-server
    solargraph
    gopls

    # Vim Plugins
    vimPlugins.vim-plug

    # Telescope tools
    ripgrep
    fd
    fzf

    # ZSH plugins
    zsh-autosuggestions
    zsh-syntax-highlighting

    # Languages
    nodejs
    python3
    ruby
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
  ];

  environment.variables = {
    EDITOR = "zed-editor";
    SUDO_EDITOR = "vim";
    ZED_ALLOW_ROOT = "true";
  };

  programs.zsh.enable = true;
}
