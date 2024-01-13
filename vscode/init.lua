local vscode = require("vscode-neovim")
vim.notify = vscode.notify

vim.notify("start, init.lua")

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- clipboard -- vim.opt.clipboard:append("unnamedplus") yank to system clipboard from vim
vim.opt.clipboard = "unnamedplus"

-- enable virtual edit in block mode (<C-v>)
vim.opt.virtualedit = "block"

vim.opt.hlsearch = false
vim.opt.incsearch = true
-- view a preview of search and replace in a split
vim.opt.inccommand = "split"

-- apperance
vim.opt.signcolumn = "yes"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoindent = true
vim.opt.smartindent = true

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

vim.g.mapleader = " "


---- Remaps ----
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "x", "\"_x")

-- Move line/selection up/down
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")


-- LSP actions
vim.keymap.set("n", '<leader>gd', function() vscode.action("editor.action.revealDefinition") end, { desc = '[G]oto [D]efinition' })
vim.keymap.set("n", '<leader>gi', function() vscode.action("editor.action.goToImplementation") end, { desc = '[G]oto [I]mplementation' })
vim.keymap.set("n", '<leader>go', function() vscode.action("editor.action.goToTypeDefinition") end, { desc = 'Type Definition' })
vim.keymap.set("n", '<leader>gr', function() vscode.action("editor.action.goToReferences") end, { desc = '[G]oto [R]eferences' })

vim.keymap.set("n", "K", function() vscode.action("editor.action.marker.prev") end, { desc = "Hover Documentation" })
vim.keymap.set("n", "<C-k>", function() vscode.action("editor.action.triggerParameterHints") end, { desc = "Signature Documentation" })

vim.keymap.set("n", "<leader>sds", function() vscode.action("workbench.action.showAllSymbols") end, { desc = "[S]earch [D]ocument [S]ymbols" })
vim.keymap.set("n", "<leader>sdS", function() vscode.action("workbench.action.showAllSymbols") end, { desc = "Workspace Symbols" })

vim.keymap.set("n", "<leader>re", function() vscode.action("editor.action.rename") end, { desc = "" })
vim.keymap.set("n", "<leader>ca", function() vscode.action("editor.action.quickFix") end, { desc = "" })

vim.keymap.set("n", "<leader>=", function() vscode.action("editor.action.formatDocument") end, { desc = "format document" })


vim.keymap.set('n', '[d', function() vscode.action("editor.action.marker.prev") end, { desc = "Go to previous problem" })
vim.keymap.set('n', ']d', function() vscode.action("editor.action.marker.next") end, { desc = "Go to next problem" })
vim.keymap.set('n', '<leader>e', function() vscode.action("editor.action.showHover") end, { desc = "Open problem float" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Auto completion + snippets
-- <C-p/n> mapped by default
vim.keymap.set("n", "<C-y>", function() vscode.action("acceptSelectedCodeAction") end, { desc = "Accept selected code action" })
vim.keymap.set({ 'i', 's' }, '<C-f>', function() vscode.action('jumpToNextSnippetPlaceholder') end, { desc = "Jump to next snippet" })
vim.keymap.set({ 'i', 's' }, '<C-b>', function() vscode.action('jumpToPrevSnippetPlaceholder') end, { desc = "Jump to previous snippet" })


-- Find / Telescope
vim.keymap.set('n', '<leader>sf', function() vscode.action("workbench.action.quickOpen") end, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', '<leader>sb', function() vscode.action("workbench.action.quickOpenLeastRecentlyUsedEditor") end, { desc = "[S]earch [B]uffers" })
vim.keymap.set('n', '<leader>sB', function() vscode.action("workbench.action.quickOpenPreviousRecentlyUsedEditor") end, { desc = "[S]earch [B]uffers" })
vim.keymap.set('n', '<leader>stw', function()
    vscode.action("editor.action.addSelectionToNextFindMatch")
    vscode.action("workbench.action.findInFiles")
end, { desc = "[S]earch [T]ext by current [W]ord" })
vim.keymap.set('n', '<leader>stg', function() vscode.action("workbench.action.experimental.quickTextSearch") end, { desc = "[S]earch [T]ext by [G]rep" })
vim.keymap.set('n', '<leader>sgf', function() vscode.action("") end, { desc = "[S]earch [G]it [F]iles" })


-- terminal -- <C-`> default vscode keybinding
vim.keymap.set('n', '<leader>tt', function() vscode.action("workbench.action.terminal.toggleTerminal") end, { desc = "[T]oggle [T]erminal" })


-- file explorer
vim.keymap.set('n', '<leader>we', function() vscode.action("workbench.action.toggleSidebarVisibility") end, { desc = "Window/Explorer toggle" })
vim.keymap.set('n', '<leader>ws', function() vscode.action("workbench.files.action.showActiveFileInExplorer") end, { desc = "Window/Explorer toggle" })


-- diagnostic / problems
vim.keymap.set('n', '<leader>xx', function() vscode.action("workbench.actions.view.problems") end, { desc = "Toggle show all diagnostics" })


-- debugging
vim.keymap.set('n', '<leader>tb', function() vscode.action("editor.debug.action.toggleBreakpoint") end, { desc = "Toggle breakpoint"})
vim.keymap.set('n', '<leader>tB', function() vscode.action("editor.debug.action.toggleInlineBreakpoint") end, { desc = "Toggle breakpoint"})


vim.notify("end, init.lua")
