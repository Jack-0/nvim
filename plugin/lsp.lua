-- ! instead of doing this in after/plugin we might be able to do it in a plugin file
-- see Kickstart nvim and compare init.lua to this, notice opts is the same as setup...

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- custom rename that writes all changes
  local rd = require("custom.renameDefinition")
  vim.keymap.set("n", "<leader>rd", rd.rename, { desc = "Rename defintion" })

  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, 'goto definition')
  nmap('gr', require('telescope.builtin').lsp_references, 'goto references')
  nmap('gI', vim.lsp.buf.implementation, 'goto implementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'goto Defintion')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'document symbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'workspace symbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'hover docs')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'signature documentation')

  -- Lesser used LSP functionality
  --[[ nmap('gD', vim.lsp.buf.declaration, 'goto Declaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'workspace add folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders') ]]--

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}