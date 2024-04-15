return {
  "nvim-treesitter/nvim-treesitter", 
  event = "VeryLazy",
  build = ":TSUpdate",
  dependencies = { "p00f/nvim-ts-rainbow" },
  config = function()
   require("nvim-treesitter.configs").setup({
      ensure_installed = { 
        "c", "lua", "cpp", "python", "go", 
        "markdown", "markdown_inline", "bash", "rust", 
        "toml", "json", "diff", "make" 
      },
      highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- 启用增量选择模块
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>",
        }
      },
      indent = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    })
  end,
}

