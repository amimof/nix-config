{ 
  pkgs,
  config,
  inputs,
  ...
}:
{ 

  environment.systemPackages = with pkgs; [
    walker
  ];

	systemd.user.services.walker = {
		enable = true;
		after = [ "graphical-session.target" ];
		wantedBy = [ "graphical-session.target" ];
		description = "Walker gapplication service";
		path = [ pkgs.elephant ];
		serviceConfig = {
				Type = "simple";
				ExecStart = "${pkgs.walker}/bin/walker --gapplication-service";
        Restart = "on-failure";
		};
	};

	dotfiles.links.".config/walker" = "/walker/dot-config/walker";
}
