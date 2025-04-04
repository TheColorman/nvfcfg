{
  # only difference between qwerty and main is that main uses colemak
  imports = [
    ./qwerty.nix

    ../modules/mappings/colemak.nix
  ];

  # bytecode compilation
  vim.enableLuaLoader = true;
}
