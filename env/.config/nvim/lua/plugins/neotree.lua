return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      { "<leader>e", false },
      { "\\", "<cmd>Neotree position=float reveal<cr>", { desc = "NeoTree reveal" } },
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
        window = {
          mappings = {
            ["\\"] = "close_window",
          },
        },
      },
    },
  },
}
