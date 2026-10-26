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

  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.pipewire.enable = false;

  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
      font = "Noto Sans";
      fontSize = "9";
      loginBackground = true;
    })
  ];
}
