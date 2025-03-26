{
  vim = {
    # Aliases
    viAlias = true;
    vimAlias = true;

    options = {
      shiftwidth = 2;
      tabstop = 2;
      autoindent = true;
      expandtab = false;
    };

    searchCase = "smart"; # only searches containing uppercase will be case sensitive
    syntaxHighlighting = true;
    undoFile.enable = true;
    useSystemClipboard = true;
    bell = "on";

    # Spellchecking in strings and comments
    spellcheck = {
      enable = true;
      programmingWordlist.enable = true;
    };

    # File tree
    filetree.neo-tree.enable = true;

    # See available keybinds
    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    # Better commenting
    comments.comment-nvim.enable = true;

    # Remember open buffers
    session.nvim-session-manager.enable = false;

    tabline.nvimBufferline.enable = true;
    treesitter = {
      enable = true;
      autotagHtml = true;
      context.enable = true;
    };
    telescope.enable = true;

    git = {
      enable = true;
      gitsigns = {
        enable = true;
        codeActions.enable = false; # throws an annoying debug message
      };
      vim-fugitive.enable = true;
    };

    minimap.codewindow.enable = true;

    dashboard.alpha.enable = true;
    notify = {
      nvim-notify.enable = true;
    };

    projects.project-nvim.enable = true;

    notes = {
      obsidian = {
        enable = true;
        setupOpts = {
          completion.nvim_cmp = true;
          workspaces = [
            {
              name = "brain";
              path = "~/brain";
            }
          ];
        };
      };
      orgmode.enable = false; # TODO: I should try orgmode out some day
      todo-comments.enable = true;
    };

    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };
  };
}
