return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- builtin picker configuration
    local builtin = require('telescope.builtin')
    -- file pickers
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    -- git pickers
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
    vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
    -- vim pickers
    vim.keymap.set('n', '<leader>ht', builtin.keymaps, {})
    -- treesitter picker
    vim.keymap.set('n', '<leader>tt', builtin.treesitter, {})
    -- other usual defalut mappings
    -- <C-c> close telescope (insert mode)
    -- <Esc> close telescope (normal node)
    -- global configuration
    require("telescope").setup {
      defaults = {
        initial_mode = "insert",
        -- 窗口内快捷键
        mappings = {
          i = {
          },
          n = {
          },
          v= {
          },
        },
      },
      -- 内置 pickers 配置
      pickers = {
        picker_name = {
        },
        find_files = {
          theme = "dropdown",
        },
      },
      -- 扩展插件配置
      extensions = {
      },
    }
  end,
}
