{
  pkgs,
  home-manager,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../modules/nixos/xfce.nix
    ../../modules/nixos/sway.nix
    ../../modules/nixos/zen.nix
    # ../../modules/nixos/greetd.nix
    ../../modules/nixos/noctalia.nix
    # ../../modules/nixos/sddm.nix
  ];

  home-manager.users.amir = import ./home.nix;

  networking.hostName = "nixos-vm";

  services.qemuGuest.enable =  true;
  services.spice-vdagentd.enable = true;

  environment.systemPackages = with pkgs; [
    spice-vdagent
  ];

  system.stateVersion = "26.05";
}
