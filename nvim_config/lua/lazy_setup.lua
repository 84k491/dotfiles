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
	{ "catppuccin/nvim", as = "catppuccin" },

	{
	  'nvim-lualine/lualine.nvim',
	  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
	},

	{
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
	},

	{
	  'smoka7/hop.nvim',
	  -- tag = "*", -- optional but strongly recommended
	  config = function()
	    -- you can configure Hop the way you like here; see :h hop-config
	    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
	  end
	},

	'lewis6991/gitsigns.nvim',

	'nvim-tree/nvim-web-devicons',

	{ 'neoclide/coc.nvim', branch='release' },
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

    'Exafunction/codeium.vim',

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              ensure_installed = { "c", "cpp", "lua", "vim", "bash"},
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },  
            })
        end
    },

})
