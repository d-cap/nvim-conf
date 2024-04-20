vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('d-cap-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
