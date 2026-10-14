{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./alacritty.nix
    # ./nvim
    # ./tmux
    # ./themes.nix
    ./kitty.nix
  ];

  options.my.dotfilesDir = lib.mkOption {
    type = lib.types.path;
    default = "${config.home.homeDirectory}/Projects/github.com/amimof/dotfiles";
  };


  config = {

    home = {
      packages = with pkgs; [
        gcc
        jq
        yq-go
        rustup
        go
        fd
      ];
    };

  };

}
