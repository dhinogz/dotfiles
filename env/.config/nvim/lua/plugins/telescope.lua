return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "flex",
        layout_config = { height = 0.95, width = 0.95, horizontal = { preview_width = 0.7 }, prompt_position = "top" },
        path_display = { truncate = 3 },
        sorting_strategy = "ascending",
      },
    },
  },
}
