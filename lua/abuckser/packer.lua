local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

--local cmd = require('pckr.loader.cmd')
--local keys = require('pckr.loader.keys')

bootstrap_pckr()

require('pckr').add{
  'nvim-lua/plenary.nvim';

  {'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires =  {'nvim-lua/plenary.nvim'} 
    };

    ({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    });

    
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
  {'theprimeagen/harpoon'};
  {'mbbill/undotree'};
  {'tpope/vim-fugitive'};
  {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lua'},
    {'saadparwaiz1/cmp_luasnip'},
    {'rafamadriz/friendly-snippets'},
  {'L3MON4D3/LuaSnip'},
  }
}

}

--use {'nvim-lua/plenary.nvim'}

--use {
--  'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                            , branch = '0.1.x',
--  requires = { {'nvim-lua/plenary.nvim'} }
--}
