--function
function TerminalM()
    vim.cmd(":ToggleTerm size=40 dir=~/Desktop direction=float name=desktop")
end

--detect command
vim.cmd('command! Terminal lua TerminalM()')

--keymap to start the Terminal
vim.keymap.set('n', "<Leader>t", ":Terminal<CR>")


return {
  {'akinsho/toggleterm.nvim', version = "*", config = true}

}
