{
  lib,
  pkgs,
  userConfig,
  ...
}: {
  programs.gh = {
    enable = true;

    extensions = lib.attrValues {
      inherit
        (pkgs)
        gh-cal
        gh-dash
        gh-eco
        ;
    };

    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      editor = "nvim";
    };
  };

  programs.git = {
    enable = true;
    userName = "${userConfig.name}";
    userEmail = "${userConfig.email}";

    extraConfig.core.editor = "nvim";
  };
}
