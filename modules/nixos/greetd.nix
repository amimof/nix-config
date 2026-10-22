{ pkgs, config, lib, ... }:
let
  sessionData = config.services.displayManager.sessionData;
in
{

  environment.etc."tuigreet/config.toml".source = ../../tuigreet/config.toml;

  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
	user = "greeter";
	command = ''
	  ${lib.getExe pkgs.tuigreet} \
	    --sessions ${sessionData.desktops}/share/wayland-sessions \
	    --xsessions ${sessionData.desktops}/share/xsessions  \
	'';
      };
    };
  };

  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
    home = "/var/lib/greeter";
    createHome = true;
  };

  users.groups.greeter = {};
}
