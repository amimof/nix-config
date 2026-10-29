{ ... }:
{
  # QEMU/KVM + libvirt
  virtualisation.libvirtd.enable = true;

  # Graphical VM manager
  programs.virt-manager.enable = true;

  # Allow your user to manage virtual machines
  users.users.amir.extraGroups = [ "libvirtd" ];

  # USB redirection for SPICE guests
  virtualisation.spiceUSBRedirection.enable = true;

	# Containers
	virtualisation.podman = {
		enable = true;
		dockerCompat = true;
		defaultNetwork.settings.dns_enabled = true;
	};

  networking.nat = {
    enable = true;
    internalInterfaces = [ "ve-+" ];
    externalInterface = "wlp0s20f3";
  };


	# Isolated agent container runs OpenCode. We also need claude code because the opencode-with-claude plugin requires it.
  # TODO: Create a module out of this intead of having it here in this flake.
  containers.opencode = {
    autoStart = false;
    privateNetwork = true;
    hostAddress = "192.168.100.1";
    localAddress = "192.168.100.2";

    bindMounts = {
      "/workspace" = {
        hostPath = "/home/amir/Projects/";
        isReadOnly = false;
      };
    };

    config = { config, pkgs, lib, ... }: {
      system.stateVersion = "26.05";
      networking.useHostResolvConf = lib.mkForce false;
      services.resolved.enable = true;
			programs.nix-ld.enable = true;
      users.users.agent = {
        isNormalUser = true;
        home = "/home/agent";
        extraGroups = [ ];
      };

			networking.firewall.allowedTCPPorts = [ 3456 ];

			nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
				"claude-code"
			];

			nix.settings.experimental-features = [
				"nix-command"
				"flakes"
			];

      environment.systemPackages = with pkgs; [
        git
        gnumake
        go
        gopls
        nodejs
        ripgrep
        fd
        curl
        cacert
				vim
				lsof
				net-tools
				claude-code
				opencode
      ];
    };
  };


}
