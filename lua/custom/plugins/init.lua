-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
local plugins = {
  {
    'yamatsum/nvim-cursorline',
    opts = {},
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      'neoclide/coc.nvim',
    },
    opts = function()
      vim.o.foldcolumn = '0' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    end,
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_view_general_viewer = 'okular'
      vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
    end,
  },
  -- {
  --   'akinsho/bufferline.nvim',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   init = function()
  --     vim.opt.termguicolors = true
  --     vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
  --     vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
  --     vim.keymap.set('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>')
  --     vim.keymap.set('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>')
  --     vim.keymap.set('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>')
  --     vim.keymap.set('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>')
  --     vim.keymap.set('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>')
  --     vim.keymap.set('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>')
  --     vim.keymap.set('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>')
  --     vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>')
  --     vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>')
  --   end,
  --   opts = {
  --     options = {
  --       separator_style = 'slant',
  --       offsets = {
  --         filetype = 'neo-tree',
  --         text = 'File Explorer',
  --         highlight = 'Directory',
  --         text_align = 'left',
  --       },
  --     },
  --   },
  -- },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    init = function()
      vim.keymap.set('n', '<A-t>', '<Cmd>ToggleTerm<CR>')
    end,
    opts = {},
  },
  {
    'github/copilot.vim',
  },
  {
    'goolord/alpha-nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    init = function()
      vim.keymap.set('n', '<A-a>', '<Cmd>Alpha<CR>')
    end,
    config = function()
      require('alpha').setup(require('alpha.themes.startify').opts)
    end,
  },
  {
    'hadronized/hop.nvim',
    init = function()
      vim.keymap.set('n', '<A-h>', '<Cmd>HopWord<CR>')
    end,
    opts = {},
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function()
      vim.keymap.set('n', '<Tab>', '<Cmd>bnext<CR>')
      vim.keymap.set('n', '<S-Tab>', '<Cmd>bprev<CR>')
    end,
    opts = {
      options = {
        theme = 'auto',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          {
            'branch',
            separator = { right = '' },
          },
          {
            'diff',
            separator = { right = '' },
          },
          'buffers',
        },
        lualine_c = { '' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },
}

return plugins
