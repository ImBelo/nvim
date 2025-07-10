return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      -- Main config
      local config = {
        cmd = {vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls')},
        root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
        settings = {
          java = {
            signatureHelp = { enabled = true },
            completion = {
              favoriteStaticMembers = {
                "org.junit.Assert.*",
                "org.junit.jupiter.api.Assertions.*",
                "org.mockito.Mockito.*"
              }
            }
          }
        },
        init_options = {
          bundles = {}
        },
      }

      -- Attach to Java files
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'java',
        callback = function()
          require('jdtls').start_or_attach(config)
          vim.notify("JDTLS attached successfully!")
        end,
      })
    end
  }
}
