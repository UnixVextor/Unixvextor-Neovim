return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "html",
        "css",
        "prisma",
        "terraformls",
        "hcl",
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-media-files.nvim",
    },
    config = function()
      require("telescope").setup {
        extensions = {
          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg",
          },
        },
      }
      require("telescope").load_extension "lazygit"
      require("telescope").load_extension "media_files"
    end,
  },

  {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
      require("distant"):setup()
    end,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      picker = { enabled = true },
      indent = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      image = { enabled = true },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    ft = "python", -- Load when opening Python files
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
    },
    opts = { -- this can be an empty lua table - just showing below for clarity.
      search = {
        fd = {
          command = "fd 'python$' . --full-path -IH -a",
        },
      },
      options = {}, -- if you add plugin options, they go here.
    },
  },
}
