return {
  -- auto guess tab stuff
  { "NMAC427/guess-indent.nvim", },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim',  event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
