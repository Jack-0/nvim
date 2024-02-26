return {
  -- theme
  {
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


  -- Set lualine as statusline
  {
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

}
