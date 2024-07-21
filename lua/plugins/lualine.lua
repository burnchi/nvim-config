local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local function truncate_branch_name(branch)
        if not branch or branch == "" then
          return ""
        end

        -- Match the branch name to the specified format
        local user, team, ticket_number = string.match(branch, "^(%w+)/(%w+)%-(%d+)")

        -- If the branch name matches the format, display {user}/{team}-{ticket_number}, otherwise display the full branch name
        if ticket_number then
          return user .. "/" .. team .. "-" .. ticket_number
        else
          return branch
        end
      end

      -- judge buffer is empty or not
      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      require("lualine").setup({
        options = {
          globalstatus = true,
          -- section内部的分隔符
          -- component_separators = { left = "", right = "" },
          -- disable separators
          component_separators = "",
          -- 左右section之间的分隔符
          -- section_separators = { left = "█", right = "█" },
          section_separators = "",
          -- 主题
          -- theme = "material",
        },
        -- different area display different things
        sections = {
          lualine_b = {
            { "branch", icon = "", fmt = truncate_branch_name },
            {
              "diff",
              symbols = { added = " ", modified = "󰝤 ", removed = " " },
              diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
              },
              cond = conditions.hide_in_width,
            },
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " " },
              diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.cyan },
              },
            },
          },
          lualine_c = {
            { "filename", path = 1, color = { fg = colors.orange } },
            { "filesize", cond = conditions.buffer_not_empty, color = { fg = colors.red } },
          },
          lualine_x = {
            { "encoding", color = { fg = colors.orange } },
            {
              "filetype",
              color = { fg = colors.violet },
            },
          },
        },
      })
    end,
  },
}
