{
  imports = [
    ./languages/json.nix
    ./languages/vue.nix
  ];

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
        format.type = ["nixfmt"];
      };
      python = {
        enable = true;
        format.type = ["ruff"];
      };
      svelte = {
        enable = true;
        extraDiagnostics.enable = false;
      };
      tailwind.enable = true;
      yaml.enable = true;
      rust.enable = true;
    };
  };
}
