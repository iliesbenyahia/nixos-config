{ config, pkgs, pkgs-unstable, ... }:
let 
    update-system = pkgs.writeShellApplication {
        name = "update-system";
        runtimeInputs = with pkgs; [
            nix-collect-garbage
            nixos-rebuild
        ];
        text = builtins.readFile ../scripts/updater.sh;
    };
in
{
    environment.systemPackages = [
        update-system
    ];
}