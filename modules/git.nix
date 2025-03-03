{...}: {
  vim.git = {
    enable = true;
    git-conflict.enable = true;
    gitsigns = {
      enable = true;
      codeActions.enable = true;
    };
    vim-fugitive.enable = true;
  };
}
