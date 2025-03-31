# nvfcfg

This repo contains my Neovim configuration. It is configured with Nix using
[nvf](https://github.com/NotAShelf/nvf).

You can try out the config _without installing_ it by running the following
command:

```bash
# Run the qwerty package
nix run github:thecolorman/nvfcfg#qwerty
# If you use the Colemak keyboard layout you can run the default package
nix run github:thecolorman/nvfcfg
```

Nix may ask you to trust my binary cache as an extra substitutor. This
repository contains GitHub Actions that automatically build the derivation and
push it to my Cachix binary cache. Note that binary caches can always be
poisoned.

## Noteworthy keybinds

Keybinds that are worth knowing if trying out my config:

- `;` and `:` are swapped so you can enter command mode without having to hold
  shift.
- `,n` is mapped to `<Esc>` as a faster way to exit insert mode. Designed with
  Colemak in mind, but kept in for qwerty as it is still quite fast to type. You
  may rather want to rebind caps lock to escape to make it easier to hit,
  personal preference.
