return {
	-- "mfussenegger/nvim-lint",
	-- event = { "BufReadPre", "BufNewFile" },
	-- config = function()
	-- 	local lint = require("lint")

	-- 	lint.linters_by_ft = {
	-- 		javascript = { "eslint_d" },
	-- 		typescript = { "eslint_d" },
	-- 		javascriptreact = { "eslint_d" },
	-- 		typescriptreact = { "eslint_d" },
	-- 		-- css = { "stylelint" },
	-- 		-- scss = { "stylelint" },
	-- 		-- html = { "stylelint" },
	-- 		-- json = { "jsonlint" },
	-- 		-- markdown = { "markdownlint" },
	-- 		-- lua = { "luacheck" },
	-- 	}

	-- 	local lint_augroup = vim.api.nvim_create_augroup("Linting", { clear = true })

	-- 	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
	-- 		group = lint_augroup,
	-- 		callback = function()
	-- 			lint.try_lint()
	-- 		end,
	-- 	})

	-- 	-- Mappings
	-- 	vim.keymap.set({ "n", "v" }, "<leader>l", function()
	-- 		lint.try_lint()
	-- 	end, { desc = "Trigger lintting for current file" })
	-- end,
}
