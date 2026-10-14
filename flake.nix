{
  description = "amimof nix configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Dotfiles
    dotfiles = {
      url = "github:amimof/dotfiles";
      flake = false;
    };
    
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      # forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            (final: prev: {
              unstable = import inputs.nixpkgs-unstable {
                config.allowUnfree = true;
                system = prev.system;
              };
            })
          ];
        }
      );
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        nixos-vm = lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit home-manager;
          };
          modules = [ ./machines/nixos-vm ];
        };
      };
    };
}
