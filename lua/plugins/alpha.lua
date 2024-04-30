return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local db = require("alpha.themes.dashboard")
    db.section.header.val = {
      [[]],
      [[]],
      [[.                        .-.                 .;;;;.     .-.     ]],
      [[    .:.   .-..;.   .-.     ;  :.;.       .-.' .;'  `     .;|/:  ]],
      [[     ;;   :   ;;   ;     .;:  : `;     .'    .;'        .;   :  ]],
      [[     ;    ;  ;;    :    .;' \ :  ;;  .'     .;'        .;    :  ]],
      [[ .:' `._.:  ;;     ;.:'.;    \: ;;  ;      .;'     .:'.;     :  ]],
      [[(__.-.;'    `;.__.:(__.'      `.`;.'   .;;;;;;;;;'(__.'      `. ]],
      [[]],
      [[]],
      [[]],
    }

    db.section.buttons.val = {
      db.button("f", "󰮗  Find files", ":Telescope find_files <CR>"),
      db.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      db.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
      db.button("e", "  Configuration", ":e ~/.config/nvim/lua/core/keymaps.lua<CR>"),
      db.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    db.section.footer.val = {
      "Maintain self-respect without arrgorance"
    }

    db.section.header.opts.hl = "Include"
    db.section.buttons.opts.hl = "Keyword"
    db.section.footer.opts.hl = "Type"

    db.opts.opts.noautocmd = true
    alpha.setup(db.opts)
  end,
}


