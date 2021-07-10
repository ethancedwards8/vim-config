-- Aliases
local fn = vim.fn
local g = vim.g
local map = vim.api.nvim_set_keymap

--- Basic config

-- Basic settings
vim.cmd('syntax enable')
vim.cmd('set nowrap')
vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.incsearch = true

-- Tab/indentation options
vim.opt.expandtab = true

-- Bar settings
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.ruler = true

-- Undofile
vim.opt.undofile = true

--- Keymaps

-- Leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Window jupming
vim.api.nvim_set_keymap('n', '<leader>wh', ':wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wj', ':wincmd j<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wk', ':wincmd k<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wl', ':wincmd l<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wc', ':wincmd c<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wv', ':wincmd v<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ws', ':wincmd s<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wo', ':wincmd o<CR>', {noremap = true})

-- Explore
vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', {noremap = true})

-- Jump to last file
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':e #<CR>', {noremap = true})

-- Misc
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap=true})

--- Misc settings

-- Autocmd
-- vim.api.nvim_command('autocmd BufWritePre * :%s/\s\+$//e') FIXME

--- Plugins

-- auto install packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- packages
return require('packer').startup({function(use)
        -- let packer manage itself
        use {
                'wbthomason/packer.nvim',
                config = function()
                        vim.cmd "autocmd BufWritePost init.lua PackerCompile"
                end
        }

        use {
                'junegunn/fzf.vim',
                requires = {
                        'junegunn/fzf'
                },
                config = function()
                        -- FZF
                        vim.api.nvim_set_keymap('n', '<leader>f', ':FZF<CR>', {noremap = true})
                end
        }

        use {
                'airblade/vim-rooter',
                config = function()
                        -- Vim rooter
                        vim.g['rooter_patterns'] = {'.git'}
                end
        }

        use {
                'tpope/vim-commentary',
        }

        use {
                'ap/vim-css-color'
        }

        use {
                'tpope/vim-fugitive',
                config = function()
                        -- Fugitive mappings
                        vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', {noremap=true})
                        vim.api.nvim_set_keymap('n', '<leader>gu', ':Git push<CR>', {noremap=true})
                        vim.api.nvim_set_keymap('n', '<leader>gp', ':Git pull<CR>', {noremap=true})
                        vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', {noremap=true})
                end
        }

        use {
                'vifm/vifm.vim'
        }

        use {
                'itchyny/lightline.vim'
        }

        use {
                'machakann/vim-highlightedyank'
        }

        use {
                'preservim/nerdtree',
                config = function()
                        -- Nerdtree
                        vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', {noremap=true})
                end
        }

        use {
                'lervag/vimtex',
                config = function()
                        -- latex
                        vim.g['tex_flavor'] = 'latex'

                end
        }

        use {
                'LnL7/vim-nix'
        }
end
})
