{ config, ... }: let
  cmp = config.vim.autocomplete.nvim-cmp;
in {
  vim.notes.obsidian = {
    enable = true;
    setupOpts = {
      completion.nvim_cmp = cmp.enable;
      workspaces = [{
        name = "brain";
        path = "~/brain";
      }];
    };
  };
}
