{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # Used only for kitty-scrollback.nvim

    flake-utils.url = "github:numtide/flake-utils";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = {
    nixpkgs,
    unstable,
    nvf,
    flake-utils,
    ...
  }: (flake-utils.lib.eachDefaultSystem (
    system: let
      pkgs = nixpkgs.legacyPackages.${system};
      unstable-pkgs = unstable.legacyPackages.${system};

      mkNvim = modules:
        (nvf.lib.neovimConfiguration {
          inherit pkgs modules;
          extraSpecialArgs = {inherit unstable-pkgs;};
        })
        .neovim;

      sources = rec {
        default = nvim;
        nvim = ./configurations/default.nix;
        qwerty = ./configurations/qwerty.nix;
      };
    in {
      packages = builtins.mapAttrs (_: value: mkNvim [value]) sources;
      override =
        builtins.mapAttrs (_: value: config: mkNvim [value config])
        sources;
    }
  ));

  nixConfig = {
    extra-substituters = ["https://colorman.cachix.org"];
    extra-trusted-public-keys = ["colorman.cachix.org-1:HbmIr3Upj+ghnP8EYogEn73eCUSDeFBJ+JoItkw8EbQ="];
  };
}
