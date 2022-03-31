inputs:
let
  inherit (inputs) zsh-syntax-highlighting pure;
  syntax-highlighting = "${zsh-syntax-highlighting}/zsh-syntax-highlighting.zsh";
in
final: prev:
{
  zshWithConfig =
    prev.buildEnv {
      name = "zshWithConfig";
      buildInputs = [ prev.makeWrapper ];
      paths = [ final.zsh ];
      postBuild = ''
        unlink "$out/bin"
        mkdir -p "$out/bin"
        for path in "${final.zsh}"/bin/*; do
          bin=$(basename "$path")
          makeWrapper "$path" "$out/bin/$bin" --set ZDOTDIR "${../config/zsh}" --set PLUGINS "${syntax-highlighting}"
        done
      '';
    };
}
