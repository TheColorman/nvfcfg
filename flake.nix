{
  inputs = {
    nvf.url = "github:notashelf/nvf";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    flake-utils,
  }:
    (flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = {
          nvim =
            (nvf.lib.neovimConfiguration {
              inherit pkgs;
              extraSpecialArgs = {inherit (self) outputs;};
              modules = [
                ./configurations/main.nix
              ];
            })
            .neovim;
          default = self.outputs.packages.${system}.nvim;
        };
        formatter = pkgs.alejandra;
      }
    ))
    // {
      modules = import ./modules {
        lib = nixpkgs.lib;
      };
    };
}
