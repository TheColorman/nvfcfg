{pkgs, ...}: {
  vim.lazy.plugins."kitty-scrollback.nvim" = {
    package = pkgs.vimPlugins.kitty-scrollback-nvim;
    setupModule = "kitty-scrollback";

    cmd = ["KittyScrollbackGenerateKittens" "KittyScrollbackCheckHealth" "KittyScrollbackGenerateCommandLineEditing"];
    event = ["User KittyScrollbackLaunch"];
  };
}
