{
  description = "My system flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {

    nixosConfigurations.linux-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/desktop/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.moggel = import ./home.nix;
            backupFileExtension = "nxbackup";
          };
        }
      ];
    };

    nixosConfigurations.linux-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/laptop/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.moggel = import ./home.nix;
            backupFileExtension = "nxbackup";
          };
        }
      ];
    };
  };
}
