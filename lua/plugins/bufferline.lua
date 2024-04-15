return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
    config = function()
      require("bufferline").setup({
        options = {
          -- sidebar
          offsets = {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          },
        }
      })
    end,
}
