return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>e",
      "<cmd>NvimTreeToggle<CR>",
      desc = "toggle NvimTree"
    },
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      filters = {
        git_ignored = false
      },
      -- 自动展开当前文件的文件夹
      update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = true,
        ignore_list = {},
      },
    })
  end,
}
