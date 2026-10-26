{
  pkgs,
  ...
}:
{
  # You can import other home-manager modules here
  imports = [
    ../../modules/home-manager/common.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/kubectl.nix
  ];

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
  ];

}
