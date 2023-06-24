-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- telescope (fuzzy search)
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    -- syntax highlighting
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    -- see treesitter token tree
    use("nvim-treesitter/playground")
    -- harpoon, tag files for quick nav
    use("ThePrimeagen/harpoon")
    -- undo history
    use("mbbill/undotree")
    -- git status (:Git)
    use("tpope/vim-fugitive")
    -- lsp
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },         -- Required
            { "hrsh7th/cmp-nvim-lsp" },     -- Required
            { "L3MON4D3/LuaSnip" },         -- Required
        },
    })
    -- lsp format
    use("/jose-elias-alvarez/null-ls.nvim")
    -- which key
    use({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })
    -- git status bar at bottom
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })

    -- theme tokyonight
    use({
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    })
    -- nvim tree
    use({
        "DaikyXendo/nvim-tree.lua",
        requires = {
            "DaikyXendo/nvim-material-icon", -- optional, for file icons
        },
    })
end)
