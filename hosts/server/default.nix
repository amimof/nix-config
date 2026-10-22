{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  home-manager,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../modules/podman.nix
    home-manager.nixosModules.home-manager
  ];

  home-manager.users.amir = import ./home.nix;

  networking.hostName = "server";

  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "26.05";
}
