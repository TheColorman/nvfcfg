{ ... }: {
  vim = {
    ui.nvim-ufo.enable = true;

    options = {
      foldlevel = 99; 
      foldlevelstart = 99;
      foldenable = true;
    };

    keymaps = [
      {
        key = "zR";
        mode = "n";
        silent = true;
        action = "require('ufo').openAllFolds";
      }
      {
        key = "zM";
        mode = "n";
        silent = true;
        action = "require('ufo').closeAllFolds";
      }
    ];
  };
}
