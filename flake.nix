{
  description = "My mac setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    #zsh plugins
    zsh-syntax-highlighting = {
      url = "github:zsh-users/zsh-syntax-highlighting";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachSystem [ "aarch64-darwin" ] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          inherit overlays;
          config = {
            allowUnfree = true;
          };
        };
        overlays = map
          (name: import (./overlays + "/${name}") inputs)
          (builtins.attrNames (builtins.readDir ./overlays));
      in
      {
        defaultPackage = pkgs.myMacEnv;
      }
    );
}
