{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    bat
    git
    zsh
    wezterm
    nerdfetch
    docker
    docker-compose
    base16-shell-preview
    gitmoji-cli
    stow
    starship
    cowsay
    ncurses
    delta
    postman
    tilt
    zed-editor
    _1password-cli
    _1password-gui
    obsidian
    ffmpeg

    # Plugins
    typescript-language-server
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

    # lang version manager
    pyenv

    # Build dependencies
    pkg-config
    libmysqlclient

    # AI Tools
    claude-code

    # Misc
    spotify
    direnv
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
  ];

  environment.variables = {
    EDITOR = "vim";
    SUDO_EDITOR = "vim";
  };

  programs.zsh.enable = true;
}
