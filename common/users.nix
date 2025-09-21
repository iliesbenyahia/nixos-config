{ config, inputs, pkgs, ... }:
{


  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/etc/age/keys.txt";

  sops.secrets."ilies/password" = { 
    neededForUsers = true;
  };

  sops.secrets."amelie/password" = { 
    neededForUsers = true;
  };
  
 users.mutableUsers = false;
 users.users.ilies = {
     isNormalUser = true;
     hashedPasswordFile =  config.sops.secrets."ilies/password".path;
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

   users.users.amelie = {
     isNormalUser = true;
     hashedPasswordFile =  config.sops.secrets."amelie/password".path;
     extraGroups = [ 
        "wheel"
      ];
  };
  
}