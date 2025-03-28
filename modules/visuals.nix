{
	vim = {
		visuals = {
			nvim-scrollbar.enable = true;
			nvim-web-devicons.enable = true;
			nvim-cursorline.enable = true;
			cinnamon-nvim.enable = true;
			fidget-nvim.enable = true;

			highlight-undo.enable = true;
			indent-blankline.enable = true;

			# Fun
			cellular-automaton.enable = true;
		};

		statusline = {
			lualine = {
				enable = true;
				theme = "palenight";
			};
		};
		theme = {
			enable = true;
			name = "tokyonight";
			style = "moon";
			# transparent = true; # this looks ass with current wallpaper
		};

		ui = {
			borders.enable = true;
			noice = {
				enable = true;
				setupOpts = {
					# Causes pop-ups in bottom-right corner that conflict with fidget-nvim,
					# which provides the same information but prettier
					lsp.progress.enabled = false;
					cmdline.opts.position = {
						row = "40%";
						col = "50%";
					};
				};
			};
			colorizer.enable = true;
			# modes-nvim.enable = true; # @TODO: Doesn't really work with themes
			illuminate.enable = true;
			breadcrumbs = {
				enable = true;
				navbuddy.enable = true;
			};
			smartcolumn = {
				enable = true;
				setupOpts = {
					custom_colorcolumn.markdown = "80";
					disabled_filetypes = ["help" "NvimTree" "alpha"];
				};
			};
			fastaction.enable = true;
		};
	};
}
