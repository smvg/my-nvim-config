require('plugins')
require('autocomplete')

-- Styling
vim.g.colors_name = 'gruvbox8'
vim.o.background = 'dark'

-- Tab length
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- vim.opt.expandtab = true

vim.opt.mouse = 'a'

-- Numbers on the left
vim.opt.number = true
vim.opt.relativenumber = true

-- GUI font
vim.opt.guifont = 'FiraCode Nerd Font:h16'

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.list = true
vim.opt.listchars = {tab = '» ', extends = '›', precedes = '‹', trail = '·'}

-- Exit normal mode
vim.g.better_escape_shortcut = 'jj'
vim.g.better_escape_interval = 200
-- vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true})

-- Update file
vim.api.nvim_set_keymap('n', 'zz', ':update<CR>', {noremap = true})
-- Exit and save file
vim.api.nvim_set_keymap('n', 'zx', ':x<CR>', {noremap = true})

-- Search in file
vim.api.nvim_set_keymap('n', '-', '/', {noremap = true})
-- Dont show search
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR>', {noremap = true})

-- Go to start, end of file and line
-- vim.api.nvim_set_keymap('n', 'H', '0', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'L', '$', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'K', 'gg', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'J', 'G', {noremap = true})
vim.api.nvim_set_keymap('n', 'H', '^', {noremap = true})
vim.api.nvim_set_keymap('n', 'L', '$', {noremap = true})
vim.api.nvim_set_keymap('n', 'K', '<C-u>', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', '<C-d>', {noremap = true})

-- Substitute characters I don't use
vim.api.nvim_set_keymap('i', 'ñ', ';', {noremap = true})
vim.api.nvim_set_keymap('i', 'ç', '_', {noremap = true})

-- Fuzzy search
vim.api.nvim_set_keymap('', '<C-p>', ':Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('', '<C-f>', ':Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('', '<C-b>', ':Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('', '<space>ld', ':Telescope diagnostics<CR>', {noremap = true})

-- Hop to a word
vim.api.nvim_set_keymap('n', '<Tab>', ':HopWord<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'º', ':HopLineStart<CR>', {noremap = true})

-- Toggle Nvim Tree
vim.api.nvim_set_keymap('n', '§', ':NvimTreeToggle<CR>', {noremap = true})

-- Git related stuff
vim.api.nvim_set_keymap('n', '<space>gd', ':Gitsigns diffthis<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-g>', ':Neogit<CR>', {noremap = true})

-- Reset keybindings
vim.api.nvim_set_keymap('n', '<space>u', ':Gitsigns reset_hunk<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space><C-u>', ':Gitsigns reset_buffer<CR>', {noremap = true})

-- Window keybindings
vim.api.nvim_set_keymap('n', '<space>l', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>h', '<C-w>h', {noremap = true})

require 'lualine'.setup {}

require 'hop'.setup {}

require 'nvim-tree'.setup {}

require "bufferline".setup {}

require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,              -- false will disable the whole extension
		additional_vim_regex_highlighting = false,
	},
}

-- Git stuff
require 'gitsigns'.setup {
	current_line_blame = true
}
require 'neogit'.setup {}

-- Null-ls stuff
require 'null-ls'.setup({
	sources = {
		require 'null-ls'.builtins.formatting.stylua,
		require 'null-ls'.builtins.diagnostics.eslint,
		require 'null-ls'.builtins.code_actions.gitsigns
	},
})
