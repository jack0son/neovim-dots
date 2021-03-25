vim.cmd [[packadd nvim-lspconfig]]
vim.cmd [[packadd nvim-compe]]

local function buf_set_keymap(...)
    -- vim.api.nvim_buf_set_keymap(bufnr, ...)
    vim.api.nvim_set_keymap(...)
end
local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
end

buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

-- Mappings.
local opts = {noremap = true, silent = false}
-- jumps
buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)

-- modify
buf_set_keymap("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", opts)
buf_set_keymap("n", "<leader>la", "<Cmd>lua vim.lsp.bug.code_action()<CR>", opts)

-- diagnostics
buf_set_keymap("n", "<space>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
buf_set_keymap("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
buf_set_keymap("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>", opts)
buf_set_keymap("n", "<space>q", ":lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

-- help
buf_set_keymap("n", "<C-p>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
buf_set_keymap("n", "<space>D", ":lua vim.lsp.buf.type_definition()<CR>", opts)

-- workspace
buf_set_keymap("n", "<space>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
buf_set_keymap("n", "<space>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
buf_set_keymap("n", "<space>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)

local nvim_lsp = require'lspconfig'

--  lsp for html , css and js/ts
nvim_lsp.tsserver.setup {}
nvim_lsp.cssls.setup {}
nvim_lsp.html.setup {}
nvim_lsp.rust_analyzer.setup {
  root_dir = nvim_lsp.util.root_pattern("Cargo.toml")
}
