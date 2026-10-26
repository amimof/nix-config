{
  lib,
  pkgs,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  programs.niri.enable = true;
  services.pipewire = {
		enable = true;
		wireplumber.enable = true;
	};

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome   # screencast, screenshot, file chooser fallback
      pkgs.xdg-desktop-portal-gtk     # file chooser, notifications, "Access"
    ];
    configPackages = [ pkgs.niri ];   # installs niri-portals.conf
  };

  services.gnome.gnome-keyring.enable = true;  # Secret portal
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    niri
    xwayland-satellite
		wl-clipboard
  ];

	dotfiles.links.".config/niri" = "/niri/dot-config/niri";
}
