
{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    bat
  ];

	dotfiles.links.".config/bat" = "/bat/dot-config/bat";
}
