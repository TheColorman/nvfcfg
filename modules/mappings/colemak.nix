{
  lib,
  config,
  ...
}: let
  inherit (lib.nvim.binds) mkKeymap;
  inherit (lib.modules) mkIf;
  nvim-dap = config.vim.debugger.nvim-dap;
in {
  # Mappings for Colemak.
  # Uses neio instead of hjkl

  config.vim = {
    keymaps = [
      (mkKeymap "n" "n" "h" {desc = "Left";})
      (mkKeymap "n" "e" "gk" {desc = "Up";})
      (mkKeymap "n" "i" "gj" {desc = "Down";})
      (mkKeymap "n" "o" "l" {desc = "Right";})

      (mkKeymap "v" "n" "h" {desc = "left";})
      (mkKeymap "v" "e" "gk" {desc = "Up";})
      (mkKeymap "v" "i" "gj" {desc = "Down";})
      (mkKeymap "v" "o" "l" {desc = "Right";})

      # Now that neio are used for navigation, their old actions need to be remapped
      (mkKeymap "n" "t" "i" {desc = "(t)ype";}) # (i)nsert
      (mkKeymap "n" "T" "I" {desc = "(T)ype at BoL";}) # (I)nsert
      (mkKeymap "n" "<M-e>" "e" {desc = "(e)nd of word";}) # (e)end
      (mkKeymap "n" "k" "n" {desc = "next match";}) # (n)ext match
      (mkKeymap "n" "K" "N" {desc = "previous match";}) # (N) Previous match
      (mkKeymap "n" "h" "o" {desc = "new line below";}) # (o) New line below
      (mkKeymap "n" "H" "O" {desc = "new line above";}) # (O) New line above
    ];

    debugger.nvim-dap.mappings = mkIf nvim-dap.enable {
      # Colemak bindings
      goUp = "<leader>dve";
      stepInto = "<leader>dge";
      stepOver = "<leader>dgi";
    };
  };
}
