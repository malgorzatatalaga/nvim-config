return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'mason-org/mason.nvim', config = true },
        'mason-org/mason-lspconfig.nvim'
    },
    config = function()
        vim.lsp.enable('luals')
    end,
}
