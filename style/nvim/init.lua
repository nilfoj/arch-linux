-- Nvim.Lua
local opt = vim.opt


-- Config

opt.clipboard = 'unnamedplus'
opt.number = true
opt.relativenumber = true
opt.confirm = true
opt.scrolloff = 8
opt.cursorline = true


vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "


-- Lazy

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release

  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  
  -- Start


  -- Catppuccin

    { "catppuccin/nvim", name= "catppuccin", priority = 1000 },


  -- Telescope
  
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
    },


  -- Neo-tree
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    },


  -- LuaLine
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }    
    },


  -- LSP
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }




  -- End

}


local opts = {}

require("lazy").setup(plugins, opts)


-- Telescope

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})


-- Catppuccin

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})


-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"


-- Neo-Tree
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})


-- LuaLine
require('lualine').setup()
options = { theme = 'gruvbox' }


-- LSP
require("mason").setup()


-- LSP - Mason > Config
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "taplo" },
}

-- LSP - Config
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.taplo.setup({})


vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'g', vim.lsp.buf.definition, {})
vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})





-- End


 

