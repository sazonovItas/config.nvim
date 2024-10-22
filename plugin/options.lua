local opt = vim.opt

-- clipboard
opt.clipboard:append "unnamedplus" -- use system clipboard

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line numbers
opt.relativenumber = true
opt.number = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- split windows
opt.splitright = true
opt.splitbelow = true

-- keywords
opt.iskeyword:append "-"
