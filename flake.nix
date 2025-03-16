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

        mkNvim = config:
          (nvf.lib.neovimConfiguration {
            inherit pkgs;
            extraSpecialArgs = {inherit (self) outputs;};
            modules = [config];
          })
          .neovim;
      in {
        packages = {
          nvim = mkNvim ./configurations/main.nix;
          default = self.outputs.packages.${system}.nvim;

          qwerty = mkNvim ./configurations/qwerty.nix;
        };
        formatter = pkgs.alejandra;
      }
    ))
    // {
      modules = import ./modules {
        inherit (nixpkgs) lib;
      };
    };
}
