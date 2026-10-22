{
	config,
	lib,
	...
}:
{
	options.my.dotfilesDir = lib.mkOption {
		type = lib.types.path;
		default = "${config.home.homeDirectory}/Projects/github.com/amimof/dotfiles";
	};
}

