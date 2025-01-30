return {
	"williamboman/mason.nvim",
	-- dependencies = {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- },
	config = function()
		local mason = require("mason")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- local mason_lspconfig = require("mason-lspconfig")
		-- mason_lspconfig.setup({
		-- 	ensure_installed = {
		-- 		"lua_ls",
		-- 	},
		-- 	automatic_installation = true,
		-- })

		-- local lspconfig = require("lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

		-- mason_lspconfig.setup_handlers({
		-- 	function(server_name)
		-- 		lspconfig[server_name].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	["lua_ls"] = function()
		-- 		require("lua_ls").setup({
		-- 			capabilities = capabilities,
		-- 			settings = {

		-- 				Lua = {
		-- 					diagnostics = {
		-- 						globals = { "vim" },
		-- 					},
		-- 					workspace = {
		-- 						library = {
		-- 							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
		-- 							[vim.fn.stdpath("config") .. "/lua"] = true,
		-- 						},
		-- 					},
		-- 				},
		-- 			},
		-- 		})
		-- 	end,
		-- })
	end,
}
