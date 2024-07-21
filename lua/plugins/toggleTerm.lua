-- terminal
function _G.set_terminal_keymaps()
  -- exit terminal mode
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
  vim.keymap.set("t", "jk", [[<C-\><C-n>]])
end

-- terminal mode bind keymap
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = "ToggleTerm",
  -- 2C-t open second terminal
  keys = {
    {
      [[<C-t>]],
      function()
        local count = vim.v.count2
        require("toggleterm").toggle(count, 16, vim.loop.cwd(), "horizontal")
      end,
      desc = "ToggleTerm (horizontal)",
    },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 20
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<C-t>]],
    -- direction = "horizontal",
    direction = "vertical",
    -- is same as colorscheme
    shade_terminals = false,
    insert_mappings = true,
    terminal_mappings = true,
    start_in_insert = true,
    close_on_exit = false,
  },
}
