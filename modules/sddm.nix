{ pkgs, ... }:

let
  my-sddm-theme = pkgs.stdenv.mkDerivation {
    pname = "my-sddm";
    version = "1.0";

    src = ../sddm/my-sddm;

    installPhase = ''
      mkdir -p $out/share/sddm/themes/my-sddm
      cp -r ./* $out/share/sddm/themes/my-sddm/
    '';
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
    theme = "my-sddm";
    extraPackages = [ my-sddm-theme ];
  };
  services.displayManager.defaultSession = "xfce";

  environment.systemPackages = [
    my-sddm-theme
  ];
}
