{
  imports = [./languages/ts.nix];

  # List of languages to enable formatting and LSP support for
  vim.languages = {
    # What to enable
    enableDAP = true;
    enableExtraDiagnostics = true;
    enableFormat = true;
    enableLSP = true;
    enableTreesitter = true;

    # Languages to enable it for
    assembly.enable = true;
    bash.enable = true;
    clang.enable = true;
    csharp.enable = true;
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
    # ts = {
    # 	enable = true;
    # 	extensions.ts-error-translator.enable = true;
    # };
    yaml.enable = true;
  };
}
