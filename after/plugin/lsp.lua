local lsp = require("lsp-zero").preset({
	manage_nvim_cmp = {
		set_sources = "recommended",
	},
})

lsp.ensure_installed({
	"tsserver",
	"eslint",
	--'sumneko_lua',
	"rust_analyzer",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
	["<c-k>"] = cmp.mapping.select_prev_item(cmp_select),
	["<c-j>"] = cmp.mapping.select_next_item(cmp_select),
	["<c-i>"] = cmp.mapping.confirm({ select = true }),
	["<c-space>"] = cmp.mapping.complete(),
})

-- sources stop auto completion in ts?
local sources = {
	{ name = "nvim_lua" },
	{ name = "nvim-lsp" },
	{
		name = "buffer", --[[, keyword_length = 5 ]]
	},
}

local lspkind = require("lspkind")

cmp.setup({
	mapping = cmp_mappings,
	--sources = sources,

	-- formatting is not working -_-
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
			},
		}),
	},
})

--lsp.set_preferences({
--	sign_icons = { }
--})

-- TODO: better bindings
lsp.on_attach(function(_, bufnr)
	local nmap = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc, remap = false })
	end

    -- lsp buf
	nmap("<leader>gd", vim.lsp.buf.definition, "goto definition")
	nmap("<leader>ga", vim.lsp.buf.code_action, "code action")
	nmap("<leader>gr", vim.lsp.buf.references, "references")
	nmap("K", vim.lsp.buf.hover, "hover")
	nmap("<leader>lw", vim.lsp.buf.workspace_symbol, "workspace symbols")
	nmap("<leader>lh", vim.lsp.buf.signature_help, "signature help")

    -- rename defintion, note require :wa to enact
    local rd = require("custom.renameDefinition")
    vim.keymap.set("n", "<leader>rd", rd.rename, { desc = "Rename defintion" })

	-- diagnostics (hints, warnings and errors)
	nmap("<leader>e", vim.diagnostic.open_float, "open diagnostic")
	nmap("<leader>le", vim.diagnostic.setloclist, "list diagnostics")
	nmap("[d", vim.diagnostic.goto_next, "next diagnostic")
	nmap("]d", vim.diagnostic.goto_prev, "prev diagnostic")

end)

lsp.setup()
