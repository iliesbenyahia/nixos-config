# My NixOS Config

<p align="center">
  <img src="./nixos-config.png" alt="NixOS Config" width="500"/>
</p>

## Overview

This repository contains my personal NixOS configuration, managed with **flakes**.  
I use it to manage multiple machines at home — including my wife's PC.

## Secrets Management

I use [sops-nix](https://github.com/Mic92/sops-nix) to securely manage secrets, such as user passwords, directly within the NixOS configuration.
This ensures a fully declarative setup while keeping secrets encrypted.

I used `sops-nix` with [age](https://github.com/FiloSottile/age). I generated a public and private key pair. 
The private key must be placed in /etc/age/keys.txt for sops-nix to be able to decrypt my configuration secrets.
The corresponding public key must be written into a `.sops.yaml` file

In order to create/edit the secret, use these commands :

```bash
cd /etc/nixos
nix-shell -p sops
sops secrets/secrets.yaml 
```

It will open your default text editor and you will be able to create/edit a yaml file containing your secrets (key: value, where value is your secret value). `.sops.yaml` must be at the root of the folder where you're executing ``sops. It contains the appropriate rule in my case to create or edit any yaml files in the secret folder of this repo. 


## How to deploy one of my configurations ? 

To deploy one of the flake's configurations, use these commands :
```bash
cd /etc/nixos
sudo nixos-rebuild switch --flake .#hostname
# For instance, in my case
sudo nixos-rebuild switch --flake .#ilies-pc
```

`#hostname` value is not mandatory, and by default it will use your hostname.


 

