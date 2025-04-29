{
  config,
  pkgs,
  ...
}: {
  home = {
    file = {
      ".local/bin/updoot" = {
        executable = true;
        text = import ./bin/updoot.nix {inherit pkgs;};
      };
    };

    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];
  };
}
