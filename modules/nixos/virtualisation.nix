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

}
