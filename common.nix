
{ config, lib, pkgs, ... }:
{

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Paris";
  boot.kernelPackages = pkgs.linuxPackages_6_16;

  #i18n.defaultLocale = "en_US.UTF-8"; 
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
  hardware.nvidia.open = false;
  services.xserver = {
     xkb.layout = "fr";
     videoDrivers = [ "nvidia" ];
     displayManager.gdm.enable = true;
     desktopManager.gnome.enable = true;
     
  };
  
  console.keyMap = "fr";

  services.printing.enable = true;
  services.flatpak.enable = true;

  services.pipewire = {
     enable = true;
     pulse.enable = true;
  };

  hardware.bluetooth.enable = true; 
  hardware.bluetooth.powerOnBoot = true; 

  environment.systemPackages = with pkgs; [ 
    niv
    libreoffice-qt
    hunspell 
    hunspellDicts.en_US
    hunspellDicts.fr-any
    vlc
    thunderbird
    discord
    transmission_4-gtk
 ];


 programs.zsh.enable = true;

 nix.settings.experimental-features = [ "nix-command" "flakes" ];

 time.hardwareClockInLocalTime = true;


  users.users.ilies = {
     isNormalUser = true;
     hashedPassword = "$6$jaimelesel$US9cOM.CbUPokYi8iL.XlmudtzegvzSdM7loFYcu4FXK9HCRLnyQjVw.JJSlh3WsCqEzRzB.3Xzn/vezLVgPr."; 
     packages = with pkgs; [
       tree
       zsh
     ];
     shell = pkgs.zsh;
     extraGroups = [ 
        "wheel"
        "libvirtd" 
        "docker"
      ];
  };

  virtualisation.docker = {
    enable = true;
  };

  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
  };
    

 system.stateVersion = "25.05"; # DO NOT TOUCH

}

