  {config, pkgs, ...}:
  {
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flatpak support
  services.flatpak.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.manuel.packages = with pkgs; [
      alacritty
      bat
      bazecor
      celluloid
      flameshot
      gparted
      neovim
      ripgrep
      rofi
      thunderbird
      tldr
      trash-cli
      unzip
      xclip
      xfce.thunar
      zoxide
    ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    neovim
    wget
    nixfmt-rfc-style
    python3Full
    #python3Packages.pip
  ];
}

