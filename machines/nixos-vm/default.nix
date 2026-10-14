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
    ../../modules/sddm.nix
    home-manager.nixosModules.home-manager
  ];

  home-manager.users.amir = import ./home.nix;

  networking.hostName = "nixos-vm";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.pipewire.enable = false;
  # services.displayManager = {
  #  sddm = {
  #    enable = true;
  #    wayland.enable = false;
  #    theme = "catppuccin-mocha-mauve";
  #    package = pkgs.kdePackages.sddm;
  #  };
  #  defaultSession = "xfce";
  # }; 
  services.qemuGuest.enable =  true;
  services.spice-vdagentd.enable = true;

  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
      font = "Noto Sans";
      fontSize = "9";
      loginBackground = true;
    })
    spice-vdagent
  ];
  system.stateVersion = "26.05";
}
