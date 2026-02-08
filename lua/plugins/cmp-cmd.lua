return {
	{
		"hrsh7th/cmp-cmdline",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")

			-- completion no :
			cmp.setup.cmdline(":", {
				sources = {
					{ name = "path" },
					{ name = "cmdline" },
				},
			})

			-- completion no / e ?
			cmp.setup.cmdline({ "/", "?" }, {
				sources = {
					{ name = "buffer" },
				},
			})
		end,
	},
}
