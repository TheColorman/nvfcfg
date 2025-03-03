{config, ...}: let
  startify = config.vim.dashboard.startify;
in {
  vim.filetree.nvimTree = {
    enable = true;
    openOnSetup = !startify.enable;
    setupOpts = {
      git.enable = true;
      modified.enable = true;
      renderer = {
        add_trailing = true;
        highlight_git = true;
        highlight_modified = "all";
        highlight_opened_files = "all";
      };
      view = {
        float.enable = true;
        relativenumber = true;
      };
    };
  };
}
