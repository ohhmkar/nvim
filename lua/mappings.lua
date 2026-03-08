require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("n", "<Esc>",       "<cmd>noh<cr>",           { desc = "Clear search highlight" })
map("n", "<C-s>",       "<cmd>w<cr>",             { desc = "Save file" })
map("n", "<leader>q",   "<cmd>bd<cr>",            { desc = "Close buffer" })
map("v", "J",           ":m '>+1<cr>gv=gv",       { desc = "Move selection down" })
map("v", "K",           ":m '<-2<cr>gv=gv",       { desc = "Move selection up" })
map("n", "<C-d>",       "<C-d>zz",                { desc = "Scroll down centered" })
map("n", "<C-u>",       "<C-u>zz",                { desc = "Scroll up centered" })
map("n", "n",           "nzzzv",                  { desc = "Next search centered" })
map("n", "N",           "Nzzzv",                  { desc = "Prev search centered" })
map("v", "<",           "<gv",                    { desc = "Indent left" })
map("v", ">",           ">gv",                    { desc = "Indent right" })
map("v", "<leader>p",   '"_dP',                   { desc = "Paste without yanking" })

-- Windows
map("n", "<leader>sv",  "<cmd>vsplit<cr>",        { desc = "Split vertical" })
map("n", "<leader>sh",  "<cmd>split<cr>",         { desc = "Split horizontal" })

-- File tree
map("n", "<leader>e",   "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })

-- Telescope
map("n", "<leader>ff",  "<cmd>Telescope find_files<cr>",  { desc = "Find files" })
map("n", "<leader>fg",  "<cmd>Telescope live_grep<cr>",   { desc = "Live grep" })
map("n", "<leader>fb",  "<cmd>Telescope buffers<cr>",     { desc = "Buffers" })
map("n", "<leader>fr",  "<cmd>Telescope oldfiles<cr>",    { desc = "Recent files" })
map("n", "<leader>fk",  "<cmd>Telescope keymaps<cr>",     { desc = "Keymaps" })

-- Git
map("n", "<leader>gg",  "<cmd>LazyGit<cr>",              { desc = "LazyGit" })
map("n", "]h",          "<cmd>Gitsigns next_hunk<cr>",   { desc = "Next hunk" })
map("n", "[h",          "<cmd>Gitsigns prev_hunk<cr>",   { desc = "Prev hunk" })
map("n", "<leader>hs",  "<cmd>Gitsigns stage_hunk<cr>",  { desc = "Stage hunk" })
map("n", "<leader>hr",  "<cmd>Gitsigns reset_hunk<cr>",  { desc = "Reset hunk" })
map("n", "<leader>hb",  "<cmd>Gitsigns blame_line<cr>",  { desc = "Blame line" })
map("n", "<leader>hd",  "<cmd>Gitsigns diffthis<cr>",    { desc = "Diff this" })

-- LSP
map("n", "<leader>ca",  vim.lsp.buf.code_action,         { desc = "Code action" })
map("n", "<leader>rn",  vim.lsp.buf.rename,              { desc = "Rename symbol" })
map("n", "gd",          vim.lsp.buf.definition,          { desc = "Go to definition" })
map("n", "gr",          vim.lsp.buf.references,          { desc = "References" })
map("n", "K",           vim.lsp.buf.hover,               { desc = "Hover docs" })
map("n", "<leader>ld",  vim.diagnostic.open_float,       { desc = "Line diagnostics" })

-- DAP
map("n", "<leader>db",  "<cmd>DapToggleBreakpoint<cr>",              { desc = "Toggle breakpoint" })
map("n", "<leader>dc",  "<cmd>DapContinue<cr>",                      { desc = "Continue" })
map("n", "<leader>di",  "<cmd>DapStepInto<cr>",                      { desc = "Step into" })
map("n", "<leader>do",  "<cmd>DapStepOver<cr>",                      { desc = "Step over" })
map("n", "<leader>dO",  "<cmd>DapStepOut<cr>",                       { desc = "Step out" })
map("n", "<leader>dt",  "<cmd>DapTerminate<cr>",                     { desc = "Terminate" })
map("n", "<leader>du",  function() require("dapui").toggle() end,    { desc = "Toggle DAP UI" })

-- Trouble
map("n", "<leader>xx",  "<cmd>TroubleToggle<cr>",                       { desc = "Toggle Trouble" })
map("n", "<leader>xw",  "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace diagnostics" })
map("n", "<leader>xd",  "<cmd>TroubleToggle document_diagnostics<cr>",  { desc = "Document diagnostics" })

-- :Omkar personal command
vim.api.nvim_create_user_command("Omkar", function()
  vim.cmd "Dashboard"
  vim.defer_fn(function()
    vim.api.nvim_echo({
      { "  omkar's nvim — ", "Normal" },
      { tostring(#vim.tbl_keys(package.loaded)) .. " modules loaded", "Special" },
      { "  •  ", "Comment" },
      { os.date "%H:%M", "Number" },
    }, false, {})
  end, 100)
end, { desc = "Omkar's personal dashboard" })
