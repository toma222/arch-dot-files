
local opts = {noremap = true, silent = true}
local map = vim.keymap.set
-- Setup
require("buffer_manager").setup({
  select_menu_item_commands = {
    v = {
      key = "<leader>v",
      command = "vsplit"
    },
    h = {
      key = "<C-o>",
      command = "split"
    }
  },
  focus_alternate_buffer = false,
  short_file_names = true,
  short_term_names = true,
  loop_nav = false,
})

-- Navigate buffers bypassing the menu
local bmui = require("buffer_manager.ui")
local keys = '1234567890'
for i = 1, #keys do
  local key = keys:sub(i,i)
  map(
    'n',
    string.format('<leader>%s', key),
    function () bmui.nav_file(i) end,
    opts
  )
end
-- Just the menu
map({ 't', 'n' }, '<M-Space>', bmui.toggle_quick_menu, opts)
-- Open menu and search
map({ 't', 'n' }, '<M-m>', function ()
  bmui.toggle_quick_menu()
  -- wait for the menu to open
  vim.defer_fn(function ()
    vim.fn.feedkeys('/')
  end, 50)
end, opts)
-- Next/Prev

map('n', '<M-j>', bmui.nav_next, opts)
map('n', '<M-k>', bmui.nav_prev, opts)

vim.keymap.set('n', '<leader>w', ':split<CR>', opts)
vim.keymap.set('n', '<leader>a', ':vsplit<CR>', opts)
vim.keymap.set('n', '<leader>q', ':close<CR>', opts)

map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
