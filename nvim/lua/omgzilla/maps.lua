---------------
-- Keybindings
---------------

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true})
end


--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Source config file
map("n", "<leader>s", ":source ~/.config/nvim/init.lua<CR>")

-- Enable/Disable numbers
map("n", "<leader>n", ":set invrnu invnu<CR>")

-- Yes/No to signcolumn
map("n", "<leader>c", ":set signcolumn=yes<CR>")
map("n", "<leader>C", ":set signcolumn=no<CR>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")
-- Resize with arrows(macOS)
map("n", "<M-Up>", ":resize -2<CR>")
map("n", "<M-Down>", ":resize +2<CR>")
map("n", "<M-Left>", ":vertical resize -2<CR>")
map("n", "<M-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==")
map("n", "<A-k>", "<Esc>:m .-2<CR>==")
-- Move text up and down (macOS)
map("n", "<M-j>", "<Esc>:m .+1<CR>==")
map("n", "<M-k>", "<Esc>:m .-2<CR>==")

-- Telescope
map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fb", "<CMD>Telescope file_browser<CR>")
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")

-- Insert --
-- Press jk fast to exit insert mode 
map("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down (visual)
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')
-- Move text up and down (visual) (macOS)
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")
