return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lsp_defaults = require("lspconfig").util.default_config

		lsp_defaults.capabilities =
			vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local telescope = require("telescope.builtin")

				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("K", vim.lsp.buf.hover, "Hover Documentation")

				map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("gi", telescope.lsp_implementations, "[G]oto [I]mplementation")
				map("gr", telescope.lsp_references, "[G]oto [R]eferences")

				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			end,
		})

		-- local lspconfig = require("lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = lsp_defaults.capabilities,
					})
				end,
				["lua_ls"] = function()
					require("lspconfig")["lua_ls"].setup({
						capabilities = lsp_defaults.capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
				end,
				["pylsp"] = function()
					require("lspconfig")["pylsp"].setup({
						capabilities = lsp_defaults.capabilities,
						settings = {
							pylsp = {
								plugins = {
									pycodestyle = {
										ignore = { "E501" },
									},
								},
							},
						},
					})
				end,
			},
		})
	end,
}
