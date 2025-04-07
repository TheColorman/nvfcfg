{pkgs, ...}: {
  vim.lazy.plugins."hex.nvim" = {
    package = pkgs.vimPlugins.hex-nvim;
    setupModule = "hex";

    lazy = false;
  };
}
