{
  outputs,
  lib,
  config,
  userConfig,
  pkgs,
  ...
}: {
  imports = [
    ./programs/bat.nix
    ./programs/direnv.nix
    ./programs/eza.nix
    ./programs/git.nix
    ./programs/nixvim.nix
    ./programs/starship.nix
    ./programs/zsh.nix
  ];

  fonts.fontconfig.enable = true;

  home = {
    username = "${userConfig.name}";
    homeDirectory = "/home/${userConfig.name}";

    packages = lib.attrValues {
      inherit
        (pkgs)
        alejandra
        darktable
        deadnix
        moonlight-qt
        nh
        spot
        statix
        trash-cli
        xdg-user-dirs
        zoom-us
        ;

      inherit
        (pkgs.luajitPackages)
        jsregexp
        ;

      inherit
        (pkgs.nodePackages_latest)
        prettier
        prettier_d_slim
        ;
    };

    shell.enableShellIntegration = true;
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.modifications
      outputs.overlays.additions
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
