{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./config/hardware-configuration.nix
    ./config/packages.nix
    ./config/system.nix
    ./config/session.nix
    ./config/gaming.nix
  ];
}
