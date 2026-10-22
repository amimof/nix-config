{
  lib,
  pkgs,
  inputs,
  ...
}:
{
	dotfiles.links.".config/environment.d/common.conf" = "/environment.d/dot-config/environment.d/common.conf";
}
