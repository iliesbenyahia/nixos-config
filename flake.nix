{
  description = "My nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    lanzaboote = {
        url = "github:nix-community/lanzaboote/v0.4.2";
        # Optional but recommended to limit the size of your system closure.
        inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, lanzaboote, sops-nix, ... }: 
  let 
    commonModules = [ sops-nix.nixosModules.sops ] ++ nixpkgs.lib.filesystem.listFilesRecursive ./common;
  in  
  {

    nixosConfigurations = {
      ilies-pc =  nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";

          specialArgs = let
            inherit system;
          in {
            # To use packages from nixpkgs-stable,
            # we configure some parameters for it first
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              # To use Chrome, we need to allow the
              # installation of non-free software.
              config.allowUnfree = true;
            };
          };

          modules = [
            lanzaboote.nixosModules.lanzaboote

            ({ pkgs, lib, ... }: {

              environment.systemPackages = [
                # For debugging and troubleshooting Secure Boot.
                pkgs.sbctl
              ];

              # Lanzaboote currently replaces the systemd-boot module.
              # This setting is usually set to true in configuration.nix
              # generated at installation time. So we force it to false
              # for now.
              boot.loader.systemd-boot.enable = lib.mkForce false;

              boot.lanzaboote = {
                enable = true;
                pkiBundle = "/var/lib/sbctl";
              };
            })
            
            ./ilies-pc/configuration.nix
            ./ilies-pc/nvidia.nix
            ./desktop-environments/kde.nix
        ] ++ commonModules ;
        };

        amelie-pc =  nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./amelie-pc/configuration.nix
            ./amelie-pc/nvidia.nix
            ./desktop-environments/kde.nix
          ] ++ commonModules ;
        };

        
    };
    
   

  };
}
