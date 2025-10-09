return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', config = true },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'j-hui/fidget.nvim',
      opts = { notification = { window = { winblend = 0 } } },
    },
  },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('minimal-lsp', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('<leader>f', function() vim.lsp.buf.format({ async = true }) end, '[F]ormat buffer')
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local servers = {
      pyright = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
          },
        },
      },
      gopls = {},
      clangd = {},
    }

    require('mason-tool-installer').setup({
      ensure_installed = vim.tbl_keys(servers),
      auto_update = false,
    })

    for server, cfg in pairs(servers) do
      cfg.capabilities = capabilities
      vim.lsp.config(server, cfg)
      vim.lsp.enable(server)
    end
  end,
}

