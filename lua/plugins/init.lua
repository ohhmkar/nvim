return {

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Theme
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        integrations = {
          cmp = true,
          gitsigns = true,
          neotree = true,
          treesitter = true,
          telescope = { enabled = true },
          lsp_trouble = true,
          which_key = true,
          mason = true,
          dap = { enabled = true, enable_ui = true },
          illuminate = { enabled = true },
          native_lsp = {
            enabled = true,
            underlines = {
              errors      = { "undercurl" },
              hints       = { "undercurl" },
              warnings    = { "undercurl" },
              information = { "undercurl" },
            },
          },
        },
      }
    end,
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Dashboard
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "nvimdev/dashboard-nvim",
    cmd = "Dashboard",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup {
        theme = "doom",
        config = {
          header = {
            "",
            "",
            "  ██████╗ ███╗   ███╗██╗  ██╗ █████╗ ██████╗ ",
            " ██╔═══██╗████╗ ████║██║ ██╔╝██╔══██╗██╔══██╗",
            " ██║   ██║██╔████╔██║█████╔╝ ███████║██████╔╝",
            " ██║   ██║██║╚██╔╝██║██╔═██╗ ██╔══██║██╔══██╗",
            " ╚██████╔╝██║ ╚═╝ ██║██║  ██╗██║  ██║██║  ██║",
            "  ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝",
            "",
            "          welcome back, omkar 👾              ",
            "",
          },
          center = {
            { icon = "  ", desc = "Find File          ", key = "f", action = function() vim.cmd "Telescope find_files" end },
            { icon = "  ", desc = "New File           ", key = "n", action = function() vim.cmd "enew" end },
            { icon = "  ", desc = "Recent Files       ", key = "r", action = function() vim.cmd "Telescope oldfiles" end },
            { icon = "  ", desc = "Find Word          ", key = "w", action = function() vim.cmd "Telescope live_grep" end },
            { icon = "  ", desc = "Open Folder        ", key = "o", action = function() vim.cmd("Telescope find_files cwd=" .. vim.fn.input("Folder: ", "~/", "dir")) end },
            { icon = "  ", desc = "File Tree          ", key = "e", action = function() vim.cmd "Neotree toggle" end },
            { icon = "  ", desc = "LazyGit            ", key = "g", action = function() vim.cmd "LazyGit" end },
            { icon = "  ", desc = "Edit Config        ", key = "c", action = function() vim.cmd "edit ~/.config/nvim/lua/plugins/init.lua" end },
            { icon = "󰒲  ", desc = "Lazy               ", key = "l", action = function() vim.cmd "Lazy" end },
            { icon = "  ", desc = "Quit               ", key = "q", action = function() vim.cmd "qa" end },
          },
          footer = {
            "",
            "  omkar's nvim — built different ⚡",
          },
        },
      }
    end,
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- LSP
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Global defaults for all LSP servers
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Lua-specific settings (stop complaining about vim global)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      -- Enable all servers (jdtls is managed by nvim-jdtls plugin)
      vim.lsp.enable({
        "pyright",       -- Python
        "clangd",        -- C/C++
        "rust_analyzer", -- Rust
        "bashls",        -- Bash
        "lua_ls",        -- Lua
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "pyright", "clangd", "rust_analyzer", "bashls", "lua_ls",
        },
        automatic_installation = true,
      }
    end,
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Completion
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup {
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-k>"]     = cmp.mapping.select_prev_item(),
          ["<C-j>"]     = cmp.mapping.select_next_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<CR>"]      = cmp.mapping.confirm { select = true },
          ["<Tab>"]     = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Treesitter
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "c", "cpp", "rust", "python", "java",
        "bash", "lua", "yaml", "toml", "json", "markdown",
      },
    },
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- File Tree
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("neo-tree").setup {
        close_if_last_window = true,
        window = { width = 30 },
        filesystem = {
          filtered_items = {
            hide_dotfiles   = false,
            hide_gitignored = true,
          },
          follow_current_file = { enabled = true },
        },
      }
    end,
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Telescope
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup {
        extensions = { fzf = {} },
        defaults = {
          prompt_prefix   = "   ",
          selection_caret = "  ",
          path_display    = { "smart" },
        },
      }
      require("telescope").load_extension "fzf"
    end,
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Git
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "󰍵" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
        },
        current_line_blame = true,
      }
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Debugging
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  { "mfussenegger/nvim-dap" },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"]     = function() dapui.close() end
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-python").setup(
        vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
      )
    end,
  },

  -- Java
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      require("jdtls").start_or_attach {
        cmd = {
          vim.fn.stdpath "data" .. "/mason/bin/jdtls",
          "-data", vim.fn.stdpath "data" .. "/jdtls-workspace/"
            .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
        },
        root_dir = vim.fs.dirname(
          vim.fs.find({ "pom.xml", "build.gradle", ".git" }, { upward = true })[1]
        ),
      }
    end,
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Formatting
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          python = { "black", "isort" },
          c      = { "clang_format" },
          cpp    = { "clang_format" },
          rust   = { "rustfmt" },
          sh     = { "shfmt" },
          bash   = { "shfmt" },
          lua    = { "stylua" },
          yaml   = { "prettier" },
          json   = { "prettier" },
        },
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
      }
    end,
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Quality of Life
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("trouble").setup() end,
  },

  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("illuminate").configure {
        delay = 100,
        filetypes_denylist = { "neo-tree", "TelescopePrompt", "dashboard" },
      }
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup() end,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup {
        options = {
          theme = "catppuccin",
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators   = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },

}
