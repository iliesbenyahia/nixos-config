{ config, lib, pkgs, ... }:
{
  services.xserver = {
     xkb.layout = "fr";
     videoDrivers = [ "nvidia" ];
     displayManager.gdm.enable = true;
     desktopManager.gnome.enable = true;
     
  };
}