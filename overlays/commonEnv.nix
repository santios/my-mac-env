inputs:
final: prev:
{
  commonEnv = with final; prev.buildEnv {
    name = "commonEnv";
    paths = [
      # Basics
      jq
      gitFull
      tree
      curl
      wget
      zshWithConfig
      myVSCode
      # Nix
      nixpkgs-fmt
    ];
  };
}
