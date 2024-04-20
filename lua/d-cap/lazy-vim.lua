local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd('colorscheme tokyonight-night')
        end
    },
    { 'nvim-telescope/telescope.nvim',          tag = '0.1.6',   dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-treesitter/nvim-treesitter',        cmd = 'TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'nvim-treesitter/playground' },
    { 'theprimeagen/harpoon' },
    { 'mbbill/undotree' },
    { 'tpope/vim-sleuth' },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
        config = function()
            require('which-key').setup()

            require('which-key').register {
                ['<leader>p'] = { name = '[P]rogram', _ = 'which_key_ignore' },
            }
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            { 'williamboman/mason.nvim',       cmd = 'MasonUpdate' },
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            { "lukas-reineke/lsp-format.nvim", config = true },
        }
    },
    'simrat39/rust-tools.nvim',
    -- 'folke/zen-mode.nvim',
    -- 'mfussenegger/nvimwall-symmetric-dap'
    --{ 'rcarriga/nvim-dap-ui', dependencies = {'mfussenegger/nvim-dap'} }
}, {})
