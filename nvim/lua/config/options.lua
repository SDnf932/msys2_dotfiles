-- Enable bytecode caching for faster startup
vim.loader.enable()

-- Core Editor Options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation and tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true
-- opt.colorcolumn = "80"
opt.wrap = false
opt.fillchars = { eob = " " }

-- Clipboard
opt.clipboard = "unnamedplus"

-- Backspace
opt.backspace = "indent,eol,start"

-- Split windows
opt.splitbelow = true
opt.splitright = true

-- Word boundaries (allow hyphens in words)
opt.iskeyword:append("-")

-- Scrolling
-- opt.scrolloff = 8

-- Undo history
local state_dir = vim.fn.stdpath("state") .. "/nvim"
local undo_dir = state_dir .. "/undo"

vim.fn.mkdir(undo_dir, "p")
opt.undodir = undo_dir
opt.undofile = true

-- Disable swap and backup files
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Performance
opt.updatetime = 50

-- Statusbar
opt.laststatus = 2
opt.showmode = true
opt.ruler = true
opt.statusline = "%f %m %r %= %y %l:%c %p%%"

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 200,
        })
    end,
})

