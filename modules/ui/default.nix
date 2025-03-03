{...}: {
  imports = [./nvim-ufo.nix];

  vim = {
    ui = {
      borders.enable = true;
      breadcrumbs = {
        enable = true;
        navbuddy.enable = true;
      };
      colorizer.enable = true;
      fastaction.enable = true;
      illuminate.enable = true;
      modes-nvim.enable = true;
      noice.enable = true;
      smartcolumn = {
        enable = true;
        setupOpts = {
          custom_colorcolumn.markdown = "80";
          disabled_filetypes = ["help" "NvimTree" "alpha"];
        };
      };
    };
  };
}
