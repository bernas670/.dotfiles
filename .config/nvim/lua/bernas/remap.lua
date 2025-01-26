vim.g.mapleader = " "

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", "<leader>w", "<CMD>update<CR>")
map("n", "<leader>q", "<CMD>q<CR>")

map("n", "<C-S-e>", vim.cmd.Ex)

-- move selected lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- yank remaps
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("v", "<leader>Y", '"+Y')

-- replace current word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vim panes navigation
map("n", "C-k", ":wincmd k<CR>")
map("n", "C-j", ":wincmd j<CR>")
map("n", "C-h", ":wincmd h<CR>")
map("n", "C-l", ":wincmd l<CR>")
