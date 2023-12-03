local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Nvim tree (file explorer)
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  -- tmux, allows <C-[hjkl]> pane navigation in nvim
  {
    'christoomey/vim-tmux-navigator'
  },
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- LSP
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- status updates for LSP
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  { 'folke/which-key.nvim',       opts = {} },

  {
    -- git signs
    'lewis6991/gitsigns.nvim',
    opts = { -- opts looks to be the same as setup...
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  {
    -- theme
    'folke/tokyonight.nvim',
    -- 'joshdick/onedark.vim',
    -- 'catppuccin/nvim',
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
      -- vim.cmd.colorscheme 'onedark'
      -- vim.cmd.colorscheme 'catppuccin-frappe'
    end,
  },


  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = "tokyonight",
        -- theme = 'onedark',
        -- theme = "catppuccin-frappe",
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = "ibl",
    -- opts = {
    --   char = '┊',
    --   show_trailing_blankline_indent = false,
    -- },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',                      opts = {} },
  { "JoosepAlviste/nvim-ts-context-commentstring" }, -- support for jsx

  -- fuzzy
  { 'nvim-telescope/telescope.nvim',              branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- faster fzf
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- harpoon
  { "ThePrimeagen/harpoon" },

  -- undo tree
  { "mbbill/undotree" },

}, {})
