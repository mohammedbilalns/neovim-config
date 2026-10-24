local ok, jdtls = pcall(require, "jdtls")
if not ok then
  return
end

local mason_registry = require("mason-registry")

local java_25_bin = "/usr/lib/jvm/java-25-openjdk/bin/java"
local java_cmd = vim.fn.executable(java_25_bin) == 1 and java_25_bin or "java"

local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_dir = jdtls_path .. "/config_linux"

local root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", "settings.gradle", "settings.gradle.kts", ".git", "mvnw", "gradlew" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if not root_dir or root_dir == "" then
  root_dir = vim.fn.getcwd()
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

-- Collect debug/test extension bundles
local bundles = {}

local function collect_bundles(package_name, pattern)
  if mason_registry.is_installed(package_name) then
    local pkg_path = mason_registry.get_package(package_name):get_install_path()
    local jars = vim.fn.glob(pkg_path .. pattern, true, true)
    vim.list_extend(bundles, jars)
  end
end

collect_bundles("java-debug-adapter", "/extension/server/com.microsoft.java.debug.plugin-*.jar")
collect_bundles("java-test", "/extension/server/*.jar")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local config = {
  cmd = {
    java_cmd,

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=WARN",

    "-Xms1g",
    "-Xmx2g",
    "-XX:+UseG1GC",
    "-XX:+UseStringDeduplication",
    "-XX:MaxGCPauseMillis=200",
    "-XX:GCTimeRatio=4",
    "-XX:AdaptiveSizePolicyWeight=90",
    "-Dsun.zip.disableMemoryMapping=true",

    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    "-jar", launcher_jar,
    "-configuration", config_dir,
    "-data", workspace_dir,
  },

  root_dir = root_dir,
  capabilities = capabilities,

  settings = {
    java = {
      telemetry = { enabled = false },
      referencesCodeLens = { enabled = false },
      implementationsCodeLens = { enabled = false },
      signatureHelp = { enabled = true },
      saveActions = { organizeImports = false },
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      configuration = { updateBuildConfiguration = "interactive" },
      import = {
        gradle = { enabled = true, wrapper = { enabled = true } },
        maven = { enabled = true },
        generatesMetadataFilesAtProjectRoot = false,
      },
      completion = {
        enabled = true,
        maxResults = 30,
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.Assume.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    },
  },

  init_options = {
    bundles = bundles,
  },

  on_attach = function(_, bufnr)
    local opts = function(desc)
      return { buffer = bufnr, silent = true, desc = desc }
    end

    vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, opts("Organize imports"))
    vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, opts("Extract variable"))
    vim.keymap.set("v", "<leader>jv", function() jdtls.extract_variable(true) end, opts("Extract variable"))
    vim.keymap.set("n", "<leader>jc", jdtls.extract_constant, opts("Extract constant"))
    vim.keymap.set("v", "<leader>jc", function() jdtls.extract_constant(true) end, opts("Extract constant"))
    vim.keymap.set("v", "<leader>jm", function() jdtls.extract_method(true) end, opts("Extract method"))
    vim.keymap.set("n", "<leader>jt", jdtls.test_nearest_method, opts("Test nearest method"))
    vim.keymap.set("n", "<leader>jT", jdtls.test_class, opts("Test class"))

    jdtls.setup_dap({ hotcodereplace = "auto" })
  end,
}

jdtls.start_or_attach(config)
