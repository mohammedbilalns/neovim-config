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
  - [Language-Specific](#language-specific)
  - [Navigation/Productivity](#navigationproductivity)
  - [Debugging](#debugging)
  - [AI Tools](#ai-tools)
  - [General Purpose](#general-purpose)

## Features

- NvChad-based UI 
- LSP configuration via `nvim-lspconfig`, `mason.nvim`, and `mason-lspconfig.nvim`
- Completion using `nvim-cmp` + LuaSnip
- Treesitter highlighting with auto-install parsers
- Workflow utilities and fuzzy finding through the Snacks picker ecosystem
- Debugging support via `nvim-dap` and related DAP tooling
- AI integrations for smart coding assistance

## Prerequisites

Required:

- `git`
- `neovim >= 0.11`

Recommended:

- `fd`
- `ripgrep` (`rg`)

Optional (LaTeX/VimTeX Support):

To use the included LaTeX support (`vimtex`), you will need a TeX distribution and a supported PDF viewer:
- **TeX Distribution**: [TeX Live](https://www.tug.org/texlive/) (e.g., `texlive-full` on Ubuntu or `texlive-meta` on Arch Linux)
- **PDF Viewer**: [Zathura](https://pwmt.org/projects/zathura/) is configured as the default viewer for SyncTeX capabilities.
  - *Note*: Ensure you install a PDF backend for Zathura (like `zathura-pdf-mupdf` or `zathura-pdf-poppler`) and `xdotool` (for X11) for backward search functionality.

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
- `lua/lazy-config.lua` - lazy.nvim bootstrap and plugin imports (organized by category folders)
- `lua/chadrc.lua` - NvChad UI configuration
- `lua/lsp.lua` - LSP keymaps/diagnostic behavior on attach
- `lua/vim-options.lua` - core Neovim options
- `lua/core/` - core autocommands and keymaps
- `lua/plugins/` - plugin specs organized by category:
  - `ai/` - AI-powered completion and chat tools
  - `general/` - general purpose plugins (completion, treesitter, autopairs, productivity tools)
  - `language/` - language-specific configurations (TypeScript, etc.)
  - `lsp-dap/` - LSP servers, DAP debugging, Mason package manager
  - `navigation/` - file browsers, search/navigation
  - `ui/` - UI components (themes, statusline, tabline)
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
| [rachartier/tiny-cmdline.nvim](https://github.com/rachartier/tiny-cmdline.nvim) | Improved command line/messages UI |
| [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim) | Standalone UI for nvim-lsp progress |
| [szw/vim-maximizer](https://github.com/szw/vim-maximizer) | Toggle split/window maximize |
| [folke/snacks.nvim](https://github.com/folke/snacks.nvim) | Picker + utility modules (dashboard, grep, lazygit, etc.) |

### LSP, Completion, Formatting

| Plugin | Description |
| --- | --- |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configuration |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | Package manager for LSP servers, DAP adapters, linters, and formatters |
| [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges Mason with lspconfig |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completion source for cmp |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [nvimtools/none-ls.nvim](https://github.com/nvimtools/none-ls.nvim) | Integrates external formatters/diagnostics via LSP interface |
| [rachartier/tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim) | Inline diagnostics UI |
| [danymat/neogen](https://github.com/danymat/neogen) | Annotation generator |

### Treesitter/Languages

| Plugin | Description |
| --- | --- |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax tree parsing/highlighting |

### Language-Specific

| Plugin | Description |
| --- | --- |
| [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Auto-close/rename HTML/JSX/TSX tags |
| [dmmulroy/ts-error-translator.nvim](https://github.com/dmmulroy/ts-error-translator.nvim) | Better TS diagnostic messages |
| [devdammit/openapi.nvim](https://github.com/devdammit/openapi.nvim) | OpenAPI spec viewer |
| [lervag/vimtex](https://github.com/lervag/vimtex) | LaTeX support |

### Navigation/Productivity

| Plugin | Description |
| --- | --- |
| [folke/flash.nvim](https://github.com/folke/flash.nvim) | Fast jump/search motions |
| [DreamMaoMao/yazi.nvim](https://github.com/DreamMaoMao/yazi.nvim) | Yazi terminal file manager integration |
| [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim) | Filesystem editing buffer |
| [folke/trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics/symbol/location list UI |
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Shared Lua utility library |

### Debugging

| Plugin | Description |
| --- | --- |
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | UI panels for nvim-dap |

### AI Tools

| Plugin | Description |
| --- | --- |
| [supermaven-inc/supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim) | AI completion integration |
| [carlos-algms/agentic.nvim](https://github.com/carlos-algms/agentic.nvim) | Agentic chat integration |
| [nickjvandyke/opencode.nvim](https://github.com/nickjvandyke/opencode.nvim) | AI coding assistant |

### General Purpose

| Plugin | Description |
| --- | --- |
| [TheNoeTrevino/haunt.nvim](https://github.com/TheNoeTrevino/haunt.nvim) | Persistent annotations/bookmarks |
| [nemanjamalesija/smart-paste.nvim](https://github.com/nemanjamalesija/smart-paste.nvim) | Context-aware paste behavior |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and navigate TODO/FIX comments |
| [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Render markdown styling in buffer |
| [barrett-ruth/live-server.nvim](https://github.com/barrett-ruth/live-server.nvim) | Start/stop local live-server |
| [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes |
| [chrisgrieser/nvim-chainsaw](https://github.com/chrisgrieser/nvim-chainsaw) | Log statement generator |
| [okuuva/auto-save.nvim](https://github.com/okuuva/auto-save.nvim) | Auto-save buffers |
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git integration |
