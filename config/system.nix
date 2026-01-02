{config, ...}:
{
# 	boot.loader.systemd-boot.enable = true;
	boot.loader = {
		grub = {
			enable = true;
			useOSProber = true;
			devices = [ "nodev" ];
			efiSupport = true;
			configurationLimit = 5;
		};
		efi.canTouchEfiVariables = true;
	};

	networking = {
		hostName = "nixos"; # Define your hostname.
			firewall.enable = false;
		networkmanager.enable = true;
	};

	time.timeZone = "Europe/Berlin";

	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "de_DE.UTF-8";
		LC_IDENTIFICATION = "de_DE.UTF-8";
		LC_MEASUREMENT = "de_DE.UTF-8";
		LC_MONETARY = "de_DE.UTF-8";
		LC_NAME = "de_DE.UTF-8";
		LC_NUMERIC = "de_DE.UTF-8";
		LC_PAPER = "de_DE.UTF-8";
		LC_TELEPHONE = "de_DE.UTF-8";
		LC_TIME = "de_DE.UTF-8";
	};

# If I use flake.nix to call this configuration.nix, it doesn't matter what I have written here (I think at least)
	system.stateVersion = "25.11";

# Add Swapfile of 8GB
 swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 8*1024;
  } ];
}
