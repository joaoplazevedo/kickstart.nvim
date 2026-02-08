return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- ícones
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer (Neo-tree)" },
			{ "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
		},
		init = function()
			-- evita conflitos com netrw e dá “hijack” para o neo-tree (estilo NvChad)
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		opts = {
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,

			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 1,
					with_markers = true,
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
				},
				modified = { symbol = "●" },
				git_status = {
					symbols = {
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "",
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},

			filesystem = {
				follow_current_file = { enabled = true },
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = true,
				filtered_items = {
					visible = false, -- false = esconde “dotfiles” por defeito (NvChad-like)
					hide_dotfiles = true,
					hide_gitignored = true,
				},
				window = {
					mappings = {
						["<space>"] = "toggle_node",
						["l"] = "open",
						["h"] = "close_node",
						["v"] = "open_vsplit",
						["s"] = "open_split",
						["t"] = "open_tabnew",
						["a"] = "add",
						["d"] = "delete",
						["r"] = "rename",
						["c"] = "copy",
						["x"] = "cut",
						["p"] = "paste",
						["q"] = "close_window",
						["R"] = "refresh",
						["."] = "toggle_hidden",
					},
				},
			},

			window = {
				position = "left",
				width = 32,
			},

			-- “tabs” comuns (filesystem / buffers / git)
			source_selector = {
				winbar = true,
				statusline = false,
				sources = {
					{ source = "filesystem", display_name = "Files" },
					{ source = "buffers", display_name = "Buffers" },
					{ source = "git_status", display_name = "Git" },
				},
			},
		},
	},
}
