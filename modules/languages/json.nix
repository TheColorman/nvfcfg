{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) getExe;
in {
  vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [json jsonc];

    lsp.lspconfig.sources.jsonls = ''
      local json_capabilities = vim.lsp.protocol.make_client_capabilities()
      json_capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- jsonls setup
      lspconfig.jsonls.setup {
        capabilities = json_capabilities;
        on_attach = default_on_attach;
        cmd = {
          "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server",
          "--stdio"
        },
      }
    '';

    formatter.conform-nvim.setupOpts = {
      formatters_by_ft.json = ["prettierd"];
      formatters."prettierd".command = getExe pkgs.prettierd;
    };
  };
}
