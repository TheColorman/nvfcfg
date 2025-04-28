{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) getExe;
  inherit (lib.nvim.dag) entryAfter;
  inherit (lib.attrsets) genAttrs;

  inherit
    ((pkgs.callPackage ./typescript-plugin/default.nix {
      inherit pkgs;
      inherit (pkgs.stdenv.hostPlatform) system;
      nodejs = pkgs.nodejs_22;
    }))
    nodeDependencies
    ;
in {
  vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [vue tsx javascript];

    lsp.lspconfig.sources.ts-lsp = ''
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          attach_keymaps(client, bufnr);
          client.server_capabilities.documentFormattingProvider = false;
        end,
        cmd = {"${getExe pkgs.typescript-language-server}", "--stdio"},
        -- Vue support
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = '${nodeDependencies}/lib/node_modules/@vue/typescript-plugin',
              languages = { 'vue' },
            },
        },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      }
    '';

    formatter.conform-nvim = {
      setupOpts = {
        formatters_by_ft =
          genAttrs
          ["typescript" "javascript" "javascriptreact" "typescriptreact" "vue"]
          (_: ["prettierd"]);
        formatters.prettierd.command = getExe pkgs.prettierd;
      };
    };

    diagnostics.nvim-lint = {
      linters_by_ft =
        genAttrs
        ["typescript" "javascript" "javascriptreact" "typescriptreact" "vue"]
        (_: ["eslint_d"]);
    };
    # This is the only way to set the path apparently
    pluginRC.eslint_cmd_override = entryAfter ["nvim-lint"] ''
      local nvim_lint_eslint_d = require('lint').linters.eslint_d
      nvim_lint_eslint_d.cmd = "${getExe pkgs.eslint_d}";
    '';
  };
}
