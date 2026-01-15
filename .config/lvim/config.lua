-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "nordfox"
lvim.transparent_window = true
vim.wo.relativenumber = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<ESC>"] = ":noh<ESC>"
lvim.keys.normal_mode["<tab>"] = ":bnext<cr>"
lvim.keys.normal_mode["<s-tab>"] = ":bprev<cr>"
lvim.keys.normal_mode["<leader>x"] = ":wq<cr>"
lvim.keys.normal_mode["<leader>bc"] = ":bd<cr>"
lvim.keys.normal_mode["<leader>y"] = ":cclose<cr>"
lvim.keys.normal_mode["<leader>br"] = ":bufdo e<cr>"

-- execute command `npm run lint -- --fix` in terminal and refresh the buffer
lvim.keys.normal_mode["<leader>lx"] = ":!npm run lint -- --fix %<cr>:e!<cr>"

-- Copilot
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true, })
-- vim.cmd("inoremap <C-j> <Plug>(copilot-next)")

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = args.buf })
  end,
})

-- colorcolumn
vim.cmd("set colorcolumn=80")
vim.cmd("hi ColorColumn ctermbg=0 guibg=lightgrey")

-- disable undo file
vim.cmd("set noundofile")

-- prevent typing ":" from indenting
vim.cmd("autocmd FileType python setlocal indentkeys-=<:>")
vim.cmd("autocmd FileType python setlocal indentkeys-=:")

-- Lunarvim settings
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- treesitter parsers
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "dart",
  "go",
  "php",
  "html",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- set formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = {
      "javascript",
      "typescript",
      "typescriptreact",
      "liquid",
      "json",
      "yaml",
      "html",
      "css",
      "scss",
    }
  },
  -- for php
  {
    command = "phpcbf",
    args = { "--standard=PSR12" },
    filetypes = { "php" }
  },
  -- { command = "autopep8", filetypes = { "python" } },
  { command = "yapf", filetypes = { "python" } },
  -- formatter for gofmt
  {
    command = "gofmt",
    filetypes = { "go" },
    -- args = { "-w", "80" },
    stdin = false,
  },
}


-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "eslint", filetypes = { "typescript", "javascript", "typescriptreact" } },
  { exe = "phpcs",  args = { "--standard=PSR12" },                                filetypes = { "php" } },
}

-- Additional Plugins
lvim.plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    version = "v0.9.5", -- replace with stable hash
    build = ":TSUpdate",
  },
  { "prisma/vim-prisma" },
  { "ellisonleao/gruvbox.nvim" },
  { "marko-cerovac/material.nvim" },
  { "catppuccin/nvim" },
  { "navarasu/onedark.nvim" },
  { "daschw/leaf.nvim" },
  { "rktjmp/lush.nvim" },
  { "kartikp10/noctis.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "akinsho/flutter-tools.nvim" },
  { "github/copilot.vim" },
  { "tpope/vim-liquid" },
  { "neovim/nvim-lspconfig" },
}

-- -- -- LSP
lvim.lsp.automatic_servers_installation = false
vim.g.markdown_fenced_languages = { "ts=typescript" }

local lsp_manager = require("lvim.lsp.manager")
local nvim_lsp = require("lspconfig")

lsp_manager.setup("intelephense")
lsp_manager.setup("tsserver")
lsp_manager.setup("pyright")
lsp_manager.setup("gopls")
lsp_manager.setup("cssls")
lsp_manager.setup("hml")
lsp_manager.setup("jsonls")
lsp_manager.setup("yamlls")
lsp_manager.setup("vimls")
lsp_manager.setup("bashls")

-- Dart LSP setup
nvim_lsp.dartls.setup {
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local mappings = {
      ['gD'] = 'vim.lsp.buf.declaration()',
      ['gd'] = 'vim.lsp.buf.definition()',
      ['K'] = 'vim.lsp.buf.hover()',
      ['gi'] = 'vim.lsp.buf.implementation()',
      ['<C-k>'] = 'vim.lsp.buf.signature_help()',
      ['<space>wa'] = 'vim.lsp.buf.add_workspace_folder()',
      ['<space>wr'] = 'vim.lsp.buf.remove_workspace_folder()',
      ['<space>wl'] = 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))',
      ['<space>D'] = 'vim.lsp.buf.type_definition()',
      ['<space>rn'] = 'vim.lsp.buf.rename()',
      ['<space>ca'] = 'vim.lsp.buf.code_action()',
      ['gr'] = 'vim.lsp.buf.references()',
      ['[d'] = 'vim.lsp.diagnostic.goto_prev()',
      [']d'] = 'vim.lsp.diagnostic.goto_next()',
    }

    for k, v in pairs(mappings) do
      buf_set_keymap('n', k, '<cmd>lua ' .. v .. '<CR>', opts)
    end
  end
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc", ".md" },
  -- enable wrap mode for json and markdown files
  command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4",
})

-- Copilot
vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true

-- Configure Telescope to ignore certain files
lvim.builtin.telescope = vim.tbl_extend("force", lvim.builtin.telescope, {
  file_ignore_patterns = {
    "vendor/*",
    "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    "%.jpg",
    "%.jpeg",
    "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    ".git/",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".vscode/",
    "__pycache__/",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "target/",
    "%.pdb",
    "%.dll",
    "%.class",
    "%.exe",
    "%.cache",
    "%.ico",
    "%.pdf",
    "%.dylib",
    "%.jar",
    "%.docx",
    "%.met",
    "smalljre_*/*",
    ".vale/",
  }
})
