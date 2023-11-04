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
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }

    use 'lewis6991/gitsigns.nvim'

    use 'rcarriga/nvim-notify'

    use 'nvim-tree/nvim-web-devicons'

    use { 'neoclide/coc.nvim', branch='release' }
    use 'lervag/vimtex'

    use 'romgrk/barbar.nvim'
    use 'chentoast/marks.nvim'

end)
