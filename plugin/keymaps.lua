local set = vim.keymap.set

---------------------
-- General keymaps --
---------------------

-- clear search highlighting
set("n", "<leader>nh", ":nohl<CR>")

-- open file explorer
set("n", "<leader>e", ":Explore<CR>")

-- tabs
set("n", "<leader>to", ":tabnew<CR>") -- open new tab
set("n", "<leader>tc", ":tabclose<CR>") -- close current tab
set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- windowns
set("n", "<leader>wb", ":split<CR>")
set("n", "<leader>wr", ":vsplit<CR>")
