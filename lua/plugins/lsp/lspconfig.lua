return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic"
          }
        }
      }
    })

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })

  end
}
