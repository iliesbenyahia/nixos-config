{ config, pkgs, lib, ... }:
{

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "arrow";
      plugins = [
        "git"
        "kubectl"
        "argocd"
        "helm"
        "kube-ps1"
      ];
    };
    initContent = lib.mkOrder 1200 ''
        PROMPT='$(kube_ps1)'$PROMPT
    '';
    shellAliases = {
      k = "kubectl";
      kns = "kubens";
      kctx = "kubectx";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    enableGitIntegration = true;   
    themeFile = "Spacedust";
    extraConfig = builtins.readFile ./dotfiles/kitty/kitty.conf;  
  };

}
