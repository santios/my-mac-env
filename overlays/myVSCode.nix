input:
final: prev:
{
  myVSCode = prev.vscode-with-extensions.override {
    vscodeExtensions = with final.vscode-extensions; [
      #arthurwhite.white
      bbenoist.nix
      dbaeumer.vscode-eslint
      eamodio.gitlens
      esbenp.prettier-vscode
      ms-azuretools.vscode-docker
    ] ++ final.vscode-utils.extensionsFromVscodeMarketplace [{
      name = "white";
      publisher = "arthurwhite";
      version = "1.3.6";
      sha256 = "9Pvzb29d13vgiU8DwasLUiyPVHK97RcnBA3f0q+4y/8=";
    }];
  };

  # myVSCode =
  #   prev.buildEnv {
  #     name = "myVSCode";
  #     buildInputs = [ prev.makeWrapper ];
  #     paths = [ final.codeWithExtensions ];
  #     postBuild = ''
  #       unlink "$out/bin"
  #       mkdir -p "$out/bin"
  #       for path in "${final.codeWithExtensions}"/bin/*; do
  #         bin=$(basename "$path")
  #         makeWrapper "$path" "$out/bin/$bin" --add-flags "--user-data-dir ${../config/zsh}"
  #       done
  #     '';
  #   };
}
