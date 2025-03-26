{
  imports = [
    ../modules/mappings/quick.nix

    ../modules/common.nix
    ../modules/languages.nix
    ../modules/lsp.nix
    ../modules/debugger.nix
    ../modules/formatter.nix
    ../modules/visuals.nix
    ../modules/typing.nix
    ../modules/utility.nix
    ../modules/assistant.nix
  ];

  # Discord rich presence
  vim.presence.neocord.enable = false;
}
