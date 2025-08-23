return {
  {
    "catppuccin/nvim",
    name = "catppuccin", -- important so Lazy recognizes it
    priority = 1000,     -- load before other plugins
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {     -- optional, can override per mode
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          cmp = true,
          gitsigns = true,
          telescope = true,
          nvimtree = true,
          which_key = true,
        },
      })

      -- load the Catppuccin colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
