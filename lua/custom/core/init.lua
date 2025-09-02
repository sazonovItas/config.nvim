-- TODO: divide all setting to separated blocks and enlarge them
local opt = vim.opt
local set = vim.keymap.set

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.relativenumber = true
opt.number = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

-- telescope bindings
local builtin = require "telescope.builtin"
set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- clear search highlighting
set("n", "<leader>nh", ":nohl<CR>")

-- open file explorer
set("n", "<leader>e", ":Explore<CR>")

-- windows
set("n", "<leader>wb", ":split<CR>")
set("n", "<leader>wr", ":vsplit<CR>")

vim.cmd [[ colorscheme habamax ]]
