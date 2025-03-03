{...}: {
  vim = {
    formatter.conform-nvim = {
      enable = true;
      setupOpts.formatters_by_ft = {
        lua = ["stylua"];
        cs = ["csharpier"];
        css = ["prettier"];
        html = ["prettier"];
        vue = ["prettier"];
        typescript = ["prettier"];
      };
    };
    languages.enableFormat = true;
  };
}
