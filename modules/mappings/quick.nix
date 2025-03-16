{lib, ...}: let
  inherit (lib.nvim.binds) mkKeymap;
in {
  vim.keymaps = [
    # Enter commands without pressing shift
    (mkKeymap "n" ";" ":" {desc = "Enter command";})
    (mkKeymap "n" ":" ";" {})

    # Quickly return to normal_mode
    (mkKeymap "i" ",n" "<Esc>" {desc = "Exit insert mode";})
  ];
}
