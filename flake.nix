{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    flake-utils,
    ...
  } @ inputs: (flake-utils.lib.eachDefaultSystem (
    system: let
      pkgs = nixpkgs.legacyPackages.${system};

      mkNvim = config:
        (nvf.lib.neovimConfiguration {
          inherit pkgs;
          extraSpecialArgs = {parentInputs = inputs;};
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
}
