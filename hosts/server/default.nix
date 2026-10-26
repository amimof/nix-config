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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
