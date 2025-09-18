{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
  inherit (lib.meta) getExe;
  inherit (lib.attrsets) getBin;
in {
  # See https://github.com/sumrdev/nixcfg/blob/4c7c20d865056601c8ad788277b10f4691412c55/modules/programs/nvim.nix#L45-L93
  vim.lsp.servers.vtsls = {
    enable = true;

    capabilities = mkLuaInline "capabilities";
    on_attach = mkLuaInline ''
      function(client)
        if vim.bo.filetype == 'vue' then
          client.server_capabilities.semanticTokensProvider.full = false
        else
          client.server_capabilities.semanticTokensProvider.full = true
        end
      end
    '';

    filetypes = [
      "typescript"
      "javascript"
      "javascriptreact"
      "typescriptreact"
      "vue"
    ];

    cmd = [
      "${getExe pkgs.vtsls}"
      "--stdio"
    ];

    settings = {
      typescript = {
        updateImportsOnFileMove.enabled = "always";
        tsserver.maxTsServerMemory = 8192;
      };
      vtsls = {
        enableMoveToFileCodeAction = true;
        experimental.completion.enableServerSideFuzzyMatch = true;

        tsserver = {
          globalPlugins = [
            {
              name = "@vue/typescript-plugin";
              location = "${getBin pkgs.vue-language-server}/lib/language-tools/packages/language-server";
              languages = ["vue"];
              configNamespace = "typescript";
            }
          ];
        };
      };
    };
  };
}
