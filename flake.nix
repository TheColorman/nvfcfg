{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    flake-utils,
  }: (flake-utils.lib.eachDefaultSystem (
    system: let
      pkgs = nixpkgs.legacyPackages.${system};

      mkNvim = config:
        (nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [config];
        })
        .neovim;
    in {
      packages = {
        nvim = mkNvim ./configurations/main.nix;
        default = self.outputs.packages.${system}.nvim;

        qwerty = mkNvim ./configurations/qwerty.nix;
      };
    }
  ));

  nixConfig = {
    extra-substituters = ["https://colorman.cachix.org"];
    extra-trusted-public-keys = ["colorman.cachix.org-1:HbmIr3Upj+ghnP8EYogEn73eCUSDeFBJ+JoItkw8EbQ="];
  };
}
