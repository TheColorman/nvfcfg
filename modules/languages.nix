{
  pkgs,
  lib,
  ...
}: let
  # https://github.com/NixOS/nixpkgs/blob/743dcc211046b6bdd4587d44fc6502ea10bb2c69/pkgs/by-name/cs/csharp-ls/package.nix
  csharp-ls_0_17_0 = let
    inherit (pkgs) buildDotnetGlobalTool versionCheckHook;
    inherit (pkgs.dotnetCorePackages) sdk_8_0;
  in
    buildDotnetGlobalTool rec {
      pname = "csharp-ls";
      version = "0.16.0";

      nugetHash = "sha256-1uj0GlnrOXIYcjJSbkr3Kugft9xrHX4RYOeqH0hf1VU=";

      dotnet-sdk = sdk_8_0;
      dotnet-runtime = sdk_8_0;

      nativeInstallCheckInputs = [
        versionCheckHook
      ];
      versionCheckProgramArg = "--version";
      doInstallCheck = true;

      meta = {
        description = "Roslyn-based LSP language server for C#";
        mainProgram = "csharp-ls";
        homepage = "https://github.com/razzmatazz/csharp-language-server";
        changelog = "https://github.com/razzmatazz/csharp-language-server/releases/tag/v${version}";
        license = lib.licenses.mit;
        platforms = lib.platforms.unix;
        maintainers = with lib.maintainers; [GaetanLepage];
        badPlatforms = [
          # Crashes immediately at runtime
          # terminated by signal SIGKILL (Forced quit)
          # https://github.com/razzmatazz/csharp-language-server/issues/211
          "aarch64-darwin"
        ];
      };
    };
in {
  imports = [./languages/ts.nix];

  # List of languages to enable formatting and LSP support for
  vim = {
    lsp.enable = true;
    languages = {
      # What to enable
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      # Languages to enable it for
      assembly.enable = true;
      bash.enable = true;
      clang.enable = true;
      csharp = {
        enable = true;
        lsp.package = csharp-ls_0_17_0;
      };
      css.enable = true;
      html.enable = true;
      lua.enable = true;
      markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
      };
      nix = {
        enable = true;
        lsp = {
          server = "nil";
          # @TODO: For some reasons nvf does not support passing options to nil, only nixd?
          # options = {
          #   nix = {
          #     maxMemoryMB = 8192; # 8 GiB
          #     flake = {
          #       autoArchive = true;
          #       autoEvalInputs = true;
          #     };
          #   };
          # };
        };
      };
      python = {
        enable = true;
        format.type = "ruff";
      };
      svelte = {
        enable = true;
        extraDiagnostics.enable = false;
      };
      tailwind.enable = true;
      # NOTE: TS support manually set in ./languages/ts.nix due to missing Vue support in nvf
      # ts.enable = true;
      yaml.enable = true;
      rust.enable = true;
    };
  };
}
