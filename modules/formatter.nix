{
	lib,
	pkgs,
	parentInputs,
	...
}: {
	vim = {
		formatter.conform-nvim = {
			enable = true;
			setupOpts = {
				formatters_by_ft.nix = ["alejandra"];
				formatters.alejandra = {
					command = lib.getExe parentInputs.alejandra.defaultPackage.${pkgs.stdenv.hostPlatform.system};
					args = ["--experimental-config" ../alejandra.toml];
				};
				format_on_save = {
					lsp_format = "fallback";
					timeout_ms = 500;
				};
				format_after_save.lsp_format = "fallback";
			};
		};
		languages.enableFormat = true;
	};
}
