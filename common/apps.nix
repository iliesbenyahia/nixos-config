{ config, pkgs, lib, ... }:
{

  environment.systemPackages = with pkgs; [ 
    libreoffice-qt
    hunspell 
    hunspellDicts.en_US
    hunspellDicts.fr-any
    pkgs.onlyoffice-desktopeditors
    vlc
    thunderbird
    discord
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
  builtins.elem (lib.getName pkg) [ "corefonts" ];

  fonts.fonts = with pkgs; [
    corefonts
  ];

}