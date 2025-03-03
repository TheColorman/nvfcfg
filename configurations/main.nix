{outputs, ...}: {
  imports = with outputs.modules; [
    meta-common
    meta-optimisation

    mappings-colemak
    mappings-quick

    binds-cheatsheet
    binds-whichkey

    assistant
    autocomplete
    autopairs
    comments
    dashboard
    debugging
    discord
    filetree
    formatting
    fun
    git
    minimap
    notify
    obsidian
    project
    run
    # session
    snippets
    spellcheck
    statusline
    tabline
    telescope
    terminal
    theme
    treesitter
    ui
    utils
    visuals
  ];
}
