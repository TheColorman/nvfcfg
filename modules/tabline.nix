{config, ...}: let
  cfg = config.vim.tabline.nvimBufferline;
in {
  vim.tabline.nvimBufferline = {
    enable = true;
    mappings.closeCurrent = "<leader>x";
    setupOpts.options = {
      middle_mouse_command = cfg.setupOpts.options.close_command;
      move_wrap_at_ends = true;
    };
  };
}
