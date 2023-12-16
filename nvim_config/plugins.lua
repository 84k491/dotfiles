return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.3',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'smoka7/hop.nvim',
        tag = '*', -- optional but strongly recommended
        config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    use { 'tpope/vim-surround' }

    use 'lewis6991/gitsigns.nvim'

    use 'rcarriga/nvim-notify'

    use 'nvim-tree/nvim-web-devicons'

    use { 'neoclide/coc.nvim', branch='release' }
    use 'lervag/vimtex'

    use 'romgrk/barbar.nvim'
    use 'chentoast/marks.nvim'

    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
      }

    use 'Exafunction/codeium.vim'

end)
