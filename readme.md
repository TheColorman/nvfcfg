# nvfcfg

This repo contains my Neovim configuration. It is configured with Nix using
[NVF](https://github.com/NotAShelf/nvf).

You can try it out temporarily without creating any permanent bloat files on
your system with

```bash
nix run github:thecolorman/nvfcfg#qwerty # omit the #qwerty part if you use colemak!
```

## Work in progress

This is very much a work in progress. This config is currently a giant mess,
with LSP warnings duplicated several times and lots of conflicting plugins. Use
at your own risk.

## Noteworthy keybinds

Keybinds that are worth knowing if trying out my config:

- `;` and `:` are swapped so you can enter command mode without having to hold
  shift.
- `,n` is mapped to `<Esc>` as a faster way to exit insert mode. Designed with
  Colemak in mind, but kept in for qwerty as it is still quite fast to type. You
  may rather want to rebind caps lock to make Escape easier to hit, personal
  preference.
-
