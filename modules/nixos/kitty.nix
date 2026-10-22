{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kitty
  ];
	dotfiles.links.".config/kitty" = "/kitty/dot-config/kitty";
}
