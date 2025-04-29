# This file defines overlays
{inputs}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev:
    import ../pkgs {
      pkgs = final;
      inherit inputs;
    };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = _final: prev: {
    broken = import inputs.nixpkgs {
      inherit (prev) system;
      config = prev.config // {allowBroken = true;};
    };

    ghostty = inputs.ghostty.packages.${_final.system}.default;
  };
}
