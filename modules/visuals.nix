{...}: {
  vim.visuals = {
    cinnamon-nvim.enable = true;
    fidget-nvim = {
      enable = true;
      # @TODO 2025-04-03: this should support functions, see https://github.com/j-hui/fidget.nvim/issues/198#issuecomment-2212264394.
      # Implement in upstream.
      setupOpts.progress.ignore = [
        "null-ls"
      ];
    };
    highlight-undo.enable = true;
    indent-blankline.enable = true;
    nvim-cursorline.enable = true;
    nvim-scrollbar.enable = true;
    nvim-web-devicons.enable = true;
    rainbow-delimiters.enable = true;
  };
}
