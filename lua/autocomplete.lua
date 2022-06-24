local cmp = require'cmp'
local nvim_lsp = require('lspconfig')

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = {
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }
		-- { name = 'ultisnips' } -- For ultisnips users.
	}, {
		{ name = 'buffer' },
	}),
	-- view = {
	-- 	entries = 'native'
	-- }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', '<C-h>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	-- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	-- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<C-d>', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	-- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	-- buf_set_keymap('n', '<space>gd', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	-- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Language servers
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- 'omnisharp'
-- local pid = vim.fn.getpid()
-- for _, lsp in ipairs(servers) do
-- 	if lsp == 'omnisharp' then
-- 		nvim_lsp[lsp].setup {
-- 			capabilities = capabilities,
-- 			on_attach = function(_, bufnr)
-- 				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 			end,
-- 			cmd = { "/Users/smvg/Downloads/omnisharp-osx-arm64-net6/OmniSharp", "--languageserver" , "--hostPID", tostring(pid) },
-- 		}
-- 	elseif lsp == 'jdtls' then
-- 		nvim_lsp[lsp].setup { cmd = { 'jdtls' } }
-- 	else
-- 		nvim_lsp[lsp].setup {
-- 			on_attach = on_attach,
-- 			capabilities = capabilities
-- 		}
-- 	end
-- end

nvim_lsp.clangd.setup {
	on_attach=on_attach,
	capabilities=capabilities,
}

nvim_lsp.nimls.setup {
	on_attach=on_attach,
	capabilities=capabilities,
}

nvim_lsp.pylsp.setup {
	on_attach=on_attach,
	capabilities=capabilities,
}

nvim_lsp.bashls.setup {
	on_attach=on_attach,
	capabilities=capabilities,
}

nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities=capabilities,
})

-- nvim_lsp.rls.setup {
-- 	on_attach=on_attach,
-- 	capabilities=capabilities,
-- 	settings={
-- 		rust={
-- 			unstable_features = true,
-- 			build_on_save = false,
-- 			all_features = true,
-- 		}
-- 	},
-- }

nvim_lsp.csharp_ls.setup {
	on_attach=on_attach,
	capabilities=capabilities,
}

nvim_lsp.jdtls.setup {
	cmd={'jdtls'},
	on_attach=on_attach,
	capabilities=capabilities,
}

nvim_lsp.sourcekit.setup {
	on_attach=on_attach,
	capabilities=capabilities,
}

nvim_lsp.julials.setup {
	on_attach=on_attach,
	capabilities=capabilities,
}

nvim_lsp.gopls.setup {
	on_attach=on_attach,
	capabilities=capabilities,
}
