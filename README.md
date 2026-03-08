# Personal Neovim Config

## Core Plugins

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) (plugin manager)
- [NvChad/ui](https://github.com/NvChad/ui)
- [folke/snacks.nvim](https://github.com/folke/snacks.nvim)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)

## Installation

1. Backup existing config (optional):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```
2. Clone this config:
   ```bash
   git clone https://github.com/mohammedbilalns/neovim-config ~/.config/nvim
   ```
3. Start Neovim:
   ```bash
   nvim
   ```

## Requirements

- Neovim `>= 0.11`
- `git`
- `ripgrep` (`rg`)
- `fd` (recommended for picker/file search)
- `node` and `npm` (for some LSP/DAP tools)
- `go` + `dlv` (if using Go debugging)
