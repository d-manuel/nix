# Nix Module for session and services and user management

{config, pkgs,  ...}:
{
  
services.xserver = {  
	enable = true;  
	libinput.enable = true;  
	displayManager.lightdm.enable = true;  
	desktopManager = {  
		cinnamon.enable = true;  
	};  
	displayManager.defaultSession = "cinnamon";  
};

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Config Font:
  # fonts.fontconfig.enable = true;
  #nerdfonts
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
  ];



  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.manuel = {
    isNormalUser = true;
    description = "Manuel";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  # Set default editor env variable to vim
  environment.variables.EDITOR = "vim";
}
