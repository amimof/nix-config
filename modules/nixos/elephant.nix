
{ ... }:
{

  services.elephant = {
    enable = true;
  };

	dotfiles.links.".config/elephant" = "/elephant/dot-config/elephant";
}
