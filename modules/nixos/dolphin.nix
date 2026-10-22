
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.qt6ct
    tela-icon-theme
    darkly
  ];

  environment.etc."xdg/qt6ct/qt6ct.conf".text = ''
		[Appearance]
    color_scheme_path=/home/amir/.config/qt6ct/colors/noctalia.conf
		custom_palette=true
		icon_theme=Tela
		standard_dialogs=default
		style=Darkly

		[Fonts]
		fixed="Hack,10,-1,7,400,0,0,0,0,0,0,0,0,0,0,1,,0,0"
		general="Ubuntu Nerd Font Propo,10,-1,0,400,0,0,0,0,0,0,0,0,0,0,1,,0,0"
  '';

	dotfiles.links.".config/dolphinrc" = {
		source = "/dolphin/dot-config/dolphinrc";
		mutable = true;
	};
}
