{inputs, ...}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;

    config = {
      frameless = true;
    };

    discord.enable = true;
    vesktop.enable = false;
  };
}
