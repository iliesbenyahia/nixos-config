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
   };

   time.timeZone = "Europe/Paris";
  
}