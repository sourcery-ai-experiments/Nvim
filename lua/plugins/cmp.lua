return {
  "hrsh7th/nvim-cmp",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "SirVer/ultisnips",
    --"hrsh7th/cmp-vsnip",
    --"hrsh7th/vim-vsnip",
    "quangnguyen30192/cmp-nvim-ultisnips",
    "honza/vim-snippets",
    "onsails/lspkind.nvim",
    "sillybun/zyt-snippet",
    "octaltree/cmp-look",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

    -- set icons for completion
    lspkind.init({
      mode = "symbol_text",
      preset = "codicons",
      symbol_map = {
        Text = "",
        Method = "ƒ",
        Function = "",
        Constructor = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "",
        File = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
      },
    })

    cmp.setup({
      --snippet engine
      snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
          --vim.fn["vsnip#anonymous"](args.body)
        end,
      },

      --completion window
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      --mapping keys
      mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
        end, {
          "i",
          "s", --[[ "c" (to enable the mapping in command mode) ]]
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          cmp_ultisnips_mappings.jump_backwards(fallback)
        end, {
          "i",
          "s", --[[ "c" (to enable the mapping in command mode) ]]
        }),
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm()
          else
            fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
          end
        end, {
          "i",
          "s",
        }),
      },

      --completion sources
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "ultisnips" },
      }, {
        --{name="buffer"},
        {
          name = "look",
          keyword_length = 2,
          option = {
            convert_case = true,
            loud = true,
          },
        },
      }),

      --set lsp icons
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
          before = function(entry, vim_item)
            vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
            return vim_item
          end,
        }),
      },
    })

    -- set configure for specifc filetype
    --cmp.setup.filetype()

    --use buffer souece for "/"
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        --{ name = "buffer" },
      },
    })

    --use cmdline and path source for :
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end
}
