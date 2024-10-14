local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "catppuccin/nvim",          as = "catppuccin" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000,  config = true },

	'nvim-tree/nvim-web-devicons',
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
	},

	{
		'nvim-telescope/telescope.nvim',
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},

	{
		'smoka7/hop.nvim',
		-- tag = "*", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	},

	'lewis6991/gitsigns.nvim',

	'lervag/vimtex',

	'romgrk/barbar.nvim',
	'chentoast/marks.nvim',

	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},

	({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	}),

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	},

	-- 'Exafunction/codeium.vim',

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "cpp", "lua", "vim", "bash", "python", "rust", "markdown" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = false },
			})
		end
	},

	{ 'echasnovski/mini.nvim', version = false },

	'mfussenegger/nvim-dap',
	-- 'rcarriga/nvim-dap-ui'
	{
		'stevearc/dressing.nvim',
		opts = {},
	},

	'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
	'hrsh7th/nvim-cmp', -- Autocompletion plugin
	'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
	'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
	'L3MON4D3/LuaSnip', -- Snippets plugin

	{
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline
			vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
			{ desc = "Toggle Outline" })

			require("outline").setup {
			-- Your setup opts here (leave empty to use defaults)
			}
		end,
	},

	{
		"j-hui/fidget.nvim",
		opts = {
		-- options
		},
	},

	'nvim-telescope/telescope-dap.nvim',

	'leoluz/nvim-dap-go',

	{
		"rmagatti/goto-preview",
		event = "BufEnter",
		config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
	},
})
