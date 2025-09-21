
{ config, lib, pkgs, ... }:
{
  imports =
  [ 
    ./hardware-configuration.nix
  ];

  networking.hostName = "ilies-pc";

  i18n.defaultLocale = "en_US.UTF-8"; 

  programs.zsh.enable = true;

  system.stateVersion = "25.05"; 

}

