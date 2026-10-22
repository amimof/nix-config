{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
  ];
  programs.noctalia.enable = true;
  programs.noctalia.recommendedServices.enable = true;
  programs.noctalia.systemd.enable = true;

  services.displayManager.noctalia-greeter = {
    enable = true;
  };

	dotfiles.links.".config/noctalia" = "/noctalia/dot-config/noctalia";
}
