local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- Base
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

    -- Utils
    use("tpope/vim-commentary")
    use("tpope/vim-surround")
    use("rstacruz/vim-closer")
    use({ "ojroques/nvim-osc52" })

    -- Colorscheme
    use("shaunsingh/nord.nvim")
    use("EdenEast/nightfox.nvim")
    use("rmehri01/onenord.nvim")
    use("Shatur/neovim-ayu")
    use({
        "catppuccin/nvim",
        as = "catppuccin",
    })
    use("nanotech/jellybeans.vim")
    use({
        "rose-pine/neovim",
        as = "rose-pine",
    })
    use("yorickpeterse/vim-paper")

    -- Completion
    use("kdheepak/cmp-latex-symbols")
    use("quangnguyen30192/cmp-nvim-ultisnips")
    use("onsails/lspkind-nvim")

    -- snippets
    use("SirVer/ultisnips")
    use("honza/vim-snippets")

    -- LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })
    use("jose-elias-alvarez/null-ls.nvim") -- formatters and linters
    --use({ "glepnir/lspsaga.nvim", branch = "main" })

    -- DAP
    use({ "mfussenegger/nvim-dap-python" })
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

    -- Telescope
    use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use("nvim-telescope/telescope-fzy-native.nvim")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use({ "nvim-treesitter/nvim-treesitter-textobjects" }) -- More text motions
    use("nvim-treesitter/nvim-treesitter-context")

    -- nvim tree
    use({
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
    })

    -- Git
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")

    -- Utils
    use("Xuyuanp/nerdtree-git-plugin")
    use("ryanoasis/vim-devicons")
    use("vim-test/vim-test")
    use("tpope/vim-projectionist")
    use("tmhedberg/SimpylFold")
    use("scrooloose/nerdcommenter")
    use("liuchengxu/vim-which-key")
    use({
        "stsewd/isort.nvim",
        run = ":UpdateRemoteuseins",
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use({
        "nvim-neorg/neorg",
        requires = "nvim-lua/plenary.nvim",
    })
    use({
        "danymat/neogen",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use("mbbill/undotree")

    -- Quality of life
    use("karb94/neoscroll.nvim")
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
