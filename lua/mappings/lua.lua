local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- keybind list
map("", "<leader>c", '"+y')
map("i", "jj", "<Esc>")
map("n", "<leader>z", ":luafile $MYVIMRC <CR>")

-- open terminals  
map("n", "<C-b>" , [[<Cmd> vnew term://zsh<CR>]] , opt) -- split term vertically , over the right  
map("n", "<C-x>" , [[<Cmd> split term://zsh| resize 10 <CR>]] , opt) -- split term vertically , over the right  

-- windows
map("n", "<leader>w", "<C-w>v")

-- search
map("n", "<leader>,", ":noh <CR>")

-- quickfix list
map("n", "<C-j>,", ":cnext <CR>")
map("n", "<C-k>,", ":cprev <CR>")

