_: {
  vim = {
    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableLSP = true;
      enableTreesitter = true;

      # Langs
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
      nix.enable = true;
      python = {
        enable = true;
        format.type = "ruff";
      };
      svelte.enable = true;
      tailwind.enable = true;
      ts = {
        enable = true;
        extensions.ts-error-translator.enable = true;
      };
      yaml.enable = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      lspSignature.enable = true;
      lspkind.enable = true;
      lsplines.enable = true;
      lspsaga.enable = true;
      nvim-docs-view.enable = true;
      otter-nvim.enable = true;
      trouble.enable = true;
    };

    notes.todo-comments.enable = true;

    options = {
      shiftwidth = 2;
      tabstop = 2;
    };

    searchCase = "smart"; # only searches containing uppercase will be case sensitive
    syntaxHighlighting = true;
    undoFile.enable = true;
    useSystemClipboard = true;
    bell = "on";
  };
}
