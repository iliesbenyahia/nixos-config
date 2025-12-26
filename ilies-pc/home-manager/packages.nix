{ config, pkgs, lib, ...}:
{
  home.packages = with pkgs; [
    jq
    gron
    yq
    kubectl
    argocd
    minikube
    kubernetes-helm
    wget
    curl
    kubectx
    prismlauncher
  ];
}