vim.o.termguicolors = true
-- Decrease update time
vim.o.timeoutlen = 700
vim.o.updatetime = 500

-- Number of screen lines to keep above and below the cursor
vim.o.scrolloff = 10

-- Better editor UI
vim.o.number = true
vim.o.numberwidth = 2
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true

-- Better editing experience
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.cindent = true
vim.o.autoindent = true
vim.o.wrap = true
vim.o.textwidth = 300
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = -1 -- If negative, shiftwidth value is used
-- vim.o.list = true
-- Makes neovim and host OS clipboard play nicely with each other
vim.o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Undo and backup options
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.swapfile = false
-- Remember 50 items in commandline history
vim.o.history = 50

-- Better buffer splitting
vim.o.splitright = true
vim.o.splitbelow = true
vim.g.maplocalleader = " "
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-lua/plenary.nvim" },
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        { "nvimtools/none-ls.nvim" },
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "hrsh7th/nvim-cmp",
    },
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        branch = "v0.6", --recommended as each new version will have breaking changes
        opts = {
            --Config goes here
        },
    },
    { "vladdoster/remember.nvim", config = [[ require('remember') ]] },
    { "mbbill/undotree" },
    { "karb94/neoscroll.nvim" },
    {

        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                    ensure_installed = { "c", "lua", "rust", "python" },
                    sync_install = false,
                    auto_install = true,
                    highlight = { enable = true },
                    indent = { enable = true },
                })
            end,
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
})

require("lazy").setup(plugins, opts)

vim.cmd.colorscheme("tokyonight")
require("lualine").setup({
    options = {
        theme = "tokyonight",
    },
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
require("telescope").setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    },
})
require("neoscroll").setup()
require("Comment").setup()
require("telescope").load_extension("ui-select")
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright" },
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({ capabilities = capabilities })
--lspconfig.tsserver.setup {}
lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>e", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        --   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        --    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        --    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        --    vim.keymap.set('n', '<space>wl', function()
        --      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --    end, opts)
        --    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        --    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        --    vim.keymap.set('n', '<space>f', function()
        --      vim.lsp.buf.format { async = true }
        --    end, opts)
    end,
})
vim.lsp.autostart = true
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.completion.spell,
    },
})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        -- expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Esc>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = "buffer" },
    }),
})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<c-k>", ":wincmd k <CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j <CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h <CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l <CR>")
