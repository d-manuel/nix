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

#  # Enable the X11 windowing system.
#  services.xserver = { 
#	  enable = true;
#	  displayManager.gdm = {
#		  enable = true;
#		  wayland = false;
#	  };
#	  desktopManager.gnome.enable = true;
#  };
#
#  # Enable automatic login for the user.
# services.displayManager.autoLogin.enable = true;
# services.displayManager.autoLogin.user = "manuel";
#
#  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
#  systemd.services."getty@tty1".enable = false;
#  systemd.services."autovt@tty1".enable = false;


  # Configure keymap in X11
  # Doesnt work under gnome. Just configure it with the GUI for now
  # services.xserver.xkb= {
  #   layout = "eu";
  #   # xkbOptions="eu";
  #   # variant = "";
  # };

  # Set key repeat rate
  # services.xserver.displayManager.sessionCommands = ''
  #   setxkbmap -layout us -option ctrl:nocaps
  # '';

  # services.xserver.displayManager.sessionCommands = ''
  #   xset r rate 100
  # '';
# services.xserver.displayManager.sessionCommands = ''
#   ${pkgs.xorg.xset}/bin/xset r rate 200
# '';
#
# systemd.user.services.keyrepeat = {
#   description = "set the keyrpeat to 200";
#   serviceConfig.PassEnvironment = "DISPLAY";
#   script = ''
#     ...
#   '';
#   wantedBy = [ "multi-user.target" ]; # starts after login
# }
# systemd.user.services.keyrepeat = {
#   script = ''
#     xset r rate 200
#   '';
#   wantedBy = [ "graphical-session.target" ];
#   partOf = [ "graphical-session.target" ];
# };
  

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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
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
