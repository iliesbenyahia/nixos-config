{ config, lib, pkgs, ... }:
{

   boot = {
    loader = {
        systemd-boot = {
            enable = true;
        };

        efi = {
            canTouchEfiVariables = true;
        };

   };
   kernelPackages = pkgs.linuxPackages_6_16;
   };

   time.timeZone = "Europe/Paris";
  
}