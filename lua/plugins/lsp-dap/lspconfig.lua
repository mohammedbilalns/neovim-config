-- LSP configuration using nvim-lspconfig
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Set global defaults for all LSP servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Configure TypeScript/JavaScript servers
    --
    -- prefer TypeScript 7's native language server (`tsc --lsp`) when available
    -- and use `ts_ls` only as a fallback for workspaces on TypeScript < 7.
    local ts_root_markers = {
      "package-lock.json",
      "yarn.lock",
      "pnpm-lock.yaml",
      "bun.lockb",
      "bun.lock",
      ".git",
    }

    local native_ts_cache = {}
    local function native_ts_bin(root)
      if native_ts_cache[root] == nil then
        native_ts_cache[root] = false
        local candidates = {
          vim.fs.joinpath(root, "node_modules", ".bin", "tsc"),
          "tsc",
        }
        for _, bin in ipairs(candidates) do
          if vim.fn.executable(bin) == 1 then
            local out = vim.system({ bin, "--version" }, { text = true }):wait()
            local version = vim.version.parse(out.stdout or "")
            if out.code == 0 and version ~= nil and version.major >= 7 then
              native_ts_cache[root] = bin
              break
            end
          end
        end
      end
      return native_ts_cache[root]
    end

    vim.lsp.config("tsc", {
      -- Resolve the binary ourselves: the upstream config caches it in a
      -- closure that is not shared with an overridden root_dir.
      cmd = function(dispatchers, config)
        local root = type(config.root_dir) == "string" and config.root_dir or vim.fn.getcwd()
        local bin = native_ts_bin(root) or "tsc"
        return vim.lsp.rpc.start({ bin, "--lsp", "--stdio" }, dispatchers)
      end,
      root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, ts_root_markers) or vim.fn.getcwd()
        -- Only start the native server for TypeScript >= 7 workspaces.
        if native_ts_bin(root) then
          on_dir(root)
        end
      end,
      settings = {
        ["js/ts"] = {
          format = {
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          },
          suggest = {
            autoImports = true,
            includeCompletionsForImportStatements = true,
          },
        },
      },
    })

    vim.lsp.config("ts_ls", {
      root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, ts_root_markers) or vim.fn.getcwd()
        if native_ts_bin(root) then
          return -- the native `tsc` server handles this workspace
        end
        on_dir(root)
      end,
      settings = {
        typescript = {
          preferences = {
            includeCompletionsForModuleExports = true,
            includePackageJsonAutoImports = "on",
          },
          format = {
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          },
          suggest = {
            autoImports = true,
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
          },
        },
        javascript = {
          preferences = {
            includeCompletionsForModuleExports = true,
            includePackageJsonAutoImports = "on",
          },
          format = {
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          },
          suggest = {
            autoImports = true,
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
          },
        },
      },
    })

    vim.lsp.config("graphql", {
      filetypes = {
        "graphql",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
      root_dir = function(bufnr, on_dir)
        local graphql_root_markers = {
          ".graphqlrc",
          ".graphqlrc.json",
          ".graphqlrc.yml",
          ".graphqlrc.yaml",
          ".graphqlrc.js",
          ".graphqlrc.ts",
          ".graphql.config.js",
          ".graphql.config.ts",
          "graphql.config.js",
          "graphql.config.ts",
          "package-lock.json",
          "yarn.lock",
          "pnpm-lock.yaml",
          "bun.lockb",
          "bun.lock",
          ".git",
        }
        on_dir(vim.fs.root(bufnr, graphql_root_markers) or vim.fn.getcwd())
      end,
    })

    vim.lsp.config("html", {
      filetypes = { "html", "templ", "ejs" },
    })

    vim.lsp.config("emmet_language_server", {
      filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "ejs" },
    })

    -- Enable all configured LSPs
    vim.lsp.enable({
      "graphql",
      "tsc",
      "ts_ls", -- fallback for TypeScript < 7 workspaces
      "html",
      "emmet_language_server",
    })
  end,
}
