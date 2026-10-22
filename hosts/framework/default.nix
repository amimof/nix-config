{
  pkgs,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../modules/nixos/niri.nix
    ../../modules/nixos/zen.nix
    ../../modules/nixos/noctalia.nix
    ../../modules/nixos/elephant.nix
    ../../modules/nixos/walker.nix
    ../../modules/nixos/bat.nix
    ../../modules/nixos/dolphin.nix
    ../../modules/nixos/environment.d.nix
    ../../modules/nixos/zsh.nix
    ../../modules/nixos/kitty.nix
    ../../modules/nixos/starship.nix
    ../../modules/nixos/neovim.nix
    ../../modules/nixos/git.nix
    ../../modules/nixos/gtk.nix
  ];

  networking.hostName = "amirs-fw13pro";

  environment.systemPackages = with pkgs; [
    slack
  ];
  system.stateVersion = "26.05";
}
