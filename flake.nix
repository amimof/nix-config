{
  description = "amimof nix configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Noctalia
    noctalia = {
      # url = "github:noctalia-dev/noctalia";
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
    # Noctalia
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 

    # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

	  # Dotfiles
		dotfiles = {
			url = "github:amimof/dotfiles";
		};

		# flake.nix inputs
		nixos-hardware = {
			url = "github:NixOS/nixos-hardware/master";
		};
    
  };



  outputs =
    {
      self,
      nixpkgs,
			dotfiles,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        nixos-vm = nixpkgs.lib.nixosSystem {
          specialArgs = {
						inherit inputs;
          };
          modules = [ 
						./hosts/nixos-vm
					];
        };

        framework = nixpkgs.lib.nixosSystem {
					system = "x86_64-linux";
          specialArgs = {
						inherit inputs;
          };
          modules = [ 
						dotfiles.nixModules.default
						{ dotfiles.user = "amir"; }
						{ dotfiles.mutable = true; }
						./hosts/framework
					];
        };

        server = nixpkgs.lib.nixosSystem {
          specialArgs = {
						inherit inputs;
          };
          modules = [ 
						./hosts/server
					];
        };
      };
    };
}
