vim.opt.nu = true -- number
vim.opt.rnu = true -- relativenumber
vim.opt.swf = false -- swapfile
vim.opt.hls = false -- highlight search
vim.opt.ic = true -- ignorecase
vim.opt.scs = true -- smartcase
vim.opt.is = true -- incremental search
vim.opt.sw = 4 -- shiftwidth
vim.opt.ts = 4 -- tabstop
vim.opt.sts = 4 -- softtabstop
vim.opt.et = true -- expandtab
vim.opt.sta = true -- smarttab
vim.opt.bri = true -- breakindent
vim.opt.si = true -- smartindent
vim.opt.ai = true -- autoindent
vim.opt.scl = "yes" -- signcolumn
vim.opt.wb = false -- writebackup
vim.opt.so = 10 -- scrolloff
vim.opt.ut = 50 -- updatetime
vim.opt.tgc = true -- termguicolors
vim.opt.cul = true -- cursorline
vim.opt.fcs = { eob = " " } -- fillchars
vim.opt.cot = "menuone,noselect" -- completeopt
vim.opt.udir = os.getenv("HOME") .. "/.local/share/nvim/undo" -- undodir
vim.opt.undofile = true
vim.opt.filetype = "on"
vim.opt.shell = os.getenv("SHELL")
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.guicursor =
	"n-v-c:beam,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
