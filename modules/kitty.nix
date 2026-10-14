{
  pkgs,
  inputs,
  config,
  ...
}:
{
  xdg.configFile."kitty/".source = config.lib.file.mkOutOfStoreSymlink "${config.my.dotfilesDir}/kitty/dot-config/kitty";
}
