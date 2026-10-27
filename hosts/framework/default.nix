{
	inputs,
  pkgs,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../modules/nixos/niri.nix
    ../../modules/nixos/zen.nix
    ../../modules/nixos/noctalia.nix
    ../../modules/nixos/bat.nix
    ../../modules/nixos/dolphin.nix
    ../../modules/nixos/environment.d.nix
    ../../modules/nixos/zsh.nix
    ../../modules/nixos/kitty.nix
    ../../modules/nixos/starship.nix
    ../../modules/nixos/neovim.nix
    ../../modules/nixos/git.nix
    ../../modules/nixos/gtk.nix
    ../../modules/nixos/ollama.nix
    ../../modules/nixos/virtualisation.nix
		inputs.nixos-hardware.nixosModules.framework-intel-core-ultra-series3
  ];

  networking.hostName = "amirs-fw13pro";

  boot.plymouth.logo = "${pkgs.nixos-icons}/share/icons/hicolor/48x48/apps/nix-snowflake-white.png";

	swapDevices = [{
		device = "/var/lib/swapfile";
		size = 1024 * 16;
	}];

	systemd.sleep.settings.Sleep = {
		HibernateDelaySec = "1h";
	};

	qt.enable = true;

  fonts.packages = with pkgs; [
		nerd-fonts.fira-code
		nerd-fonts.ubuntu
    nerd-fonts.symbols-only
  ];

  environment.systemPackages = with pkgs; [
    neovim
    eza
    fzf
		tree-sitter
		ripgrep
		rbw
		pinentry-qt
		darkly
		ddcutil
    slack
		brightnessctl
		kubectl
		kubectx
		kubecolor
		libreoffice
		talosctl
		seahorse
		drawio
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
