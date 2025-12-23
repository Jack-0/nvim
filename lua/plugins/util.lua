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
  { "numToStr/Comment.nvim", opts = {} },
  -- comment strings when multiple languages embedded in file i.e html + js
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  -- auto tag html
  { "windwp/nvim-ts-autotag", opts = {} },
}
