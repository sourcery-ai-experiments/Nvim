local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<A-m>', ":NvimTreeToggle", {buffer=bufnr})

  -- mappings
  -- Files
  vim.keymap.set('n', 'a',        api.fs.create,      opts('Create'))
  vim.keymap.set('n', 'd',        api.fs.remove,      opts('Delete'))
  vim.keymap.set('n', 'r',        api.fs.rename,      opts('Rename'))
  vim.keymap.set('n', '<C-x>',    api.fs.cut,         opts('Cut'))
  vim.keymap.set('n', '<C-c>',    api.fs.copy,        opts('Copy'))
  vim.keymap.set('n', '<C-p>',    api.fs.paste,       opts('Paste'))
  vim.keymap.set('n', 'v',    api.open.vertical,      opts('Open: Vertical Split'))
  vim.keymap.set('n', 'h',    api.open.horizontal,    opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'o',    api.node.tab,           opts('Open: New Tab'))
  vim.keymap.set('n', '<TAB>',api.node.open.preview,  opts('Open Preview'))

  -- Dir Operations
  vim.keymap.set('n', '<Enter>',  api.node.open.tab,  opts('Open: New Tab'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.tab, opts('Open'))
  vim.keymap.set('n', 'cd', api.tree.chang_root_to_node, opts('CD'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.chang_root_to_node, opts('CD'))
  vim.keymap.set('n', '-', api.change_root_to_parent, opts('CD ..'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.chang_root_to_node, opts('CD'))

end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
  event = "User DirOpened",
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      on_attach = my_on_attach,
      disable_netrw = true,
      git = {
        enable = true,
      },
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      actions = {
        open_file = {
          resize_window = true,
          quit_on_open = false,
        },
      }
    })
  end,
}
