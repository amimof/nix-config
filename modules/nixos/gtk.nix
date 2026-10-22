{ pkgs, ... }:
{
	dotfiles.links.".config/gtk-4.0" = {
    source = "/gtk/dot-config/gtk-4.0";
		mutable = true;
	};
}
