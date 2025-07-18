return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java", -- Only load for Java files
    opts = function()
      local home = os.getenv("HOME")
      local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = workspace_path .. project_name

      return {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
          "-jar",
          vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
          "-configuration",
          home .. "/.local/share/nvim/mason/packages/jdtls/config_mac",
          "-data",
          workspace_dir,
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
        settings = {
          java = {
            signatureHelp = { enabled = true },
            extendedClientCapabilities = require("jdtls").extendedClientCapabilities,
            maven = { downloadSources = true },
            referencesCodeLens = { enabled = true },
            references = { includeDecompiledSources = true },
            inlayHints = {
              parameterNames = { enabled = "all" },
            },
            format = { enabled = false },
          },
        },
        init_options = {
          bundles = {},
        },
      }
    end,
    config = function(_, opts)
      -- Attach JDTLS when a Java file is opened
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          require("jdtls").start_or_attach(opts)
        end,
      })

      -- Keymaps
      local map = vim.keymap.set
      map("n", "<leader>co", "<Cmd>lua require('jdtls').organize_imports()<CR>", { desc = "Organize Imports" })
      map("n", "<leader>crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = "Extract Variable" })
      map("v", "<leader>crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = "Extract Variable" })
      map("n", "<leader>crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = "Extract Constant" })
      map("v", "<leader>crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { desc = "Extract Constant" })
      map("v", "<leader>crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = "Extract Method" })
    end,
  },
}
