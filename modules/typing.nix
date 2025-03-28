{
	vim = {
		autopairs.nvim-autopairs.enable = true;

		autocomplete.nvim-cmp = {
			enable = true;
			mappings = {
				confirm = "<C-y>";
				next = "<Down>";
				previous = "<Up>";
			};
		};
		snippets.luasnip.enable = true;
	};
}
