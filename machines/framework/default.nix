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
    home-manager.nixosModules.home-manager
  ];

  home-manager.users.amir = import ./home.nix;

  networking.hostName = "amirs-fw13pro";

  services.niri.enable = true;
  services.pipewire.enable = true;
  services.displayManager = {
   sddm = {
     enable = true;
     wayland.enable = true;
   };
   defaultSession = "niri";
  }; 

  environment.systemPackages = with pkgs; [
    niri
    xwayland-satellite
    walker
  ];

  system.stateVersion = "26.05";
}
