{
  description = "gokulswam's nix config";

  outputs = {
    self,
    nixpkgs,
    home,
    ...
  } @ inputs: let
    inherit (self) outputs;

    users = {
      gokulswam = {
        email = "gokulswamilive@gmail.com";
        fullName = "Gokul Swami";
        name = "gokulswam";
      };
    };

    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
    ];

    # Function for NixOS system configuration
    mkNixosConfiguration = hostname: username:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs hostname;
          userConfig = users.${username};
          nixosModules = "${self}/modules/nixos";
        };

        modules = [
          ./hosts/${hostname}
          home.nixosModules.home-manager

          {
            home-manager = {
              backupFileExtension = "hm-back";

              extraSpecialArgs = {
                inherit inputs outputs;
                userConfig = users.${username};
                nhModules = "${self}/modules/home-manager";
              };

              users.${username}.imports = [(./. + "/home-manager/${username}/${hostname}/home.nix")];
            };
          }
        ];
      };
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    packages = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./pkgs {inherit pkgs inputs;}
    );

    # Devshell for bootstrapping
    devShells = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./shell.nix {inherit pkgs;}
    );

    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      framework = mkNixosConfiguration "framework" "gokulswam";
      homelab = mkNixosConfiguration "homelab" "gokulswam";
      nixos-wsl = mkNixosConfiguration "nixos-wsl" "gokulswam";
    };
  };

  inputs = {
    # Nixpkgs Repos
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";

    disko = {
      type = "github";
      owner = "nix-community";
      repo = "disko";
    };

    ghostty = {
      type = "github";
      owner = "ghostty-org";
      repo = "ghostty";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
    };

    home = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      type = "github";
      owner = "nix-community";
      repo = "nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      type = "github";
      owner = "nix-community";
      repo = "nix-vscode-extensions";
    };

    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
    };

    nixcord = {
      type = "github";
      owner = "kaylorben";
      repo = "nixcord";
    };

    nixgl = {
      type = "github";
      owner = "nix-community";
      repo = "nixGL";
    };

    nixpkgs-f2k = {
      type = "github";
      owner = "fortuneteller2k";
      repo = "nixpkgs-f2k";
    };

    nixos-wsl = {
      type = "github";
      owner = "nix-community";
      repo = "NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      type = "github";
      owner = "nix-community";
      repo = "nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      type = "github";
      owner = "danth";
      repo = "stylix";
    };

    vscode-server = {
      type = "github";
      owner = "nix-community";
      repo = "nixos-vscode-server";
    };

    # Other Non-flake Inputs
    sfmonoNerdFontLig-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };
  };
}
