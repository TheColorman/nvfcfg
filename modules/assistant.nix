{config, ...}: let
  cmp = config.vim.autocomplete.nvim-cmp;
in {
  vim.assistant.copilot = {
    enable = true;
    cmp.enable = cmp.enable;
  };
}
