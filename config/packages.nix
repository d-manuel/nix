  {config, pkgs, ...}:
  {

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flatpak support
  services.flatpak.enable = true;

  # Install docker
  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.manuel.packages = with pkgs; [
      alacritty
      bat
      brave
      cryptomator
      celluloid
      fzf
      flameshot
      gcc
      gh #Github CLI
      gparted
      lazygit
      libreoffice-qt6-fresh
      localsend
      neovim
      obsidian
      pcloud
      ranger
      ripgrep
      rofi
      redshift
      thunderbird
      tldr
      trash-cli
      tor-browser
      unzip
      vivaldi
      wezterm
      xclip
      xfce.thunar
      yazi
      zoxide
    ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    htop
    neovim
    wget
    nixfmt-rfc-style
    python3
    #python3Packages.pip
  ];

}

