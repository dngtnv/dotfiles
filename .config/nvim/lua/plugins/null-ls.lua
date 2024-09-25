return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
  },

  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

    local sources = {
      null_ls.builtins.formatting.prettier.with({
        extra_args = {
          "--single-quote",
          "--tab-width 2",
          "--print-width 80",
          "--trailing-comma es5",
          "--arrow-parens avoid",
        },
      }),
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.code_actions.gitsigns,
      -- Static analysis & linting & formatting Python
      -- null_ls.builtins.diagnostics.ruff,
      -- null_ls.builtins.formatting.black,
      -- null_ls.builtins.formatting.isort,
    }

    null_ls.setup({
      sources = sources,
      debug = false,
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              --vim.lsp.buf.formatting_sync()
              vim.lsp.buf.format({
                timeout_ms = 3000,
                bufnr = bufnr,
                filter = function()
                  return client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true })
  end,
}
