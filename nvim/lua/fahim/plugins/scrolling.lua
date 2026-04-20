
return{
  "karb94/neoscroll.nvim",
  event = "WinScrolled",

  config = function()
    require("neoscroll").setup({
      easing_function = "cubic", -- you can try 'cubic', 'sine', 'circle', etc.
      hide_cursor = true,            -- hide cursor while scrolling
      stop_eof = true,               -- stop at <EOF> instead of scrolling past
    })
  end,
}
