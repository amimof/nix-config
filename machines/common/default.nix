
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
    ];

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;

    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    plymouth.enable = true;

    # Start plymouth with a quiet boot
    consoleLogLevel = 3;
    initrd.verbose = false;

    kernelParams = [
      "quiet"
      "splash"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    initrd.systemd.enable = true;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };


  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."amir" = {
    isNormalUser = true;
    description = "Amir Mofasser";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    # shell = "zsh";
    shell = pkgs.zsh;
  };

  # Enable some nix features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # inputs.zen-browser.packages.x86_64-linux.default

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    curl
    vim
    kitty
    kubectl
    kubectx
    spotify
    protonmail-desktop
    nerd-fonts.fira-code
    firefox
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # programs.niri.enable = true;

  programs.neovim.enable = true;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableLsColors = true;
  };
  programs.starship.enable = true;
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      pull.rebase = true;
      user.name = "amimof";
      user.email = "amimof@users.noreply.github.com";
    };
  };
  # List services that you want to enable:
  services = {
    snapper = {
      configs.home = {
        SUBVOLUME = "/home";
	FSTYPE = "btrfs";
	ALLOW_USERS = [ "amir" ];
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = 7;
        TIMELINE_LIMIT_WEEKLY = 4;
        TIMELINE_LIMIT_MONTHLY = 6;
        TIMELINE_LIMIT_YEARLY = 1;
      };
      persistentTimer = true;
    };

    btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = [ "/" ];
    };
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
