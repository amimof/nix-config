{ ... }:
{
  programs.starship.enable = true;
	dotfiles.links.".config/starship.toml" = "/starship/dot-config/starship.toml";
}
