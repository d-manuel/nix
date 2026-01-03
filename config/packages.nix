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
      bat
      brave
      cryptomator
      celluloid
      fzf
      gcc
      gdu
      gh #Github CLI
      gparted
      lazygit
      localsend
      neovim
      obsidian
      pcloud
      ranger
      ripgrep
      teamspeak6-client
      tldr
      trash-cli
      tor-browser
      unzip
      wezterm
      xclip
      yazi
      zellij
      zoxide
    ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    htop
    wget
    nixfmt-rfc-style
    python3
    #python3Packages.pip
  ];

}

