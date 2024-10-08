local set = vim.keymap.set

-- set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
-- set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Better window movement
set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
set("n", "<C-Up>", ":resize -2<CR>")
set("n", "<C-Down>", ":resize +2<CR>")
set("n", "<C-Left>", ":vertical resize -2<CR>")
set("n", "<C-Right>", ":vertical resize +2<CR>")

set("i", "jk", "<esc>")
set("i", "kj", "<esc>")
set("i", "JK", "<esc>")
set("i", "KJ", "<esc>")

-- save the buffer
set("n", "<c-s>", ":w<cr>")
set("i", "<c-s>", "<esc>:w<cr>")
set("n", "<leader>q", ":q!<cr>")

-- To open config file
set("n", "<leader>nc", ":tabnew $HOME/.config/nvim/<cr>")

-- Function to run the command based on filetype
function RunCode()
  local filetype = vim.bo.filetype
  local commands = {
    python = 'python %',
    c = 'gcc % && ./a.out',
    cpp = 'g++ % && ./a.out',
    asm = 'gcc % -nostdlib -static && ./a.out',
    sh = 'if [ ! -x % ]; then chmod +x %; fi; ./%',
  }

  local command = commands[filetype]
  if command then
    vim.cmd("w")
    vim.cmd("TermExec cmd='" .. command .. "'")
  else
    print('No run command set for this filetype')
  end
end

set('n', '<F5>', ':lua RunCode()<CR>', { noremap = true, silent = true })
