return{
  "neovim/nvim-lspconfig",
  cmd={"Mason"},
  event={"BufReadPost","BufNewFile"},
  dependencies={
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  keys={},

  config=function()
    local lspconfig=require("lspconfig")
    local mason=require("mason")
    local mason_lspconfig=require("mason-lspconfig")

    -- config mason plugins
    mason.setup({
      -- config ui
      ui={
        --the border use for the ui window,the value is the same as nvim_open_win()
        border="none",
        --Float in the range of 0-1 for a percentage of screen width
        width=0.8,
        --Float in the range of 0-1 for a percentage of screen height
        height=0.8,
        icons={
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },

        -- keymap config
        keymaps = {
            ---@since 1.0.0
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            ---@since 1.0.0
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            ---@since 1.0.0
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            ---@since 1.0.0
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            ---@since 1.0.0
            -- Keymap to update all installed packages
            update_all_packages = "U",
            ---@since 1.0.0
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            ---@since 1.0.0
            -- Keymap to uninstall a package
            uninstall_package = "X",
            ---@since 1.0.0
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            ---@since 1.0.0
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
            ---@since 1.1.0
            -- Keymap to toggle viewing package installation log
            toggle_package_install_log = "<CR>",
            ---@since 1.8.0
            -- Keymap to toggle the help view
            toggle_help = "g?",
        },
      }
    })

    --config mason-lspconfig
    mason_lspconfig.setup({
      --A list of servers to automatically install if they're not already installed
      ensure_installed={
        "lua_ls","texlab",
      },

      -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    automatic_installation = true,

      -- See `:h mason-lspconfig.setup_handlers()`
    ---@type table<string, fun(server_name: string)>?
    -- I don't know what  is the key used for?
    handlers = nil,
    })


    -- start the lsp
    lspconfig.lua_ls.setup({
      settings={
        Lua={
          completion={
            callSnippet="Replace",
          },
        },
      },
    })

    lspconfig.texlab.setup({

    })


  end
}
