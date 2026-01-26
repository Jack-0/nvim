return {
  -- auto guess tab stuff
  { "NMAC427/guess-indent.nvim" },
  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  -- uze last place when opening a file
  { "farmergreg/vim-lastplace" },
  -- mixed filetypes etc
  -- comment strings when multiple languages embedded in file i.e html + js
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  -- auto tag html
  { "windwp/nvim-ts-autotag", opts = {} },
  -- code comments
  -- this setup allows tsx jsx etc
  {
    "numToStr/Comment.nvim",
    config = function()
      local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      require("Comment").setup({
        padding = true,
        sticky = true,
        mappings = {
          basic = true,
          extra = true,
          extended = false,
        },
        pre_hook = prehook,
        post_hook = nil,
      })
    end,
    event = "InsertEnter",
    lazy = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
}
