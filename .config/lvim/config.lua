-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.keys.normal_mode['<leader>x'] = ":BufferKill<CR>"
lvim.keys.normal_mode['<C-d>'] = "<C-d>zz"
lvim.keys.normal_mode['<C-u>'] = "<C-u>zz"
lvim.keys.normal_mode['<Tab>'] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode['<S-Tab>'] = ":BufferLineCyclePrev<CR>"

lvim.builtin.nvimtree.setup.sync_root_with_cwd = false
lvim.builtin.nvimtree.setup.respect_buf_cwd = false


lvim.plugins = {
  {
    "Exafunction/windsurf.vim",
    event = "BufEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<C-l>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-j>", function() return vim.fn end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-k>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
    end,
  },
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup({
        auto_update        = true,
        neovim_image_text  = "Vim",
        main_image         = "vim",
        enable_line_number = true,
        buttons            = {
            { label = "GitHub", url = "https://github.com/kipoha" }
        },
      })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
}

lvim.builtin.nvimtree.setup.view = {
    side = "right",
    width = 30,
}

local lspconfig = require('lspconfig')

lspconfig.elixirls.setup{
  cmd = { "elixir-ls" },
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = true,
      enableTestLenses = true,
      suggestSpecs = true,
    },
  },
}


-- lspconfig.pyright.setup({
--   root_dir = function(fname)
--     return lspconfig.util.find_git_ancestor(fname)
--       or lspconfig.util.root_pattern("pyproject.toml", "setup.py", "requirements.txt", ".git")(fname)
--       or vim.fn.getcwd()
--   end,
--   settings = {
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--         diagnosticMode = "openFilesOnly",
--         extraPaths = { vim.fn.getcwd() }
--       }
--     }
--   }
-- })


vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.isdirectory(".git") == 1 then
      vim.cmd("Gitsigns toggle_current_line_blame")
    end
  end,
})

