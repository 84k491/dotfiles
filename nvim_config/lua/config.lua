local opt = vim.opt
opt.cursorline = true
opt.relativenumber = true
opt.tabstop=4
opt.shiftwidth=4
opt.softtabstop = 4
opt.expandtab = true

opt.cindent = false
opt.smartindent = false
opt.autoindent = false

opt.formatoptions=""
opt.showcmd = true
opt.signcolumn = 'yes'
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
vim.cmd('filetype plugin indent off')

require('mini.indentscope').setup()
require('mini.cursorword').setup()
require('mini.starter').setup()

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=500})
    augroup END
]]

--require('plugins')
require('Comment').setup({
    toggler = {
        ---Line-comment toggle keymap
        line = '<leader>;',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    opleader = {
        ---Line-comment keymap
        line = '<leader>;',
        ---Block-comment keymap
        block = 'gbc',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = false,
    },
})

require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.o.background = "light" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")
vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = "#44aaaa", bold = true })
vim.api.nvim_set_hl(0, 'MiniCursorword', { bg="#e3cea8" })


require('lualine').setup()

require('gitsigns').setup {
  signs = {
    add          = { text = ' ' },
    change       = { text = ' ' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },

  vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitSignsAddLn" }),
  vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitSignsDeleteVirtLn" }),
  vim.api.nvim_set_hl(0, 'GitSignsChange', { bg="#88bdc2" }),
  vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChange" }),
}

require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,

  -- which builtin marks to show. default {}
  -- builtin_marks = { ".", "<", ">", "^" },
  --
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = false,
  },
  mappings = {}
}

------------- lsp-config ---------------------------------------------------------------------------
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.clangd.setup {}
lspconfig.bashls.setup{}
require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  }
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', 'df', vim.diagnostic.open_float)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<C-]>', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>q', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<C-q>', ':ClangdSwitchSourceHeader<CR>')
  end,
})

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Highlight entire line for errors
-- Highlight the line number for warnings
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
        },
        -- linehl = {
        --     [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        -- },
        -- numhl = {
            -- [vim.diagnostic.severity.WARN] = 'WarningMsg',
            -- [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        -- },
    },
})
----------------- lsp-config ^^^ --------------------------------------------------------------------

vim.keymap.set('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)
vim.keymap.set('n', '<C-x>', '<Cmd>BufferClose<CR>', opts)


require('telescope').setup{}
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>e', telescope.find_files, {})
vim.keymap.set('n', '<leader>/', telescope.live_grep, {})
vim.keymap.set('n', '<leader>b', telescope.buffers, {})
vim.keymap.set('n', '<leader>m', telescope.marks, {})
vim.keymap.set('n', '<leader>dd', ':Telescope diagnostics bufnr=0 layout_strategy=vertical<CR>', {})
vim.keymap.set('n', '<leader>td', ':Telescope diagnostics bufnr=0 layout_strategy=vertical<CR>', {})
vim.keymap.set('n', '<leader>tr', ':Telescope registers layout_strategy=vertical<CR>', {})
vim.keymap.set('n', '<leader>ti', ':Telescope lsp_incoming_calls layout_strategy=vertical<CR>', {})
vim.keymap.set('n', 'gr', ':Telescope lsp_references layout_strategy=vertical<CR>', {})

vim.keymap.set('n', '<F2>', ':Neotree toggle<CR>')

local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<space>', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', '<space><space>', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})

local gitsigns = require('gitsigns')
vim.keymap.set('n', 'ghp', '<cmd>Gitsigns preview_hunk<CR>')
vim.keymap.set('n', 'ghk', '<cmd>Gitsigns prev_hunk<CR>')
vim.keymap.set('n', 'ghj', '<cmd>Gitsigns next_hunk<CR>')
vim.keymap.set('n', 'ghs', '<cmd>Gitsigns stage_hunk<CR>')
vim.keymap.set('n', 'ghu', '<cmd>Gitsigns undo_stage_hunk<CR>')
vim.keymap.set('n', 'ghr', '<cmd>Gitsigns reset_hunk<CR>')
vim.keymap.set('n', 'ghb', '<cmd>Gitsigns blame_line<CR>')

vim.keymap.set('n', '<C-t>', ':noh<CR>')

vim.keymap.set('n', '<c-g>', ':echo expand("%:p")<CR>')
-- ====================================================================================================

local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

dap.configurations.cpp = {
  {
    name = "Launch process",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    type = "gdb",
    request = "attach",
    name = "Attach select",
    pid = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
  }
}

vim.keymap.set('n', '<M-b><M-b>', ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n', '<M-b><M-l>', ":lua require'dap'.list_breakpoints()<CR>")
vim.keymap.set('n', '<M-b><M-c>', ":lua require'dap'.clear_breakpoints()<CR>")
vim.keymap.set('n', '<M-c>', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<M-q>', ":lua require'dap'.terminate()<CR>")
vim.keymap.set('n', '<M-p>', ":lua require'dap'.pause()<CR>")

vim.keymap.set('n', '<M-n>', ":lua require'dap'.step_over()<CR>")
vim.keymap.set('n', '<M-i>', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<M-o>', ":lua require'dap'.step_out()<CR>")
vim.keymap.set('n', '<M-a>', ":lua require'dap'.run_to_cursor()<CR>")

vim.keymap.set('n', '<M-u>', ":lua require'dap'.up()<CR>")
vim.keymap.set('n', '<M-d>', ":lua require'dap'.down()<CR>")

vim.keymap.set('n', '<M-r>', ":lua require'dap'.repl.toggle()<CR>")
vim.keymap.set('n', '<M-f>', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
vim.keymap.set('n', '<M-t>', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.threads)
    end)
vim.keymap.set('n', '<M-s>', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)
