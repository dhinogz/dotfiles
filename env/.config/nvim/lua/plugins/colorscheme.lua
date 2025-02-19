return {
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup({
        transparent = true,
        code_style = {
          comments = { italic = true },
          conditionals = { italic = false },
        },
        lualine = {
          transparent = true,
        },
        highlights = {
          ["@comment"] = { fg = "#696969" },
        },
      })
    end,
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "bamboo" } },
}
