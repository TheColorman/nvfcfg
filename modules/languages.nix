{
	# List of languages to enable formatting and LSP support for
	vim.languages = {
		# What to enable
		enableDAP = true;
		enableExtraDiagnostics = true;
		enableFormat = true;
		enableLSP = true;
		enableTreesitter = true;

		# Languages to enable it for
		assembly.enable = true;
		bash.enable = true;
		clang.enable = true;
		csharp.enable = true;
		css.enable = true;
		html.enable = true;
		lua.enable = true;
		markdown = {
			enable = true;
			extensions.render-markdown-nvim.enable = true;
		};
		nix = {
			enable = true;
			format.enable = false;
			lsp = {
				server = "nil";
				# @TODO: For some reasons nvf does not support passing options to nil?
				# options = {
				#   formatting.command = "${lib.getExe pkgs.alejandra} --experimental-config ${../alejandra.toml}";
				#   nix = {
				#     maxMemoryMB = 8192; # 8 GiB
				#     flake = {
				#       autoArchive = true;
				#       autoEvalInputs = true;
				#     };
				#   };
				# };
			};
		};
		python = {
			enable = true;
			format.type = "ruff";
		};
		svelte.enable = true;
		tailwind.enable = true;
		ts = {
			enable = true;
			extensions.ts-error-translator.enable = true;
		};
		yaml.enable = true;
	};
}
