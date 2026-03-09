# Neovim Config

My Personal Neovim Config Powered by [lazy.nvim](https://github.com/folke/lazy.nvim).

https://github.com/user-attachments/assets/856fdf17-8156-496d-b357-28b85cc6ff19



## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Install](#install)
- [Project Structure](#project-structure)
- [Extending This Config](#extending-this-config)
- [Plugins Included](#plugins-included)
  - [Core/UI](#coreui)
  - [LSP, Completion, Formatting](#lsp-completion-formatting)
  - [Treesitter/Languages](#treesitterlanguages)
  - [Navigation/Productivity](#navigationproductivity)
  - [Debugging](#debugging)

## Features

- NvChad-based UI 
- LSP configuration via `nvim-lspconfig`, `mason.nvim`, and `mason-lspconfig.nvim`
- Completion using `nvim-cmp` + LuaSnip + Supermaven source
- Treesitter highlighting with auto-install parsers
- Workflow utilities and fuzzy finding through the Snacks picker ecosystem
- Project/session Mangement via `neovim-project` + `neovim-session-manager`
- Debugging support via `nvim-dap` and related DAP tooling

## Prerequisites

Required:

- `git`
- `neovim >= 0.11`

Recommended:
- `fd`
- `ripgrep` (`rg`)

## Install

1. Backup existing config:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone this repository:

```bash
git clone https://github.com/mohammedbilalns/neovim-config ~/.config/nvim
```

3. Start Neovim:

```bash
nvim
```

4. Run health checks:

```vim
:checkhealth
```


## Project Structure

- `init.lua` - main entry point
- `lua/lazy-config.lua` - lazy.nvim bootstrap and plugin imports
- `lua/chadrc.lua` - NvChad UI configuration
- `lua/lsp.lua` - LSP keymaps/diagnostic behavior on attach
- `lua/plugins/` - plugin specs
- `lua/plugins/lsp/` - LSP-related specs
- `after/` - runtime overrides

## Extending This Config

### Add a plugin

1. Create `lua/plugins/<name>.lua`
2. Return a Lazy spec 

Example:

```lua
return {
  "foo/foo.nvim",
  opts = {},
}
```

## Plugins Included

### Core/UI

| Plugin | Description |
| --- | --- |
| [NvChad/base46](https://github.com/NvChad/base46) | Theme engine and highlight base |
| [NvChad/ui](https://github.com/NvChad/ui) | NvChad UI components (statusline/tabline/term helpers) |
| [nvzone/menu](https://github.com/nvzone/menu) | Menu UI utilities |
| [nvzone/volt](https://github.com/nvzone/volt) | UI toolkit used by NvChad components |
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hint popup |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) | Improved command line/messages UI |
| [folke/snacks.nvim](https://github.com/folke/snacks.nvim) | Picker + utility modules (dashboard, grep, lazygit, etc.) |

### LSP, Completion, Formatting

| Plugin | Description |
| --- | --- |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configuration |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | External tool manager |
| [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges Mason with lspconfig |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completion source for cmp |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [nvimtools/none-ls.nvim](https://github.com/nvimtools/none-ls.nvim) | Integrates external formatters/diagnostics via LSP interface |
| [supermaven-inc/supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim) | AI completion integration |
| [dmmulroy/ts-error-translator.nvim](https://github.com/dmmulroy/ts-error-translator.nvim) | Better TS diagnostic messages |
| [Zeioth/garbage-day.nvim](https://github.com/Zeioth/garbage-day.nvim) | LSP memory cleanup helper |

### Treesitter/Languages

| Plugin | Description |
| --- | --- |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax tree parsing/highlighting |
| [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Auto-close/rename HTML-like tags |
| [imsnif/kdl.vim](https://github.com/imsnif/kdl.vim) | KDL syntax support |
| [nvim-flutter/flutter-tools.nvim](https://github.com/nvim-flutter/flutter-tools.nvim) | Flutter/Dart tooling |

### Navigation/Productivity

| Plugin | Description |
| --- | --- |
| [folke/flash.nvim](https://github.com/folke/flash.nvim) | Fast jump/search motions |
| [folke/trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics/symbol/location list UI |
| [coffebar/neovim-project](https://github.com/coffebar/neovim-project) | Project switching + startup session logic |
| [DreamMaoMao/yazi.nvim](https://github.com/DreamMaoMao/yazi.nvim) | Yazi terminal file manager integration |
| [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim) | Filesystem editing buffer |
| [TheNoeTrevino/haunt.nvim](https://github.com/TheNoeTrevino/haunt.nvim) | Persistent annotations/bookmarks |
| [nemanjamalesija/smart-paste.nvim](https://github.com/nemanjamalesija/smart-paste.nvim) | Context-aware paste behavior |
| [szw/vim-maximizer](https://github.com/szw/vim-maximizer) | Toggle split/window maximize |
| [brenoprata10/nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) | Inline color previews |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and navigate TODO/FIX comments |
| [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Render markdown styling in buffer |
| [barrett-ruth/live-server.nvim](https://github.com/barrett-ruth/live-server.nvim) | Start/stop local live-server |
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Shared Lua utility library |
| [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes |

### Debugging

| Plugin | Description |
| --- | --- |
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | UI panels for nvim-dap |


