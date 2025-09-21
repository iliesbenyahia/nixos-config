
{ config, lib, pkgs, ... }:
{
  imports =
  [ 
      ./hardware-configuration.nix
  ];

  networking.hostName = "amelie-pc";

  i18n.defaultLocale = "fr_FR.UTF-8"; 

  programs.zsh.enable = true;

  system.stateVersion = "25.05"; 

}

