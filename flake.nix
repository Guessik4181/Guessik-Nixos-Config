{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
        url = "github:nix-community/home-manager/release-26.05";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";

    };
      affinity-nix = {
      url = "github:mrshmllow/affinity-nix";
    };
    # ...
  };
  outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, stylix, nvf, nur, affinity-nix, ... }: let
    lib = nixpkgs.lib;
    # ---- SYSTEM SETTINGS ---- #
    commonSystemSettings = {
      system = "x86_64-linux";
      timezone = "Poland";
      locale = "pl.UTF-8";
    };
    pkgs = import nixpkgs {
    inherit (commonSystemSettings) system;
    config.allowUnfree = true;
    };
    pkgs-unstable = import nixpkgs-unstable {
    inherit (commonSystemSettings) system;
    config.allowUnfree = true;
    };

    # ---- USER SETTINGS ---- #
    userSettings = {
      username = "guessik";
      name = "Guessik";
      terminal = "kitty";
      browser = "firefox";
      editor = "kate";
      fileManager = "dolphin";
    };

    # ---- COMMON FUNCTION TO CREATE NIXOS SYSTEMS ----
    # This function defines all the common setup (Home Manager, Stylix, nvf)
    # and takes the hostname to make the configuration specific.
    mkNixosSystem = hostname:
      let
        systemSettings = commonSystemSettings // { inherit hostname; };
        nixosModules = [
          # Host-specific hardware configuration (e.g., ./nixos-desktop_configuration.nix)
          ./${hostname}_configuration.nix

          # Common UI and configuration modules
          stylix.nixosModules.stylix

          # Adds the NUR overlay
          nur.modules.nixos.default
          # NUR modules to import
#          nur.legacyPackages."${system}".repos.iopq.modules.xraya
          # This adds the NUR nixpkgs overlay.
          # Example:
          ({ pkgs, ... }: {
           nix.settings = {

# Use Flake & Nix Commands

experimental-features = ["nix-command" "flakes"];

substituters = [

"https://mirrors.ustc.edu.cn/nix-channels/store"

"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"

"https://nix-community.cachix.org"

"https://miyakomeow.cachix.org"

];

trusted-public-keys = [

"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="

"miyakomeow.cachix.org-1:85k7pjjK1Voo+kMHJx8w3nT1rlBow3+4/M+LsAuMCRY="

];

};
          })

          # Home Manager setup
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users."${userSettings.username}" = {
              imports = [
                ./home.nix
                # nvf manages neovim
                nvf.homeManagerModules.default
              ];
            };
            home-manager.extraSpecialArgs = {
              inherit systemSettings;
              inherit userSettings;
              inherit pkgs-unstable;
              pkgs-stable = pkgs-unstable;
            };
          }
        ];
      in lib.nixosSystem {
        modules = nixosModules;
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
        };
      };

  in {
    # ---- NIXOS CONFIGURATIONS (Now using the common function) ----
    nixosConfigurations = {
      guessik = mkNixosSystem "guessik";
    };
  };
}
