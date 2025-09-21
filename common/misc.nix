{ config, pkgs, ... }:
{

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };  
  nixpkgs.config.allowUnfree = true;
  console.keyMap = "fr";

  services.printing.enable = true;

  services.flatpak.enable = true;
  # sound
  services.pipewire = {
     enable = true;
     pulse.enable = true;
  };

  hardware.bluetooth.enable = true; 
  hardware.bluetooth.powerOnBoot = true; 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
}