return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      --      transparent_background = false,
    },
  },
  {
    --"rafi/awesome-vim-colorschemes",
    "flazz/vim-colorschemes",
  },
  {
    "yorik1984/newpaper.nvim",
  },
  { "yorickpeterse/vim-paper" },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    opts = {
      transparent = false,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "day" },
  },
  {
    "sainnhe/edge",
    name = "edge",
    opts = {
      edge_transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "newpaper",
    },
  },
}
