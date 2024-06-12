return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- "nvim-telescope/telescope.nvim",
      -- automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- status updates for LSP
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },

    config = function()
      --  This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        -- custom rename that writes all changes
        local rd = require("custom.renameDefinition")
        vim.keymap.set("n", "<leader>rd", rd.rename, { desc = "Rename defintion" })

        -- lsp binds
        nmap('<leader>ca', vim.lsp.buf.code_action, 'code action')
        nmap('gd', vim.lsp.buf.definition, 'goto definition')
        nmap('gD', vim.lsp.buf.declaration, 'goto declaration')
        nmap('gr', require('telescope.builtin').lsp_references, 'goto references')
        nmap('gI', vim.lsp.buf.implementation, 'goto implementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'goto Defintion')
        -- lsp telescope related binds
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'document symbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'workspace symbols')

        -- see `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'hover docs')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'signature documentation')

        -- create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end

      -- `settings` field of the server config. You must look up that documentation yourself.
      -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
      local servers = {
        clangd = {},
        cmake = {},
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        tsserver = {},
        eslint = {},
        svelte = {},
        --csharp_ls = {},
        omnisharp_mono = {},
        -- hls = {
        --   filetypes = { 'haskell', 'lhaskell', 'cabal' },
        -- },
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        -- ccls = {},
        templ = {},  -- templ htmx golang
        htmx = { filetypes = { "html", "templ" } },
        html = { filetypes = { "html", "templ" } }
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
    end,
  }
}
