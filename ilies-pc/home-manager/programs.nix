{ config, pkgs, lib, ... }:
{
 programs.git = {
    enable = true;
    userEmail = "benyahia.ilies@gmail.com";
    userName = "ilies";
  };
  
  programs.firefox = {
  	enable = true;
   };

  programs.vscode = {
    enable = true;
  };

  programs.k9s.enable = true;
}
